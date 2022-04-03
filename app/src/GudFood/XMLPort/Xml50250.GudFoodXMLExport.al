xmlport 50250 "GudFood XML Export"
{
    Caption = 'GudFood XML Export';
    FormatEvaluate = Xml;
    Encoding = UTF8;
    Direction = Export;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(GudFoodOrderHeader; "GudFood Order Header")
            {
                fieldelement(No; GudFoodOrderHeader."No.")
                {
                }
                fieldelement(SelltoCustomerNo; GudFoodOrderHeader."Sell- to Customer No.")
                {
                }
                fieldelement(SelltoCustomerName; GudFoodOrderHeader."Sell-to Customer Name")
                {
                }
                fieldelement(DateCreated; GudFoodOrderHeader."Date Created")
                {
                }
                fieldelement(TotalQty; GudFoodOrderHeader."Total Qty")
                {
                }
                fieldelement(TotalAmount; GudFoodOrderHeader."Total Amount")
                {
                }
            }
            tableelement(GudFoodOrderLine; "GudFood Order Line")
            {

                fieldelement(GudFoodOrderNo; GudFoodOrderLine."GudFood Order No.")
                {
                }
                fieldelement(DateCreated; GudFoodOrderLine."Date Created")
                {
                }
                fieldelement(LineNo; GudFoodOrderLine."Line No.")
                {
                }
                fieldelement(ItemNo; GudFoodOrderLine."Item No.")
                {
                }
                fieldelement(ItemType; GudFoodOrderLine."Item Type")
                {
                }
                fieldelement(Description; GudFoodOrderLine.Description)
                {
                }
                fieldelement(ShelfLife; GudFoodOrderLine."Shelf Life")
                {
                }
                fieldelement(SelltoCustomerNo; GudFoodOrderLine."Sell- to Customer No.")
                {
                }
                fieldelement(Amount; GudFoodOrderLine.Amount)
                {
                }
                fieldelement(UnitPrice; GudFoodOrderLine."Unit Price")
                {
                }
                fieldelement(Quantity; GudFoodOrderLine.Quantity)
                {
                }
            }
        }
    }
}
