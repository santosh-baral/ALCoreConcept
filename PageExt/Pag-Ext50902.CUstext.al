pageextension 50902 "CUst ext" extends "Customer Card"
{
    layout
    {

        addafter("No.")
        {
            field("customer Posting x"; Rec."custumer posting x")
            {
                ApplicationArea = All;
                // FieldPropertyName = FieldPropertyValue;
            }
        }
    }
}
