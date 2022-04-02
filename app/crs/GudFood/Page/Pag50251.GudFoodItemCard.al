page 50251 "GudFood Item Card"
{
    Caption = 'GudFood Item Card';
    PageType = Card;
    SourceTable = "GudFood Item";
    Editable = true;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
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
                    ShowMandatory = true;
                }
                field("GudFood Type"; Rec."GudFood Type")
                {
                    ToolTip = 'Specifies the value of the GudFood Type field.';
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTip = 'Specifies the value of the Shelf Life field.';
                    ApplicationArea = All;
                }
            }
            group(Quantity)
            {
                Caption = 'Quantity';

                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTip = 'Specifies the value of the Qty. Ordered field.';
                    ApplicationArea = All;
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTip = 'Specifies the value of the Qty. in Order field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}