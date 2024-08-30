table 50901 "sales lineX"
{
    Caption = 'sales lineX';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document NO."; Code[20])
        {
            Caption = 'Document NO.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Line Type"; enum "line type X")
        {
            Caption = 'Line Type';
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if ("Line Type" = const(" ")) "sales lineX" else
            if ("Line Type" = const(Item)) "Item X" else
            if ("Line Type" = const("Fix Asset")) "Fixed Asset"
            else
            if ("Line Type" = const("GL Account")) "G/L Account";

            trigger OnValidate()
            var
                ItemX: Record "Item X";
                GLAcc: Record "G/L Account";
                ItemXCat: Record "Item X Category";
            begin
                if "Line Type" = "Line Type"::Item then begin
                    ItemX.Get("No.");
                    ItemX.TestField("UnitCost");
                    ItemX.TestField("Item X Category");

                    ItemXCat.Get(ItemX."Item X Category");

                    Description := ItemX.Name;
                    Validate("Unit Price", ItemX.UnitCost * ItemXCat."Margin Per" + ItemX.UnitCost);
                end else
                    if "Line Type" = "Line Type"::"GL Account" then begin
                        GLAcc.Get("No.");
                        Description := GLAcc.Name;
                    end;
            end;
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(6; "Unit price"; Decimal)
        {
            Caption = 'Unit price';
            trigger OnValidate()
            begin
                "Total Line Amount" := "Unit price" * Quantity;
            end;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                "Total Line Amount" := "Unit price" * Quantity;
            end;
        }
        field(8; "Total Line Amount"; Decimal)
        {
            Caption = 'Total Line Amount';
        }
    }
    keys
    {
        key(PK; "Document NO.", "Line No.")
        {
            Clustered = true;
        }
    }
}
