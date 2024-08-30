report 50900 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/rdlc/salesinvoice.rdl';

    dataset
    {
        dataitem("Posted Sales Header X"; "Posted Sales Header X")
        {
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Bill Data';
            column(No_; "No.")
            {

            }
            column(Customer_No_; "Customer No.")
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Name_of_company; "Name of company")
            {

            }
            column(Address_And_phone; "Address And phone")
            {

            }
            column(IMG; compinfo.picture)
            {

            }
            column(PrintedBy; PrintedBy)
            {

            }
            column(PrintedDate; PrintedDate)
            {

            }
            dataitem("Posted Sales Line X"; "Posted Sales Line X")
            {
                DataItemLink = "Document No." = field("No.");
                column(Line_No_; "Line No.")
                {

                }
                column(Descrption; Descrption)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Total_Line_Amount; "Total Line Amount")
                {

                }
                column(UOM; UOM)
                {

                }


            }


            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                itemsx: Record "Item X";
            begin
                CompInfo.get;
                "Name of company" := compinfo.Name;
                "Address And phone" := CompInfo.Address + ' ' + CompInfo."Phone No.";
                CompInfo.CalcFields(Picture);
                PrintedBy := UserId;
                PrintedDate := Today;


                itemsx.Get("No.");
                Message(itemsx."Custumer NO");

            end;


        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var
        myInt: Integer;
        CompInfo: Record "Company Information";
        "Name of company": Text;
        "Address And phone": text;
        PrintedBy: text;
        PrintedDate: Date;
        UOM: text;
    // itemx: Record "Item X";
}