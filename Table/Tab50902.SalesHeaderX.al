table 50902 "Sales Header X"
{
    Caption = 'Sales Header X';
    DataClassification = ToBeClassified;



    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
                SalesNRec: Record "Sales & Receivables Setup";
                NOseriesmgmt: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    SalesNRec.Get();
                    SalesNRec.TestField("Sales Header X Nos");
                    NOseriesmgmt.TestManual(SalesNRec."Sales Header X Nos");
                    "No Series" := '';
                    NOseriesmgmt.SetSeries("No.");
                end;

            end;
        }
        field(2; "No Series"; Code[20])
        {
            Caption = 'No Series';
        }
        field(3; "Customer No"; code[20])
        {
            Caption = 'Customer No';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            trigger OnValidate()
            var
                customer: Record Customer;
            begin
                if customer.get("Customer No") then
                    Validate("Customer Name", customer.Name);
            end;
        }
        field(4; "Customer Name"; Text[200])
        {
            Caption = 'Customer Name';
        }
        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(6; "Created user ID"; Code[100])
        {
            Caption = 'Created user ID';
        }
        field(7; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = sum("sales lineX"."Total Line Amount" where("Document NO." = field("No.")));
        }
    }
    keys
    {
        key(PK; "No.")
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
        userset: Record "User Setup";
    begin
        if "No." = '' then begin
            SAlesNRec.Get();
            SAlesNRec.TestField("Sales Header X Nos");
            Clear(NoseriesMgt);
            NoseriesMgt.InitSeries(SAlesNRec."Sales Header X Nos", xRec."No Series", Today, "No.", rec."No Series");
        end;
        userset.get(UserId);
        if (userset."is sales entry" = false) then
            Error('you don,t have permission to insert');

        "Document Date" := Today;
        "Created User ID" := UserId;

    end;

}
