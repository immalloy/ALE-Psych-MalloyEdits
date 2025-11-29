introLength = 0;

function postCreate() {
    remove(comboGroup);

    for(strumLine in strumLines.members) {
        for(strum in strumLine.members)
            strum.x -= 50;
    }
}