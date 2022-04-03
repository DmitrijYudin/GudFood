page 50250 "GudFood Item List"
{
    ApplicationArea = All;
    Caption = 'GudFood Item List';
    PageType = List;
    SourceTable = "GudFood Item";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "GudFood Item Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }
                field("GudFood Type"; Rec."GudFood Type")
                {
                    ToolTip = 'Specifies the value of the GudFood Type field.';
                    ApplicationArea = All;
                }
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTip = 'Specifies the value of the Qty. Ordered field.';
                    ApplicationArea = All;
                }
                field("Qty. in Orders"; Rec."Qty. in Orders")
                {
                    ToolTip = 'Specifies the value of the Qty. in Order field.';
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTip = 'Specifies the value of the Shelf Life field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
