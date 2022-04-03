page 50255 "GudFood Order Setup"
{
    Caption = 'GudFood Order Setup';
    PageType = Card;
    SourceTable = "GudFood Order Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    Editable = true;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("GudFood Nos."; Rec."GudFood Nos.")
                {
                    ToolTip = 'Specifies the value of the Radio Show Nos. field.';
                    ApplicationArea = All;
                }
                group(Posting)
                {
                    field("Post. Jnl. Template Name"; Rec."Post. Jnl. Template Name")
                    {
                        ToolTip = 'Specifies the value of the Leasing Postings Journal Template Name field.';
                        ApplicationArea = All;
                    }
                    field("Post. Jnl. Batch Name"; Rec."Post. Jnl. Batch Name")
                    {
                        ToolTip = 'Specifies the value of the Postings Journal Template Name field.';
                        ApplicationArea = All;
                    }
                    field("Gross Receivable"; Rec."Gross Receivable")
                    {
                        ToolTip = 'Specifies the value of the Gross Receivable field.';
                        ApplicationArea = All;
                    }
                    field("Interest Account"; Rec."Interest Account")
                    {
                        ToolTip = 'Specifies the value of the Interest Account field.';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Delete Nos.")
            {
                ApplicationArea = All;
                Caption = 'Delete Nos.', comment = 'NLB="Delete Nos."';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Delete Nos';
                PromotedOnly = true;

                trigger OnAction()
                var
                    GudFoodOrderSetup: Record "GudFood Order Setup";
                begin
                    GudFoodOrderSetup.FindSet();
                    GudFoodOrderSetup.DeleteAll();
                end;
            }
        }
    }
}
