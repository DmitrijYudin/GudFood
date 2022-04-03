codeunit 50251 "GudFood Order Post"
{
    procedure PostGudFood(GudFoodOrderHeader: Record "GudFood Order Header")
    var
        GudFoodOrderLine: Record "GudFood Order Line";
        GudFoodOrderHeaderPosted: Record "GudFood Order Header Posted";
        GudFoodOrderLinePosted: Record "GudFood Order Line Posted";
        OrderPostedMsg: Label 'The order is posted as number %1 and moved to the %2', Comment = '%1 = No, %2 = TableCaption';
    begin
        // GudFood Order Header copy
        GudFoodOrderHeader.CalcFields("Total Amount");
        GudFoodOrderHeader.CalcFields("Total Qty");

        GudFoodOrderHeader.TestField("Total Amount");
        GudFoodOrderHeader.TestField("Total Qty");
        GudFoodOrderHeader.TestField("No.");
        GudFoodOrderHeader.TestField("Date Created");
        GudFoodOrderHeader.TestField("Sell- to Customer No.");
        GudFoodOrderHeader.TestField("Sell-to Customer Name");

        GudFoodOrderHeaderPosted.Init();
        GudFoodOrderHeaderPosted.TransferFields(GudFoodOrderHeader);
        GudFoodOrderHeaderPosted."Posted Date" := WorkDate();

        GudFoodOrderHeaderPosted.Insert(true);

        // Lines posting
        GudFoodOrderLine.SetRange("GudFood Order No.", GudFoodOrderHeader."No.");
        if GudFoodOrderLine.FindSet() then
            repeat
                GudFoodOrderLinePosted.Init();
                GudFoodOrderLinePosted.TransferFields(GudFoodOrderLine);
                GudFoodOrderLinePosted."Posted Date" := WorkDate();
                GudFoodOrderLinePosted.Insert(true);
            until GudFoodOrderLine.Next() = 0;

        GudFoodOrderHeader.Delete(true);
        GudFoodOrderLine.DeleteAll(true);

        // Commit();
        Message(OrderPostedMsg, GudFoodOrderHeaderPosted."No.", GudFoodOrderHeaderPosted.TableCaption());
    end;
}