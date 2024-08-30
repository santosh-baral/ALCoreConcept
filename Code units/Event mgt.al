codeunit 50901 "Event TMgt"
{
    trigger OnRun()
    begin
        //documentation 
        //  CueGroupLayout = Wide;
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Mgt", 'onBeforeInsertItemX', '', false, false)]
    // local procedure eventmybyAgileTarainee(var ItemX: Record "Item X")
    // begin
    //     ItemX."Item X III" := 'Jason';
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Mgt", 'onAfterInsertItemX', '', false, false)]
    // local procedure OnAfter(ItX: Record "Item X")
    // begin
    //     ItX."Item X III" := 'Lebron';
    //     ItX.Modify();
    // end;
    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine12(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GLEntry."Sales Header X" := GenJournalLine."Sales Header X";
    end;

    var


        myInt: Integer;

        Tanat: Page "Accountant Activities";
}