page 50901 "Item X Category"
{
    ApplicationArea = All;
    Caption = 'Item X Category';
    PageType = List;
    SourceTable = "Item X Category";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("code"; Rec."code")
                {
                    ToolTip = 'Specifies the value of the code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("margin per"; Rec."margin per")
                {
                    ToolTip = 'Specifies the value of the margin per field.';
                }
                field("item bus. post group"; Rec."Item Bus. Posting Group")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}
