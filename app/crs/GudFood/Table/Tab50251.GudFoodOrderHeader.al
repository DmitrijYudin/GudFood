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
            begin
                if "No." <> '' then
                    Rec.Validate("Date Created", Today);
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
            // GudFoodOrderLine: Record "GudFood Order Line";
            begin

                if "Sell- to Customer No." <> '' then begin
                    Customer.Get("Sell- to Customer No.");
                    Rec.Validate("Sell-to Customer Name", Customer.Name);

                    // GudFoodOrderLine.SetRange("GudFood Order No.", Rec."No.");
                    // if GudFoodOrderLine.FindSet() then
                    //     GudFoodOrderLine.ModifyAll("Sell- to Customer No.", Rec."Sell- to Customer No.");
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
        field(50; "Total Qty"; Decimal)
        {
            Caption = 'Total Qty';
            DataClassification = CustomerContent;
        }
        field(60; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
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
}
