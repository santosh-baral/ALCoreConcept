page 50911 "Posted Sales order list X"
{
    ApplicationArea = All;
    Caption = 'Posted Sales Order List';
    PageType = List;
    SourceTable = "posted Sales Header X";
    UsageCategory = Lists;
    CardPageId = "posted Sales Order card X";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
    // myInt: Integer;
    // salesHeader: Record "Posted Sales Header X";
    // salesheader1: Record "Posted Sales Header X";
    begin
        // salesHeader.Reset();
        // salesHeader.
        rec.SetRange("Document Date", Today);
        // if salesHeader.FindSet() then
        //     repeat

        //     until salesHeader.Next() = 0;


    end;
}