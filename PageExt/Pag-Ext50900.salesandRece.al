pageextension 50900 "sales and Rece" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Document Default Line Type")
        {
            field("Sales Header X Nos"; Rec."Sales Header X Nos")
            {
                ApplicationArea = All;

            }
            field("Noseries"; rec."No series")
            {
                ApplicationArea = all;
            }
            field("VAT Template"; Rec."VAT Template")
            {
                ApplicationArea = All;
                //FieldPropertyName = FieldPropertyValue;
            }
            field("VAT Batch"; Rec."VAT Batch")
            {
                ApplicationArea = All;
                // FieldPropertyName = FieldPropertyValue;
            }


        }

    }
}
