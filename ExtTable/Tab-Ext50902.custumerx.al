tableextension 50902 "custumer x" extends Customer
{
    fields
    {
        field(50900; "custumer posting x"; Option)
        {
            Caption = 'custumer posting x';
            DataClassification = ToBeClassified;
            OptionMembers = " ","NO Vat","5 % vat","13 % Vat";
        }
    }
}
