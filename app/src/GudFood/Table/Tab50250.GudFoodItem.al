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
        field(20; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(30; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
        field(40; "GudFood Type"; Enum "GudFood Type")
        {
            Caption = 'GudFood Type';
            DataClassification = CustomerContent;
        }
        field(50; "Shelf Life"; Date)
        {
            Caption = 'Shelf Life';
            DataClassification = CustomerContent;

        }
        field(60; "Qty. Ordered"; Integer)
        {
            Caption = 'Qty. Ordered';
            FieldClass = FlowField;
            CalcFormula = sum("GudFood Order Line Posted".Quantity where("Item No." = field(Code)));
        }
        field(70; "Qty. in Orders"; Integer)
        {
            Caption = 'Qty. in Orders';
            FieldClass = FlowField;
            CalcFormula = sum("GudFood Order Line".Quantity where("Item No." = field(Code)));
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
