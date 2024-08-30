pageextension 50903 EXtGL extends "General Ledger Entries"
{
    layout
    {
        addafter(Amount)
        {
            field("Sales Header X"; Rec."Sales Header X")
            {
                ApplicationArea = All;
                //FieldPropertyName = FieldPropertyValue;
            }
        }
    }
}
