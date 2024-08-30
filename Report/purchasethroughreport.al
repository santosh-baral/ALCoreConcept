report 50903 "Purchase Through report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Integer; Integer)
        {
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                SetRange(Number, 1);
                PurchasePost();
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(itemno; itemno)
                    {
                        ApplicationArea = All;
                        Caption = 'item no';
                        TableRelation = "Item X";

                    }
                    field(amount; amount)
                    {
                        ApplicationArea = All;

                    }
                    field(quantity; quantity)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    local procedure PurchasePost()
    var
        ItemLedgerEntryX: Record "Item Ledger Entry X";
        ItemLedgerENtryX1: record "Item Ledger Entry X";
    begin
        if (amount = 0) or (quantity = 0) or (itemno = '') then
            Error('Amount , Quantity and Item no must have value.');

        ItemLedgerEntryX.Init();
        ItemLedgerENtryX1.Reset();
        if ItemLedgerENtryX1.FindLast() then
            ItemLedgerEntryX."Entry No." := ItemLedgerENtryX1."Entry No." + 1
        else
            ItemLedgerEntryX."Entry No." := 1;
        ItemLedgerEntryX."No." := itemno;
        ItemLedgerEntryX.Amount := amount;
        ItemLedgerEntryX.Type := ItemLedgerEntryX.Type::Purchase;
        ItemLedgerEntryX."Posting Date" := Today;
        ItemLedgerEntryX."Unit Price" := amount / quantity;
        ItemLedgerEntryX.Quantity := quantity;
        ItemLedgerEntryX.Insert(true);

    end;


    var
        myInt: Integer;
        itemno: Code[20];
        quantity: Integer;
        amount: Decimal;
}