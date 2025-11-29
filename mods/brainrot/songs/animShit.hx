function onNoteHit(e) {
    if (e.note.isSustainNote) {
        e.cancelAnim();
        for (i in e.characters) {
            i.lastHit = Conductor.songPosition;
        }
    }
}