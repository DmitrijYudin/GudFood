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
            // NotBlank = true;

            trigger OnValidate()
            var
                RentalSetup: Record "GudFood Order Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    TestNoSeries(RentalSetup);
                    NoSeriesMgt.TestManual(RentalSetup."Rental Nos.");
                    "No. Series" := '';
                    // Rec.Validate("Date Created", Today);
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
                    Rec.Validate("Date Created", Today);
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
        GudFoodMgt.DeleteGudFoodLine('');
    end;

    trigger OnInsert()
    begin
        InitInsert();
    end;

    local procedure InitInsert()
    var
        RentalSetup: Record "GudFood Order Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." <> '' then
            exit;

        TestNoSeries(RentalSetup);
        NoSeriesManagement.InitSeries(RentalSetup."Rental Nos.", xRec."No. Series", 0D, "No.", "No. Series");
    end;

    local procedure TestNoSeries(var RentalSetup: Record "GudFood Order Setup")
    begin
        if not RentalSetup.get() then begin
            RentalSetup.Insert();
            Commit();
        end;
        RentalSetup.TestField("Rental Nos.");
    end;

}
