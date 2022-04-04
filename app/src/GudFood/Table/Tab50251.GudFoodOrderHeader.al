table 50251 "GudFood Order Header"
{
    Caption = 'GudFood Order Header';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                GudFoodOrderSetup: Record "GudFood Order Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    TestNoSeries(GudFoodOrderSetup);
                    NoSeriesMgt.TestManual(GudFoodOrderSetup."GudFood Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; "Sell- to Customer No."; Code[20])
        {
            Caption = 'Sell- to Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
            NotBlank = true;

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if "Sell- to Customer No." <> '' then begin
                    Customer.Get("Sell- to Customer No.");
                    Rec.Validate("Sell-to Customer Name", Customer.Name);
                    Rec.Validate("Date Created", WorkDate());
                end;
            end;
        }
        field(30; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(40; "Date Created"; Date)
        {
            Caption = 'Date Created';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50; "Total Qty"; Integer)
        {
            Caption = 'Total Qty';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("GudFood Order Line".Quantity where("GudFood Order No." = field("No.")));
        }
        field(60; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("GudFood Order Line".Amount where("GudFood Order No." = field("No.")));
        }
        field(70; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        GudFoodMgt: Codeunit "GudFood Mgt.";
    begin
        GudFoodMgt.DeleteGudFoodLine(Rec."No.");
    end;

    trigger OnInsert()
    begin
        InitInsert();
    end;
    local procedure InitInsert()
    var
        GudFoodOrderSetup: Record "GudFood Order Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." <> '' then
            exit;

        TestNoSeries(GudFoodOrderSetup);
        NoSeriesManagement.InitSeries(GudFoodOrderSetup."GudFood Nos.", xRec."No. Series", 0D, "No.", "No. Series");
    end;
    local procedure TestNoSeries(var GudFoodOrderSetup: Record "GudFood Order Setup")
    begin
        if not GudFoodOrderSetup.get() then begin
            GudFoodOrderSetup.Insert();
            Commit();
        end;
        GudFoodOrderSetup.TestField("GudFood Nos.");
    end;
}
