page 50908 "Item x list part"
{
    // ApplicationArea = All;
    Caption = 'Item x list part';
    PageType = ListPart;
    SourceTable = "Item X";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Unit Cost"; Rec.UnitCost)
                {
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
            }
        }
    }
}
