function create() {
    dad.playAnim('walk', true);
    dad.scale.set(0.4, 0.4);

    dad.x -= 450;
    dad.y += 75;

    FlxTween.tween(dad, {x: dad.x + 550}, 5.5, {onComplete: function() {
        dad.x += 55;
        dad.y = 150;
        dad.scale.set(1, 1);
        dad.playAnim('step', true);
    }});
}

function beatHit(curBeat:Int) {
    switch(curBeat) {
        case 21:
            dad.playAnim('dustin', true);
    }
}