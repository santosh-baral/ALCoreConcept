pageextension 50904 ExtGenJor extends "General Journal"
{
    layout
    {
        addafter(Amount)
        {
            field("Sales Header X"; rec."Sales Header X")
            {
                ApplicationArea = All;
                //FieldPropertyName = FieldPropertyValue;
            }
        }
    }
}
