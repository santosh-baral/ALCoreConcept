page 50910 "Cue page sales x"
{
    // ApplicationArea = All;
    Caption = 'Cue page sales x';
    PageType = CardPart;
    SourceTable = "Sales & Receivables Setup";

    layout
    {
        area(Content)
        {
            cuegroup("sales X cues")
            {
                field("Total Sales today COunt"; Rec."Total Sales today COunt")
                {
                    ApplicationArea = All;
                    Style = Standard;
                    trigger OnDrillDown()
                    var
                        PosSalesHeaderX: Record "Posted Sales Header X";
                    begin
                        PosSalesHeaderX.Reset();
                        PosSalesHeaderX.SetRange("Document Date", Today);
                        Page.Run(Page::"Posted Sales order list X", PosSalesHeaderX);
                    end;
                }

            }
            cuegroup("Amount")
            {

                field("Total Sales Today Amount"; Rec."Total Sales Today Amount")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        PosSalesHeaderX: Record "Posted Sales Header X";
                    begin
                        PosSalesHeaderX.Reset();
                        PosSalesHeaderX.SetRange("Document Date", Today);
                        Page.Run(Page::"Posted Sales order list X", PosSalesHeaderX);
                    end;
                }
            }

        }
    }
}
