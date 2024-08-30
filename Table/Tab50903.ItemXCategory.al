table 50903 "Item X Category"
{
    Caption = 'Item X Category';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "code"; Code[20])
        {
            Caption = 'code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "margin per"; Decimal)
        {
            Caption = 'margin per';
        }
        field(4; "Item Bus. Posting Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","sales","purchase","None";
        }
    }
    keys
    {
        key(PK; "code")
        {
            Clustered = true;
        }
    }
}
