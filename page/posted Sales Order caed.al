page 50912 "Posted Sales Order Card X"
{
    ApplicationArea = All;
    Caption = 'Posted Sales Order card X';
    PageType = Card;
    SourceTable = "Posted Sales Header X";
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Cretaed User ID"; Rec."Cretaed User ID")
                {
                    ToolTip = 'Specifies the value of the Cretaed User ID field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
            part("Sales Order Subform"; "Posted Sales Order X Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                Visible = not isallowed;
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    postedSalesheaderX: Record "Posted Sales Header X";

                begin

                    postedSalesheaderX.SetRange("No.", Rec."No.");
                    Report.Run(Report::MyReport, true, false, postedSalesheaderX);


                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
        reportview: Record "User Setup";
    begin
        reportview.Get(UserId);
        if reportview."Can Report view" = false then
            isallowed := true;


    end;

    var
        isallowed: Boolean;

}