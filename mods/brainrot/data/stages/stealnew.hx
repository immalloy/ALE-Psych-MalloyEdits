import flixel.tweens.FlxTweenType;
import flixel.math.FlxAngle;

import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import flixel.addons.effects.FlxTrail;

import funkin.backend.MusicBeatState;
import Shadow;



 var ambaladu:FlxSprite;
 var shrimp:FlxSprite;
 var chimpanzini:FlxSprite;
var slimo:FlxSprite;



var manualCam:Bool = false;
var skewShader:CustomShader = new CustomShader('skew');

function onEvent(e) {
    if (e.event.name == 'Camera Movement') {
        new FlxTimer().start(0.01, (_) -> {
            switch(curCameraTarget) {
                case 0: // dad
                    defaultCamZoom = 0.75;
                case 1: // bf
                    defaultCamZoom = 0.7;
            }
        });
    }
}

function postCreate() {
    if (Options.gameplayShaders) {
        floor.shader = skewShader;
    }
    camZooming = true;
ambaladu = new FlxSprite(100, 450); 
ambaladu.frames = Paths.getSparrowAtlas('brainrots/ambaladu'); 
ambaladu.animation.addByPrefix('walk', 'walk', 24, true); 
ambaladu.animation.play('walk'); 
add (ambaladu);
shrimp = new FlxSprite(100, 450);
shrimp.frames = Paths.getSparrowAtlas('brainrots/shrimp'); 
shrimp.animation.addByPrefix('walk', 'walk', 24, true); 
shrimp.animation.play('walk'); 
shrimp.scale.x = -1;
add (shrimp);
chimpanzini = new FlxSprite(30, 320); 
chimpanzini.frames = Paths.getSparrowAtlas('brainrots/chimpanzini'); 
chimpanzini.animation.addByPrefix('walk', 'walk', 24, true); 
chimpanzini.animation.play('walk'); 
add (chimpanzini);
slimo = new FlxSprite(100, 450); 
slimo.frames = Paths.getSparrowAtlas('brainrots/slimo'); 
slimo.animation.addByPrefix('walk', 'walk', 24, true); 
slimo.animation.play('walk');
slimo.scale.x = -1;
add (slimo);


}

function postUpdate(elapsed:Float) {
    skewHandler();
}

function skewHandler() {
    skewShader.hset('skew', (camGame.scroll.x - 3500) / 47000);
    floor.scale.y = 0.01 - (camGame.scroll.y - 1900) / 2400;
}

function onNoteHit(e) {
    if (e.note.isSustainNote) {
        e.cancelAnim();
        for (i in e.characters) {
            i.lastHit = Conductor.songPosition;
        }
    } else {
        e.numScale = 0.4;
        e.ratingScale = 0.5;
    }
}

function onCameraMove(e) {
    if (manualCam) e.cancel();
    comboGroup.setPosition(800, 200);
}

function beatHit(beat:Int) {

}
