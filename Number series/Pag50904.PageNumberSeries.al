page 50904 PageNumberSeries
{
    // ApplicationArea = All;
    Caption = 'PageNumberSeries';
    PageType = Card;
    SourceTable = TabNumberSeries;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }

            }
        }
    }
}
