table 50252 "GudFood Order Line"
{
    Caption = 'GudFood Order Line';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "GudFood Order No."; Code[20])
        {
            Caption = 'GudFood Order No.', Comment = 'ESP="Code."';
            DataClassification = CustomerContent;
            TableRelation = "GudFood Order Header"."No.";
            Editable = false;
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
                ShelfLifeErr: Label 'Item %1 Shelf Life %2 is expired! Today is %3', Comment = '%1 = Code, %2 = Shelf Life, %3 = Today date';
            begin
                if "Item No." <> '' then begin
                    GudFoodOrderHeader.Get(Rec."GudFood Order No.");
                    GudFoodOrderHeader.TestField("Sell- to Customer No.");

                    GudFoodItem.Get(Rec."Item No.");
                    GudFoodItem.TestField("Shelf Life");



                    if GudFoodItem."Shelf Life" < Today then
                        Error(ShelfLifeErr, GudFoodItem.Code, GudFoodItem."Shelf Life", Today);

                    Rec.Validate("Sell- to Customer No.", GudFoodOrderHeader."Sell- to Customer No.");
                    Rec.Validate("Date Created", GudFoodOrderHeader."Date Created");

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
        }
        field(70; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(80; Quantity; Integer)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            InitValue = 1;
            MinValue = 1;
            NotBlank = true;

            trigger OnValidate()
            begin
                CalcLineAmount();
            end;
        }
        field(90; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                CalcLineAmount();
            end;
        }
        field(91; "Shelf Life"; Date)
        {
            Caption = 'Shelf Life';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(100; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "GudFood Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
    local procedure CalcLineAmount()
    begin
        Amount := Quantity * "Unit Price";
    end;
}
