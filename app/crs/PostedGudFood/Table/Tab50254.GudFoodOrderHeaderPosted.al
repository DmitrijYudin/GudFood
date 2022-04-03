table 50254 "GudFood Order Header Posted"
{
    Caption = 'GudFood Order Header Posted';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            // NotBlank = true;
        }
        field(20; "Sell- to Customer No."; Code[20])
        {
            Caption = 'Sell- to Customer No.';
            DataClassification = CustomerContent;
            // TableRelation = Customer."No.";
            // NotBlank = true;

            // trigger OnValidate()
            // var
            //     Customer: Record Customer;
            // begin
            //     if "Sell- to Customer No." <> '' then begin
            //         Customer.Get("Sell- to Customer No.");
            //         Rec.Validate("Sell-to Customer Name", Customer.Name);
            //         Rec.Validate("Date Created", Today);
            //     end;
            // end;
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
            CalcFormula = sum("GudFood Order Line Posted".Quantity where("GudFood Order No." = field("No.")));
        }
        field(60; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("GudFood Order Line Posted".Amount where("GudFood Order No." = field("No.")));
        }
        field(70; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(80; "Posted Date"; Date)
        {
            Caption = 'Posted Date';
            Editable = false;
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
        GudFoodMgt: Codeunit "GudFood Mgt. Posted";
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
