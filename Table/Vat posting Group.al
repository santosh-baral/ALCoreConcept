table 50921 "Vat Posting Group X"
{
    DataClassification = ToBeClassified;

    fields
    {

        field(2; "Cust Posting X"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","No Vat","13 Vat","5 Vat";
        }
        field(4; "Item Bus. Post Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Sales","Purchase","None";
        }
        field(5; "VAT %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(6; "GL Acc"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(7; "Bal. GL Acc"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(PK; "Cust Posting X", "Item Bus. Post Group")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

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