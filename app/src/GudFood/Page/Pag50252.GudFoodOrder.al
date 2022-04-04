page 50252 "GudFood Order"
{
    Caption = 'GudFood Order';
    PageType = Document;
    SourceTable = "GudFood Order Header";
    UsageCategory = None;
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,Order,Request Approval,History,Print/Send,Navigate';
    Extensible = true;
    Editable = true;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Sell- to Customer No."; Rec."Sell- to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell- to Customer No. field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
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
            part(SalesLines; "GudFood Order Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "GudFood Order No." = field("No.");
                UpdatePropagation = Both;
                Editable = true;
                Enabled = (Rec."Sell- to Customer No." <> '');
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'P&ost';
                Ellipsis = true;
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ShortCutKey = 'F9';
                ToolTip = 'Post the document';

                trigger OnAction()
                var
                    GudFoodOrderPost: Codeunit "GudFood Order Post";
                begin
                    GudFoodOrderPost.PostGudFood(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'P&rint';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category11;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+P';
                ToolTip = 'Print';

                trigger OnAction()
                var
                    GudFoodOrderHeader: Record "GudFood Order Header";
                    GudFoodOrderReport: Report "GudFood Order Report";
                begin
                    GudFoodOrderHeader.SetRange("No.", Rec."No.");
                    GudFoodOrderReport.SetTableView(GudFoodOrderHeader);

                    GudFoodOrderReport.Run();
                end;
            }
            action("GudFood Order XML Export")
            {
                Caption = 'GudFood Order XML Export';
                ApplicationArea = All;
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                Image = Export;
                ToolTip = 'GudFood Order XML Export';

                trigger OnAction()
                var
                    GudFoodOrderHeader: Record "GudFood Order Header";
                    GudFoodOrderLine: Record "GudFood Order Line";
                    GudFoodXMLExportSelect: XmlPort "GudFood XML Export Select";
                begin
                    GudFoodOrderHeader.SetRange("No.", Rec."No.");
                    GudFoodXMLExportSelect.SetTableView(GudFoodOrderHeader);

                    GudFoodOrderLine.SetRange("GudFood Order No.", Rec."No.");
                    GudFoodXMLExportSelect.SetTableView(GudFoodOrderLine);

                    GudFoodXMLExportSelect.Run();
                end;
            }
        }
    }
}