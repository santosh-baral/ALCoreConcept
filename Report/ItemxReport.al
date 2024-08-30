report 50901 ItemXreport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    RDLCLayout = 'report/rdlc/itemx.rdl';

    dataset
    {
        dataitem("Item X"; "Item X")
        {
            column(No; No)
            {

            }
            column(Custumer_NO; "Custumer NO")
            {

            }
            column(Custumer_Name; "Custumer Name")
            {

            }
            column(UnitCost; UnitCost)
            {

            }
            column(Discount; Discount)
            {

            }
            column(NameOfCompnay; NameOfCompnay)
            {

            }
            column(printed_by; "printed by")
            {

            }
            column(Dateofprint; Dateofprint)
            {

            }
            column(Adrress; Adrress)
            {

            }
            column(img; compinfo.Picture)
            {

            }
            column(inventory; inventory)
            {

            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                compINfo.get();
                NameOfCompnay := compINfo.Name;
                Adrress := compINfo.Address;
                Dateofprint := CurrentDateTime;
                "printed by" := "User id";
                compINfo.CalcFields(Picture);


                "Item X".SetFilter(No, '<>%1', '230')


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

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        myInt: Integer;
        compINfo: Record "Company Information";
        NameOfCompnay: text;
        Dateofprint: DateTime;
        Adrress: text;
        "printed by": text;

}