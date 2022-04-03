page 50257 "GudFood Order List Posted"
{
    ApplicationArea = All;
    Caption = 'GudFood Order List Posted';
    PageType = List;
    SourceTable = "GudFood Order Header Posted";
    UsageCategory = Lists;
    CardPageId = "GudFood Order Posted";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Sell- to Customer No."; Rec."Sell- to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell- to Customer No. field.';
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer Name field.';
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ToolTip = 'Specifies the value of the Date Created field.';
                    ApplicationArea = All;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ToolTip = 'Specifies the value of the Posted Date field.';
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ToolTip = 'Specifies the value of the Total Qty field.';
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Delete All")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'D&elete All documents and lines';
                Ellipsis = true;
                Image = Delete;
                Promoted = true;
                // PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Delete All documents and lines';

                trigger OnAction()
                var
                    GudFoodOrderHeaderPosted: Record "GudFood Order Header Posted";
                    GudFoodOrderLinePosted: Record "GudFood Order Line Posted";
                begin
                    GudFoodOrderHeaderPosted.SetRange("No.");
                    if not GudFoodOrderHeaderPosted.IsEmpty then
                        GudFoodOrderHeaderPosted.DeleteAll();

                    GudFoodOrderLinePosted.SetRange("GudFood Order No.");
                    if not GudFoodOrderLinePosted.IsEmpty then
                        GudFoodOrderLinePosted.DeleteAll();
                end;
            }
        }
    }
}
