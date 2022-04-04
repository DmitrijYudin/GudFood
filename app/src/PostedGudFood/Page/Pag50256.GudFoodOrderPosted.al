page 50256 "GudFood Order Posted"
{
    Caption = 'GudFood Order Posted';
    PageType = Document;
    SourceTable = "GudFood Order Header Posted";
    UsageCategory = None;
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
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
            part(SalesLines; "GudFood Order Subpage Posted")
            {
                ApplicationArea = All;
                SubPageLink = "GudFood Order No." = field("No.");
                UpdatePropagation = Both;
                Editable = true;
                Enabled = (Rec."Sell- to Customer No." <> '');
            }
        }
    }
}
