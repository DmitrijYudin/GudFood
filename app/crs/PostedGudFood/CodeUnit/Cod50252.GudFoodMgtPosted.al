codeunit 50252 "GudFood Mgt. Posted"
{
    procedure DeleteGudFoodLine(DocumentNo: Code[20])
    var
        GudFoodOrderLinePosted: Record "GudFood Order Line Posted";
    begin
        GudFoodOrderLinePosted.SetRange("GudFood Order No.", DocumentNo);
        if not GudFoodOrderLinePosted.IsEmpty then begin
            GudFoodOrderLinePosted.DeleteAll(true);
            GudFoodOrderLinePosted.Reset();
        end;
    end;
}
