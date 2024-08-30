page 50906 "Vat Posting Setup X"
{
    ApplicationArea = All;
    Caption = 'Vat Posting Setup X';
    PageType = List;
    SourceTable = "Vat Posting Group X";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Cust Posting X"; Rec."Cust Posting X")
                {
                    ToolTip = 'Specifies the value of the Cust Posting X field.';
                }
                field("Item Bus. Post Group"; Rec."Item Bus. Post Group")
                {
                    ToolTip = 'Specifies the value of the Item Bus. Post Group field.';
                }
                field("VAT %"; Rec."VAT %")
                {
                    ToolTip = 'Specifies the value of the VAT % field.';
                }
                field("GL Acc"; Rec."GL Acc")
                {
                    ToolTip = 'Specifies the value of the VAT % field.';
                }
                field("Bal. GL Acc"; Rec."Bal. GL Acc")
                {
                    ToolTip = 'Specifies the value of the VAT % field.';
                }
            }
        }
    }
}