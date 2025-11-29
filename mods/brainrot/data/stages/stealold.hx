import flixel.tweens.FlxTweenType;
import flixel.math.FlxAngle;

import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import flixel.addons.effects.FlxTrail;

import funkin.backend.MusicBeatState;
import Shadow;

var camGodrays:FlxCamera;
var camNoGodrays:FlxCamera;
var godraysShader = new CustomShader('godrays');
var godraysTracker:FlxSprite;

var camPaper:FlxCamera;
var burnShader = new CustomShader('burn');

var wiggleEffect:WiggleEffect;
var camSkyChars:FlxCamera;

var skyJerryTrail:FlxTrail;
var skyMarvinTrail:FlxTrail;
var transparentGradientShader = new CustomShader('transparentGradient');

//var camBlurShader:CustomShader = new CustomShader("blur");

var plrLightingShader:CustomShader;
var oppLightingShader:CustomShader;

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

    strumLines.members[0].characters[1].alpha = 0.001;

  camZooming = true;
shaderShit();

//BloomShader.hset("intensity", 1);

}
//var CCShader = new CustomShader('ColorCorrection');
//var BloomShader = new CustomShader('bloom');
function create() {
    //camGame.addShader(CCShader);
//camGame.addShader(BloomShader);

CCShader.hue = 0;
CCShader.saturation = 30;
CCShader.brightness = -50;
CCShader.contrast = 40;
var sahurScript = new FunkinHScript("songs/sahur/scripts/sahur.hx");


}
function postUpdate(elapsed:Float) {
   //BloomShader.iTime = Conductor.songPosition / 1000;
//Godray.iTime = Conductor.songPosition / 1000;
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
    }
}
var rtxShaderOpp:CustomShader = new CustomShader("RTXLighting");
var rtxShaderPlr:CustomShader = new CustomShader("RTXLighting");

function shaderShit() {
    if (Options.gameplayShaders) { // optimise all this when im not lazy
        strumLines.members[0].characters[0].shader = rtxShaderOpp;
        strumLines.members[1].characters[0].shader = rtxShaderPlr;
        strumLines.members[0].characters[1].shader = rtxShaderOpp;

        rtxShaderOpp.overlayColor = rtxShaderPlr.overlayColor = [0.1, 0.5, 1, 0.1];
        rtxShaderOpp.satinColor = rtxShaderPlr.satinColor = [0, 0, 0.4, 0.2];
        rtxShaderOpp.innerShadowColor = rtxShaderPlr.innerShadowColor = [0.1, 0.2, 0.3, 0.1];
        rtxShaderOpp.innerShadowAngle = 180 * (Math.PI / 180);
        rtxShaderPlr.innerShadowAngle = -90 * (Math.PI / 180);
        rtxShaderOpp.innerShadowDistance = 20;
        rtxShaderPlr.innerShadowDistance = 20;
        rtxShaderOpp.layernumbers = 20;
        rtxShaderPlr.layernumbers = 20;
        rtxShaderOpp.layerseparation = 1;
        rtxShaderPlr.layerseparation = 1;
    }
}




function onCameraMove(e) {
    if (manualCam) e.cancel();


    comboGroup.setPosition(800, 200);

    //pincushionShader = new CustomShader('pincushion');
    //pincushionShader.hset('depth', -0.12);
    //camGame.addShader(pincushionShader);
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

function fuckingCunt() {
    strumLines.members[0].characters[0].alpha = 0.001;
    strumLines.members[0].characters[1].alpha = 1;

    strumLines.members[0].characters[1].animation.play('idle', true);
    strumLines.members[0].characters[1].animation.finishCallback = function (name:String) {
        if (name == 'idle') {
            strumLines.members[0].characters[0].alpha = 1;
            strumLines.members[0].characters[1].alpha = 0.001;
        }
    }
}

function beatHit(curBeat:Int) {
    switch (curBeat) {
        case 32:
            strumLines.members[0].characters[1].alpha = 1;
            strumLines.members[0].characters[0].alpha = 0.001;
    }
}

