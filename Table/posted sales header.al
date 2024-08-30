table 50911 "Posted Sales Header X"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
                SalesNRec: Record "Sales & Receivables Setup";
                NoSeriesMgmt: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    SalesNRec.Get();
                    SalesNRec.TestField("Sales Header X Nos");
                    NoSeriesMgmt.TestManual(SalesNRec."Sales Header X Nos");
                    "No Series" := '';
                    NoSeriesMgmt.SetSeries("No.");
                end;
            end;
        }
        field(2; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer No."; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.get("Customer No.") then
                    Validate("Customer Name", Customer.Name);
            end;
        }
        field(4; "Customer Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Cretaed User ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        SAlesNRec: Record "Sales & Receivables Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            SAlesNRec.Get();
            SAlesNRec.TestField("Sales Header X Nos");
            Clear(NoseriesMgt);
            NoseriesMgt.InitSeries(SAlesNRec."Sales Header X Nos", xRec."No Series", Today, "No.", rec."No Series");
        end;

        "Document Date" := Today;
        "Cretaed User ID" := UserId;

    end;
   
}