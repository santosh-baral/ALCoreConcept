tableextension 50903 extItem extends "Item X"
{
    fields
    {

        field(50900; "Item X III"; Code[20])
        {
            Caption = 'Item X III';
            DataClassification = ToBeClassified;
        }
        field(50901; "Item X Category"; Code[20])
        {
            Caption = 'Item X Category';
            DataClassification = ToBeClassified;
            TableRelation = "Item X Category";
        }
        field(50902; inventory; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry X".Quantity where("No." = field(No)));
        }
    }
}
