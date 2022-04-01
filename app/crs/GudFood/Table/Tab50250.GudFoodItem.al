table 50250 "GudFood Item"
{
    Caption = 'GudFood Item';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
        field(4; "GudFood Type"; Enum "GudFood Type")
        {
            Caption = 'GudFood Type';
            DataClassification = CustomerContent;
        }
        field(5; "Qty. Ordered"; Decimal)
        {
            Caption = 'Qty. Ordered';
            //DataClassification = CustomerContent;
            FieldClass = FlowField;
        }
        field(6; "Qty. in Order"; Decimal)
        {
            Caption = 'Qty. in Order';
            //DataClassification = CustomerContent;
            FieldClass = FlowField;
        }
        field(7; "Shelf Life"; Date)
        {
            Caption = 'Shelf Life';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}