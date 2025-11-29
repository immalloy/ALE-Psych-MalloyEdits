import flixel.addons.display.FlxBackdrop;

var manualCam:Bool = false;
var skewShader:CustomShader = new CustomShader('skew');

function postCreate() {
    if (Options.gameplayShaders) {
        floor.shader = skewShader;
    }

    var ambaladu = new FlxBackdrop(Paths.image('brainrots/ambaladu'), 1, 2500);
    insert(members.indexOf(floor), ambaladu);
    ambaladu.frames = Paths.getSparrowAtlas('brainrots/ambaladu'); 
    ambaladu.velocity.set(100, 0); 
    ambaladu.animation.addByPrefix('walk', 'walk', 24, true); 
    ambaladu.animation.play('walk'); 
    ambaladu.y = 450;
    ambaladu.x = 0;
    add(ambaladu);



    var chimpanzini = new FlxBackdrop(Paths.image('brainrots/chimpanzini'), 1, 2500);
    insert(members.indexOf(floor), chimpanzini);
    chimpanzini.frames = Paths.getSparrowAtlas('brainrots/chimpanzini'); 
    chimpanzini.velocity.set(100, 0); 
    chimpanzini.animation.addByPrefix('walk', 'walk', 24, true); 
    chimpanzini.animation.play('walk'); 
    chimpanzini.y = 350;
    chimpanzini.x = ambaladu - 500;
    chimpanzini.scale.x = 1;
    chimpanzini.scale.y = 1;
    add(chimpanzini);

    var shrimp = new FlxBackdrop(Paths.image('brainrots/shrimp'), 1, 2500);
    insert(members.indexOf(floor), shrimp);
    shrimp.frames = Paths.getSparrowAtlas('brainrots/shrimp'); 
    shrimp.velocity.set(100, 0); 
    shrimp.animation.addByPrefix('walk', 'walk', 24, true); 
    shrimp.animation.play('walk'); 
    shrimp.y = 450;
    shrimp.x = 1000;
    shrimp.flipX = true;
    add(shrimp);

        var slimo = new FlxBackdrop(Paths.image('brainrots/slimo'), 1, 2500);
    insert(members.indexOf(floor), slimo);
    slimo.frames = Paths.getSparrowAtlas('brainrots/slimo'); 
    slimo.velocity.set(100, 0); 
    slimo.animation.addByPrefix('walk', 'walk', 24, true); 
    slimo.animation.play('walk'); 
    slimo.y = 400;
    slimo.x = 1500;
    slimo.flipX = true;
    add(slimo);



}

function beatHit(curBeat:Int) {
    switch(curBeat) {

    }
}

function postUpdate(elapsed:Float) {
    skewHandler();
}

function skewHandler() {
    skewShader.hset('skew', (camGame.scroll.x - 3500) / 47000);
    floor.scale.y = 0.01 - (camGame.scroll.y - 1900) / 2400;
}

function onCameraMove(e) {
    if (manualCam) e.cancel();
}

function stepHit(curStep:Int) {
    switch(curStep) {
        case 520:
            boyfriend.playAnim('interest', true);
    }
        switch(curStep) {
        case 163:
            boyfriend.playAnim('aye', true);
    }
}