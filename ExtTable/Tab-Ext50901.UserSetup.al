tableextension 50901 "User Setup" extends "User Setup"
{
    fields
    {
        field(50900; "is sales entry"; Boolean)
        {
            Caption = 'is sales entry';
            DataClassification = ToBeClassified;
        }
        field(50901; "Can post"; Boolean)
        {
            Caption = 'Can post';
            DataClassification = ToBeClassified;
        }
        field(50902; "Can Report view"; Boolean)
        {
            Caption = 'Can Report view';
            DataClassification = ToBeClassified;
        }
    }
}
