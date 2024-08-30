table 50904 TabNumberSeries
{
    Caption = 'TabNumberSeries';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';

            trigger OnValidate()
            var
                myInt: Integer;
                sales: Record "Sales & Receivables Setup";
                NOseries: Codeunit NoSeriesManagement;
            begin
                if No <> xrec.No then begin
                    sales.Get();
                    sales.TestField(sales."No series");
                    NOseries.TestManual(sales."No series");
                    NOseries.SetSeries(No);

                end;

            end;
        }
        field(2; "NoSeries"; Code[20])
        {
            Caption = 'No Series';
            TableRelation = "No. Series";
        }
        field(3; Name; Text[50])
        {
            Caption = 'Name';
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var

        sales: Record "Sales & Receivables Setup";
        noserries: Codeunit NoSeriesManagement;

    begin
        IF No = '' then begin
            sales.Get();
            sales.TestField(sales."No series");
            Clear(noserries);
            noserries.InitSeries(sales."No series", xRec."NoSeries", 0D, No, Rec."NoSeries");
        end;
    end;

}
