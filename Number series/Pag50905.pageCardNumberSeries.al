page 50905 pageCardNumberSeries
{
    ApplicationArea = All;
    Caption = 'pageCardNumberSeries';
    PageType = List;
    SourceTable = TabNumberSeries;
    UsageCategory = Lists;
    CardPageId = pagenumberseries;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
