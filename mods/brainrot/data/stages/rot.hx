
import flixel.FlxG;
function create() {
    playCutscenes = true;
    camHUD.alpha = 0.001;
    floor.alpha =0;
}

function beatHit(curBeat:Int) {
    switch(curBeat) {
        case 12:
            FlxTween.tween(camHUD, {alpha: 1}, 2.5, {ease: FlxEase.sineOut});

    }
}
function stepHit(curStep:Int){
    FlxG.log.add(camGame.zoom);
    switch(curStep){

                case 256:

                black.alpha =0;
            boyfriend.alpha =1;
            floor.alpha =1;

    }
}

var brightTimer:Float = 0;
function postUpdate(elapsed:Float){
    brightTimer += elapsed * 2 ;
    scribbles.alpha= Math.sin(brightTimer)*0.7;

}
