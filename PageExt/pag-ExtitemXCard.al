pageextension 50901 ItemXCardExt extends "ItemXX"
{
    layout
    {
        addafter("Item Type")
        {
            field("Item X Category"; Rec."Item X Category")
            {
                ApplicationArea = All;
                //  FieldPropertyName = FieldPropertyValue;
            }
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = All;
                DrillDownPageId = "Item Ledger Entry X";
                //  FieldPropertyName = FieldPropertyValue;
            }

        }
    }
}