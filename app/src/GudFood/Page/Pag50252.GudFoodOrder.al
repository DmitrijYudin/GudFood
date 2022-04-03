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
                // PromotedOnly = true;

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
                // PromotedOnly = true;

                trigger OnAction()
                var
                    GudFoodOrderReport: Report "GudFood Order Report";
                begin
                    GudFoodOrderReport.Run();
                end;
            }

            action("GudFood Export Order XML")
            {
                Caption = 'GudFood Export Order XML';
                ApplicationArea = All;
                RunObject = xmlport "GudFood XML Export";
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                //PromotedOnly = true;
                Image = Export;
                ToolTip = 'Executes GudFood Export Order';
            }
        }
    }
}