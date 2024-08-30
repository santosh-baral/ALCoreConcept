codeunit 50900 "posting mgt"
{
    trigger OnRun()
    begin

    end;

    procedure postSalesBill(SalesHeraderX: Record "Sales Header X")
    var
        PostedSalesHeader: Record "Posted Sales Header X";
        PostedSalesLine: Record "Posted Sales Line X";
        SalesLineX: Record "Sales LineX";
        ItemX: Record "Item X";
        ItemXCat: Record "Item X Category";
        Customer: Record Customer;
    begin
        if not Confirm('Do you want to post', false) then
            exit;


        SalesHeraderX.TestField("Customer No");
        Customer.get(SalesHeraderX."Customer No");
        Customer.TestField("custumer posting x");

        PostedSalesHeader.Init();
        PostedSalesHeader.TransferFields(SalesHeraderX);
        PostedSalesHeader.Insert(true);

        SalesLineX.Reset();
        SalesLineX.SetRange("Document No.", SalesHeraderX."No.");
        SalesLineX.SetFilter("No.", '<>%1', '');
        if SalesLineX.FindSet() then
            repeat
                if SalesLineX."Line Type" = SalesLineX."Line Type"::Item then begin
                    ItemX.Get(SalesLineX."No.");
                    ItemX.TestField("Item X Category");
                    ItemX.CalcFields(Inventory);
                    if ItemX.Inventory <= 0 then
                        Error('You do not have inventory.');
                    ItemXCat.Get(ItemX."Item X Category");
                    ItemXCat.TestField("Item Bus. Posting Group");

                end;

                PostedSalesLine.Init();
                PostedSalesLine.TransferFields(SalesLineX);
                PostedSalesLine.Insert();

                insertItemLedgerX(SalesLineX, Customer, ItemXCat, ItemX);
                SalesLineX.Delete();
            until SalesLineX.Next() = 0;
        SalesHeraderX.Delete();

        if not Confirm('The documnet has been posted. Do you want to open posted Document?', false) then
            exit;
        Page.Run(Page::"Posted Sales Order Card X", PostedSalesHeader);
        // CurrPage.Close(); //we will still do this in page

    end;










    local procedure insertItemLedgerX(SalesLineX: Record "Sales LineX"; Customer: Record Customer; ItemXCar: Record "Item X Category"; ItemX: Record "Item X")
    var
        ItemLedgerEntry: Record "Item Ledger Entry X";
        VatPostX: Record "Vat Posting Group X";

    begin
        ItemLedgerEntry.Init();
        ItemLedgerEntry."Document No." := SalesLineX."Document No.";
        ItemLedgerEntry.Type := ItemLedgerEntry.Type::Sales;
        //ItemLedgerEntry."No." := SalesLineX."No.";
        ItemLedgerEntry.Quantity := -SalesLineX.Quantity;
        ItemLedgerEntry.Amount := SalesLineX."Total Line Amount";
        ItemLedgerEntry."Unit Price" := SalesLineX."Unit Price";
        ItemLedgerEntry."Posting Date" := Today;
        VatPostX.Get(Customer."custumer posting x", ItemXCar."Item Bus. Posting Group");
        ItemLedgerEntry."VAT Amount" := getVatAmount(SalesLineX, VatPostX); //here we calulate and get return
        getDisAmount(ItemX, ItemLedgerEntry); //we dont get return but pass instance and get vlue to it
        ItemLedgerEntry."Amount After Tax" := SalesLineX."Total Line Amount" + ItemLedgerEntry."VAT Amount" - ItemLedgerEntry."Discount Amount";
        ItemLedgerEntry.Insert(true);
        sendtoalAmountInroHeader(ItemLedgerEntry);

    end;

    local procedure getVatAmount(SLX: Record "Sales LineX"; VATX: Record "Vat Posting Group X"): Decimal
    var
    begin
        exit(SLX."Total Line Amount" * (vatx."VAT %" / 100));
    end;

    local procedure getDisAmount(ItemX: Record "Item X"; var ItemLedger: Record "Item Ledger Entry X")
    begin
        ItemLedger."Discount Amount" := ItemX."Discount %" * ItemLedger.Amount;
    end;

    local procedure sendtoalAmountInroHeader(ItemL: Record "Item Ledger Entry X")
    var
        PostedSalesXHdr: Record "Posted Sales Header X";
    begin
        PostedSalesXHdr.Get(ItemL."Document No.");
        PostedSalesXHdr."Total Amount" += ItemL."Amount After Tax";
        PostedSalesXHdr.Modify();
    end;







    procedure postVATThroughGenJounral(VATX: Record "Vat Posting Group X"; VATAmt: Decimal; SHCode: Code[20])
    var
        GenJournalLine: Record "Gen. Journal Line";
        SalesSetup: Record "Sales & Receivables Setup";
        GenJnlLine1: Record "Gen. Journal Line";
        lineNo: Integer;
        GenJournalPost: Codeunit "Gen. Jnl.-Post Line";
        docno: Code[20];

    begin
        SalesSetup.Get();
        lineNo := 0;

        docno := '';
        docno := 'RA-' + Format(Random((9999)));

        GenJnlLine1.Reset();
        GenJnlLine1.SetRange("Journal Template Name", SalesSetup."VAT Template");
        GenJnlLine1.SetRange("Journal Batch Name", SalesSetup."VAT Batch");
        if GenJnlLine1.FindLast() then
            lineNo := GenJnlLine1."Line No." + 10000
        else
            lineNo := 10000;

        GenJournalLine.Init(); //debit line
        GenJournalLine.Validate(GenJournalLine."Journal Template Name", SalesSetup."VAT Template");
        GenJournalLine.Validate(GenJournalLine."Journal Batch Name", SalesSetup."VAT Batch");
        GenJournalLine.Validate("Document No.", docno);
        GenJournalLine.Validate(GenJournalLine."Line No.", lineNo);
        GenJournalLine.Validate(GenJournalLine."Account Type", GenJournalLine."Account Type"::"G/L Account");
        GenJournalLine.Validate(GenJournalLine."Account No.", VATX."GL Acc");
        GenJournalLine.Validate(GenJournalLine.Amount, VATAmt);
        GenJournalLine.Validate("Posting Date", Today);
        GenJournalLine."Sales Header X" := SHCode;
        GenJournalLine.Insert(true);
        GenJournalPost.RunWithCheck(GenJournalLine);
        GenJournalLine.Delete();


        GenJournalLine.Init(); //credit line
        GenJournalLine.Validate(GenJournalLine."Journal Template Name", SalesSetup."VAT Template");
        GenJournalLine.Validate(GenJournalLine."Journal Batch Name", SalesSetup."VAT Batch");
        GenJournalLine.Validate("Document No.", docno);
        GenJournalLine.Validate(GenJournalLine."Line No.", lineNo + 10000);
        GenJournalLine.Validate(GenJournalLine."Account Type", GenJournalLine."Account Type"::"G/L Account");
        GenJournalLine.Validate(GenJournalLine."Account No.", VATX."Bal. GL Acc");
        GenJournalLine.Validate(GenJournalLine.Amount, -VATAmt); //Since it is credit
        GenJournalLine.Validate("Posting Date", Today);
        GenJournalLine."Sales Header X" := SHCode;
        GenJournalLine.Insert(true);
        GenJournalPost.RunWithCheck(GenJournalLine);
        GenJournalLine.Delete();


    end;




    procedure insertIntoCustomerLedger(SalesHeaderX: Record "Sales Header X")
    var
        CustomerLedger: Record "Cust. Ledger Entry";
        CustomerLedger1: Record "Cust. Ledger Entry";
        DetailedCust: Record "Detailed Cust. Ledg. Entry";
        DetailedCust1: Record "Detailed Cust. Ledg. Entry";

    begin

        CustomerLedger.Init();
        CustomerLedger1.Reset();
        if CustomerLedger1.FindLast() then
            CustomerLedger."Entry No." := CustomerLedger1."Entry No." + 1
        else
            CustomerLedger."Entry No." := 1;

        CustomerLedger."Customer No." := SalesHeaderX."Customer No";
        CustomerLedger."Posting Date" := Today;
        CustomerLedger."Document No." := SalesHeaderX."No.";
        CustomerLedger.Open := true;
        CustomerLedger.Insert(true);

        DetailedCust.Init();
        DetailedCust1.Reset();
        if DetailedCust1.FindLast() then
            DetailedCust."Entry No." := DetailedCust1."Entry No." + 1
        else
            DetailedCust."Entry No." := 1;

        DetailedCust."Cust. Ledger Entry No." := CustomerLedger."Entry No.";
        DetailedCust."Entry Type" := DetailedCust."Entry Type"::"Initial Entry";
        DetailedCust."Customer No." := SalesHeaderX."Customer No";
        DetailedCust."Posting Date" := Today;
        DetailedCust."Document No." := SalesHeaderX."No.";
        SalesHeaderX.CalcFields("Total Amount");
        DetailedCust.Amount := SalesHeaderX."Total Amount";
        DetailedCust."Amount (LCY)" := SalesHeaderX."Total Amount";
        DetailedCust.Insert(true);

        Message('Done');
    end;






}