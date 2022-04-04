page 50258 "GudFood Order Subpage Posted"
{
    Caption = 'GudFood Order Subpage Posted';
    PageType = ListPart;
    SourceTable = "GudFood Order Line Posted";
    AutoSplitKey = true;
    MultipleNewLines = false;
    DelayedInsert = true;
    LinksAllowed = false;
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = false;
                field("Order No."; Rec."GudFood Order No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Sell- to Customer No."; Rec."Sell- to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell- to Customer No. field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ToolTip = 'Specifies the value of the Date Created field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Item Type"; Rec."Item Type")
                {
                    ToolTip = 'Specifies the value of the Item Type field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTip = 'Specifies the value of the Shelf Life field.';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
