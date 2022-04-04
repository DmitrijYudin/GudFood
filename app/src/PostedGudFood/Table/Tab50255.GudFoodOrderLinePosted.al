table 50255 "GudFood Order Line Posted"
{
    Caption = 'GudFood Order Line Posted';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "GudFood Order No."; Code[20])
        {
            Caption = 'GudFood Order No.', Comment = 'ESP="Code."';
            DataClassification = CustomerContent;
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
        }
        field(90; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
            Editable = false;
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
        field(110; "Posted Date"; Date)
        {
            Caption = 'Posted Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "GudFood Order No.", "Line No.")
        {
            Clustered = true;
        }
        key(key2; "GudFood Order No.","Item No.")
        {
            SumIndexFields = Quantity;
        }
    }
}
