import flixel.tweens.FlxTweenType;

public var camOffsetAmount:Float = 15;

function __updateCamOffset(character:Character) {
    switch(character.animation.curAnim.name) {
        case 'idle' | 'idle-alt':
            if (camGame.angle != 0) camGame.angle = lerp(camGame.angle, 0, 0.05);
        case 'singLEFT' | 'singLEFT-alt':
            camFollow.x -= camOffsetAmount;
            if (camGame.angle != -1) camGame.angle = lerp(camGame.angle, -1, 0.05);
        case 'singRIGHT' |  'singRIGHT-alt':
            camFollow.x += camOffsetAmount;
            if (camGame.angle != 1) camGame.angle = lerp(camGame.angle, 1, 0.05);
        case 'singUP' | 'singUP-alt':
            camFollow.y -= camOffsetAmount;
            if (camGame.angle != 0)  camGame.angle = lerp(camGame.angle, 0, 0.05);
        case 'singDOWN' |  'singDOWN-alt':
            camFollow.y += camOffsetAmount;
            if (camGame.angle != 0)  camGame.angle = lerp(camGame.angle, 0, 0.05);
    }
}

public var camMove:Bool = true;

function postUpdate() {
    if(camMove) {
        switch (curCameraTarget) {
            case 0:
                __updateCamOffset(dad);
            case 1:
                __updateCamOffset(boyfriend);
            case 2:
                __updateCamOffset(gf);
        }
    }
}