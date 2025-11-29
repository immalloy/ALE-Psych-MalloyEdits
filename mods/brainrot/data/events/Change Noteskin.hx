
final notesSize:Float = 0.6;
function onEvent(e) {
    if (e.event.name == "Change Noteskin") {
        for (a in strumLines.members[e.event.params[1]]) updateStrumSkin(a, e.event.params[0] == "" ? "game/notes/default" : "game/notes/" + e.event.params[0]);
        for (a in strumLines.members[e.event.params[1]].notes) updateNoteSkin(a, e.event.params[0] == "" ? "game/notes/default" : "game/notes/" + e.event.params[0]);
    }
}

function updateStrumSkin(existingStrum: Strum, newSkin:String) {
    existingStrum.frames = Paths.getSparrowAtlas(newSkin);

    existingStrum.animation.addByPrefix('green', 'arrowUP');
    existingStrum.animation.addByPrefix('blue', 'arrowDOWN');
    existingStrum.animation.addByPrefix('purple', 'arrowLEFT');
    existingStrum.animation.addByPrefix('red', 'arrowRIGHT');

    existingStrum.antialiasing = Options.antialiasing;
    existingStrum.setGraphicSize(Std.int(existingStrum.width * notesSize));

    existingStrum.animation.addByPrefix('static', 'arrow' + ["left", "down", "up", "right"][existingStrum.ID].toUpperCase());
    existingStrum.animation.addByPrefix('pressed', ["left", "down", "up", "right"][existingStrum.ID] + ' press', 24, false);
    existingStrum.animation.addByPrefix('confirm', ["left", "down", "up", "right"][existingStrum.ID] + ' confirm', 24, false);

    existingStrum.animation.play('static');
    existingStrum.updateHitbox();

}

function updateNoteSkin(createdNote:Note, newSkin:String){
    final animName = createdNote.animation.name;
    createdNote.frames = Paths.getSparrowAtlas(newSkin);

    createdNote.animation.addByPrefix(animName, switch(animName) {
        case 'scroll': ['purple', 'blue', 'green', 'red'][createdNote.strumID % 4] + '0';
        case 'hold': ['purple hold piece', 'blue hold piece', 'green hold piece', 'red hold piece'][createdNote.strumID % 4];
        case 'holdend': ['pruple end hold', 'blue hold end', 'green hold end', 'red hold end'][createdNote.strumID % 4] + '0';
    });

    createdNote.animation.play(animName);
    // createdNote.setGraphicSize(Std.int(createdNote.width * notesSize));
    createdNote.updateHitbox();
}