// Preload map for characters
var preloadedCharacters:Map<String, Character> = [];

function postCreate() {
    for (event in PlayState.SONG.events)
        if (event.name == "Change Character" && !preloadedCharacters.exists(event.params[1])) {

            // Create New Character
            var strumLine = strumLines.members[event.params[0]];
            var oldCharacter = strumLine.characters[0];
            var newCharacter = new Character(
                oldCharacter.x,
                oldCharacter.y,
                event.params[1],
                stage.isCharFlipped(event.params[1], oldCharacter.isPlayer)
            );

            stage.applyCharStuff(
                newCharacter,
                strumLine.data.position == null ? switch (strumLine.data.type) {
                    case 0: "dad";
                    case 1: "boyfriend";
                    case 2: "girlfriend";
                } : strumLine.data.position,
                0
            );

            newCharacter.active = newCharacter.visible = false;
            newCharacter.drawComplex(FlxG.camera); // Push to GPU
            preloadedCharacters.set(event.params[1], newCharacter);

            // Cache icon graphic
            graphicCache.cache(Paths.image("icons/" + newCharacter.getIcon()));
        }
}

function onEvent(_) {
    var params:Array = _.event.params;
    if (_.event.name == "Change Character") {
        var strumLineIndex = params[0];
        var newCharName = params[1];

        var oldCharacter = strumLines.members[strumLineIndex].characters[0];
        var newCharacter = preloadedCharacters.get(newCharName);

        if (oldCharacter.curCharacter == newCharacter.curCharacter) return;

        // Swap characters
        insert(members.indexOf(oldCharacter), newCharacter);
        newCharacter.active = newCharacter.visible = true;
        remove(oldCharacter);

        // Keep same position / animation
        if (stage.characterPoses[newCharName] == null)
            newCharacter.setPosition(oldCharacter.x, oldCharacter.y);

        if (newCharacter.hasAnim(oldCharacter.getAnimName()))
            newCharacter.playAnim(
                oldCharacter.getAnimName(),
                true,
                oldCharacter.lastAnimContext,
                false,
                oldCharacter.animation?.curAnim?.curFrame
            );

        strumLines.members[strumLineIndex].characters[0] = newCharacter;

        // Change health icon if opponent or player
        if (strumLineIndex <= 1) {
            var iconToChange = (strumLineIndex == 1) ? iconP1 : iconP2;
            iconToChange.loadGraphicFromSprite(createHealthIcon(newCharacter.getIcon(), strumLineIndex == 1));

            // Update health bar color if option is enabled
            if (Options.colorHealthBar && healthBarColors != null && newCharacter.iconColor != null) {
                var colorIndex:Int = (strumLineIndex == 1) ? 1 : 0;
                ogHealthColors[colorIndex] = healthBarColors[colorIndex] = newCharacter.iconColor;
            }
        }
    }
}
