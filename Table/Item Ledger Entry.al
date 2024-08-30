table 50909 "Item Ledger Entry X"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Type; Option)
        {
            //DataClassification = ToBeClassified;
            OptionMembers = " ","Sales","Purchase";
        }
        field(4; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Discount Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Amount After Tax"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        ItemLedgerx: Record "Item Ledger Entry X";
    begin
        ItemLedgerx.Reset();
        if ItemLedgerx.FindLast() then
            "Entry No." := ItemLedgerx."Entry No." + 1
        else
            "Entry No." := 1;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}