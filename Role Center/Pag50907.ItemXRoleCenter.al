page 50907 "Item X Role Center"
{
    ApplicationArea = All;
    Caption = 'Item X Role Center';
    PageType = RoleCenter;
    UsageCategory = Administration;
    //SourceTable = "Item X";

    layout
    {
        area(RoleCenter)
        {
            group("Training Group")
            {
                part("item x"; "Item x list part")
                {

                }
                part("Sales Page X"; "Cue Page Sales X")
                {

                }


            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Sales Orde X")
            {
                ApplicationArea = All;
                Image = Order;
                RunObject = page "Sales Order List X";
            }
        }
    }
}
profile Training
{
    ProfileDescription = 'Item x';
    RoleCenter = "item x Role Center";
    Caption = 'Item x';

}
