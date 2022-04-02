table 50252 "GudFood Order Line"
{
    Caption = 'GudFood Order Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "GudFood Order No."; Code[20])
        {
            Caption = 'GudFood Order No.';
            DataClassification = CustomerContent;
            TableRelation = "GudFood Order Header"."No.";
            Editable = false;

            trigger OnValidate()
            var
                GudFoodOrderHeader: Record "GudFood Order Header";
            begin
                if "GudFood Order No." <> '' then begin
                    GudFoodOrderHeader.Get(Rec."GudFood Order No.");
                    Rec.Validate("Date Created", GudFoodOrderHeader."Date Created");
                end;
            end;
        }
        field(20; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(30; "Sell- to Customer No."; Code[20])
        {
            Caption = 'Sell- to Customer No.';
            DataClassification = CustomerContent;
            Editable = false;
            //TableRelation = "GudFood Order Header"."Sell- to Customer No." where("No." = field("GudFood Order No."));
        }
        field(40; "Date Created"; Date)
        {
            Caption = 'Date Created';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = "GudFood Item".Code;
            NotBlank = true;

            trigger OnValidate()
            var
                GudFoodItem: Record "GudFood Item";
                GudFoodOrderHeader: Record "GudFood Order Header";
            begin
                if "Item No." <> '' then begin
                    GudFoodOrderHeader.Get(Rec."GudFood Order No.");
                    GudFoodOrderHeader.TestField("Sell- to Customer No.");
                    Rec.Validate("Sell- to Customer No.", GudFoodOrderHeader."Sell- to Customer No.");

                    GudFoodItem.Get(Rec."Item No.");
                    Rec.Validate("Item Type", GudFoodItem."GudFood Type");
                    Rec.Validate(Description, GudFoodItem.Description);
                    Rec.Validate("Unit Price", GudFoodItem."Unit Price");
                    Rec.Validate("Shelf Life", GudFoodItem."Shelf Life");
                end;
            end;
        }
        field(60; "Item Type"; Enum "GudFood Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
            Editable = false;
            //TableRelation = "GudFood Item"."GudFood Type";
        }
        field(70; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            Editable = false;
            //TableRelation = "GudFood Item".Description;
        }
        field(80; Quantity; Integer)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            InitValue = 0;
            MinValue = 0;
            NotBlank = true;
        }
        field(90; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
            Editable = false;
            //TableRelation = "GudFood Item"."Unit Price";
        }
        field(91; "Shelf Life"; Date)
        {
            Caption = 'Shelf Life';
            DataClassification = CustomerContent;
            Editable = false;
            //TableRelation = "GudFood Item"."Shelf Life";
        }
        field(100; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "GudFood Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
