page 50900 "Sales Order X subform"
{
    ApplicationArea = All;
    Caption = 'Sales Order X subform';
    PageType = ListPart;
    SourceTable = "sales lineX";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document NO."; Rec."Document NO.")
                {
                    ToolTip = 'Specifies the value of the Document NO. field.';
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
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
