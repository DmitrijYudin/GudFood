report 50250 "GudFood Order Report"
{
    ApplicationArea = All;
    Caption = 'GudFood Order Report';
    UsageCategory = ReportsAndAnalysis;

    WordLayout = 'crs\Layout\GudFoodReportPrint.docx';
    //RDLCLayout = 'crs\Layout\GudFoodReport.rdlc';
    DefaultLayout = Word;
    PreviewMode = PrintLayout;
    //WordMergeDataItem = "GudFood Order Header";

    dataset
    {
        dataitem("GudFood Order Header"; "GudFood Order Header")
        {
            // DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            // RequestFilterHeading = 'GudFood Order';
            UseTemporary = true;
            column(DateCreated_GudFoodOrderHeader; "Date Created")
            {
                IncludeCaption = true;
            }
            column(No_GudFoodOrderHeader; "No.")
            {
                IncludeCaption = true;
            }
            column(SelltoCustomerNo_GudFoodOrderHeader; "Sell- to Customer No.")
            {
                IncludeCaption = true;
            }
            column(SelltoCustomerName_GudFoodOrderHeader; "Sell-to Customer Name")
            {
                IncludeCaption = true;
            }
            column(TotalAmount_GudFoodOrderHeader; "Total Amount")
            {
                IncludeCaption = true;
            }
            column(TotalQty_GudFoodOrderHeader; "Total Qty")
            {
                IncludeCaption = true;
            }

        }
        dataitem(GudFoodOrderLine; "GudFood Order Line")
        {
            // DataItemLink = "GudFood Order No." = FIELD("No.");
            // DataItemLinkReference = "GudFood Order Header";
            // DataItemTableView = SORTING("GudFood Order No.");
            // UseTemporary = true;
            RequestFilterFields = "GudFood Order No.";

            column(LineNo_GudFoodOrderLine; "Line No.")
            {
                IncludeCaption = true;
            }
            column(DateCreated_GudFoodOrderLine; "Date Created")
            {
                IncludeCaption = true;
            }
            column(ItemNo_GudFoodOrderLine; "Item No.")
            {
                IncludeCaption = true;
            }
            column(ItemType_GudFoodOrderLine; "Item Type")
            {
                IncludeCaption = true;
            }
            column(Description_GudFoodOrderLine; Description)
            {
                IncludeCaption = true;
            }
            column(Quantity_GudFoodOrderLine; Quantity)
            {
                IncludeCaption = true;
            }
            column(Amount_GudFoodOrderLine; Amount)
            {
                IncludeCaption = true;
            }
            column(SelltoCustomerNo_GudFoodOrderLine; "Sell- to Customer No.")
            {
                IncludeCaption = true;
            }
            column(GudFood_Order_No_; "GudFood Order No.")
            {
                IncludeCaption = true;
            }
            column(ShelfLife_GudFoodOrderLine; "Shelf Life")
            {
                IncludeCaption = true;
            }
            column(UnitPrice_GudFoodOrderLine; "Unit Price")
            {
                IncludeCaption = true;
            }
        }
        dataitem(User; User)
        {
            column(FullName_User; "Full Name")
            {
                IncludeCaption = true;
            }
            column(UserName_User; "User Name")
            {
                IncludeCaption = true;
            }
            column(UserSecurityID_User; "User Security ID")
            {
                IncludeCaption = true;
            }
        }
        dataitem("User Setup"; "User Setup")
        {

            column(UserID_UserSetup; "User ID")
            {
                IncludeCaption = true;
            }
        }
    }
}
