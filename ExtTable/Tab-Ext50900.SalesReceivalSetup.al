tableextension 50900 SalesReceivalSetup extends "Sales & Receivables Setup"
{
    fields
    {
        field(50900; "Sales Header X Nos"; Code[20])
        {
            Caption = 'Sales Header X Nos';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50901; "No series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50902; "VAT Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(50903; "VAT Batch"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("VAT Template"));
        }
        field(50904; "Total Sales today COunt"; Integer)
        {
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = count("Posted Sales Header X" where("Document Date" = filter('today')));
        }
        field(50905; "Total Sales today Amount"; Decimal)
        {
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = sum("Posted Sales Header X"."Total Amount" where("Document Date" = filter('today')));
        }

    }
}
