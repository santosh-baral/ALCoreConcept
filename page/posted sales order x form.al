page 50913 "Posted Sales Order X Subform"
{
    // ApplicationArea = All;
    Caption = 'Poste Sales Order X Subform';
    PageType = ListPart;
    SourceTable = "Posted Sales Line X";
    AutoSplitKey = true;
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Descrption; Rec.Descrption)
                {
                    ToolTip = 'Specifies the value of the Descrption field.';
                    Editable = false;
                }
                field("Line Type"; Rec."Line Type")
                {
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Total Line Amount"; Rec."Total Line Amount")
                {
                    ToolTip = 'Specifies the value of the Total Line Amount field.';
                    Editable = false;
                }
            }
        }
    }

}