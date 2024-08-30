page 50902 "Sales Order Card X"
{
    // ApplicationArea = All;
    Caption = 'Sales Order Card X';
    PageType = Card;
    SourceTable = "Sales Header X";

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
                field("Created user ID"; Rec."Created user ID")
                {
                    ToolTip = 'Specifies the value of the Created user ID field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Customer No"; Rec."Customer No")
                {
                    ToolTip = 'Specifies the value of the Customer No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }

                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
            part("Sales Order Subform"; "Sales Order X Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Posting: Codeunit "Posting Mgt";
                    postper: Record "User Setup";
                begin
                    postper.Get(UserId);
                    if postper."Can post" = true then begin
                        Posting.postSalesBill(Rec);
                        CurrPage.Close();
                    end
                    else
                        Error('YOU donot have permission to open');
                end;
            }
            action("GL")
            {
                ApplicationArea = All;
                Image = GeneralLedger;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Posting: Codeunit "Posting Mgt";
                    vat: Record "Vat Posting Group X";
                begin
                    vat.FindFirst();
                    Posting.postVATThroughGenJounral(vat, 100, Rec."No.");
                    Posting.insertIntoCustomerLedger(rec);
                end;
            }
        }
    }
}
