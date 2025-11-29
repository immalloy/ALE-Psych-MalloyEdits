var Lincon:FlxSprite = new FlxSprite();
Lincon.loadGraphic(Paths.image("lincon"));
add(Lincon);
Lincon.alpha = 0;
Lincon.cameras = [camHUD];
Lincon.screenCenter();
function onEvent(event)
{
    switch(event.event.name)
    {
        case "Lincon":
            
            FlxTween.tween(Lincon, {y: 365}, 0.001, {ease: FlxEase.sineIn});
            FlxTween.tween(Lincon, {angle: 0}, 0.001, {ease: FlxEase.sineout});
            FlxTween.tween(Lincon, {alpha: 1}, 0.001, {ease: FlxEase.sineout});  
            FlxTween.tween(Lincon, {y: 600}, 0.5, {ease: FlxEase.sineIn});
            FlxTween.tween(Lincon, {alpha: 0}, 0.2, {ease: FlxEase.sineOut});
            FlxTween.tween(Lincon, {angle: -45}, 0.2, {ease: FlxEase.sineOut});

    }
}
