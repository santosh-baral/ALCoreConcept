table 50912 "Posted Sales Line X"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Line Type"; Enum "Line Type X")
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No."; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Line Type" = const(" ")) "Standard Address" else
            if ("Line Type" = const(Item)) "Item X" else
            if ("Line Type" = const("Fix Asset")) "Fixed Asset"
            else
            if ("Line Type" = const("GL Account")) "G/L Account";


        }
        field(5; Descrption; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(7; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;



        }
        field(8; "Total Line Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
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