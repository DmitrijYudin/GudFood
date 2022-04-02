codeunit 50250 "GudFood Mgt."
{
    procedure DeleteGudFoodLine(DocumentNo: Code[20])
    var
        GudFoodOrderLine: Record "GudFood Order Line";
    begin
        GudFoodOrderLine.SetRange("GudFood Order No.", DocumentNo);
        if not GudFoodOrderLine.IsEmpty then begin
            GudFoodOrderLine.DeleteAll(true);
            GudFoodOrderLine.Reset();
        end;
    end;
}
