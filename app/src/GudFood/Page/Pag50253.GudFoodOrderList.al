page 50253 "GudFood Order List"
{
    ApplicationArea = All;
    Caption = 'GudFood Order List';
    PageType = List;
    SourceTable = "GudFood Order Header";
    UsageCategory = Lists;
    CardPageId = "GudFood Order";
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,Order,Request Approval,History,Print/Send,Navigate';
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
            action("GudFood XMLPort Export")
            {
                Caption = 'Export Orders XML';
                ApplicationArea = All;
                Image = Export;
                ToolTip = 'Executes GudFood Export Order';

                trigger OnAction()
                var
                    GudFoodOrderHeader: Record "GudFood Order Header";
                    GudFoodXMLExportSelect: XmlPort "GudFood XML Export Select";

                begin
                    CurrPage.SetSelectionFilter(GudFoodOrderHeader);
                    GudFoodXMLExportSelect.SetTableView(GudFoodOrderHeader);

                    Xmlport.Run(50251, false, false, GudFoodOrderHeader);
                    // GudFoodXMLExportSelect.Run();
                end;
            }
            action("GudFood XMLPort Export 2")
            {
                Caption = 'Export Orders XML 2';
                ApplicationArea = All;
                Image = Export;
                ToolTip = 'Executes GudFood Export Order';

                trigger OnAction()
                var
                    GudFoodOrderHeader: Record "GudFood Order Header";
                    GudFoodOrderLine: Record "GudFood Order Line";
                    GudFoodXMLExportSelect: XmlPort "GudFood XML Export Select";
                    MessageTxt: Label '%1 records were exported by XmlPort', Comment = '%1=count';
                    RecordsSelected: Integer;
                begin
                    CurrPage.SetSelectionFilter(GudFoodOrderHeader);

                    if GudFoodOrderHeader.FindSet() then begin
                        RecordsSelected := GudFoodOrderHeader.Count();
                        repeat
                            GudFoodOrderHeader.SetRange("No.", Rec."No.");
                            GudFoodXMLExportSelect.SetTableView(GudFoodOrderHeader);

                            GudFoodOrderLine.SetRange("GudFood Order No.", Rec."No.");
                            GudFoodXMLExportSelect.SetTableView(GudFoodOrderLine);

                            GudFoodXMLExportSelect.Run();
                        // Xmlport.Run(50251, false, false, GudFoodOrderHeader);
                        until GudFoodOrderHeader.Next() = 0;
                        Message(MessageTxt, RecordsSelected);
                    end;
                end;
            }
        }
    }
}
