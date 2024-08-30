page 50914 api
{
    PageType = API;

    ApplicationArea = All;

    UsageCategory = Administration;

    SourceTable = "Item X";

    EntityName = 'itemx'; //you can use any ,

    EntitySetName = 'itemxs'; //you can use any

    APIPublisher = 'nav'; //you can use any

    APIGroup = 'agile'; //you can use any

    APIVersion = 'v2.0';

    DelayedInsert = true;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec.No)
                {
                    Caption = 'No';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
            }
        }
    }
}
