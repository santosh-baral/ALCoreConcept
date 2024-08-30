pageextension 50905 "user setup" extends "User Setup"
{
    layout
    {
        addafter("Register Time")
        {
            field("is sales entry"; Rec."is sales entry")
            {
                ApplicationArea = All;
                //FieldPropertyName = FieldPropertyValue;
            }
            field("Can post"; Rec."Can post")
            {
                ApplicationArea = All;
                //FieldPropertyName = FieldPropertyValue;
            }
            field("Can Report view"; Rec."Can Report view")
            {
                ApplicationArea = All;
                //FieldPropertyName = FieldPropertyValue;
            }
        }

    }


}
