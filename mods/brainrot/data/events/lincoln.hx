var six:FlxSprite = new FlxSprite();
six.loadGraphic(Paths.image("game/score/num6"));
add(six);
six.alpha = 0;

FlxTween.tween(six, {y: 365}, 0.001, {ease: FlxEase.sineIn});
FlxTween.tween(six, {x: 1000}, 0.001, {ease: FlxEase.sineIn});
function onEvent(event)
{
    switch(event.event.name)
    {
        case "6":
            
            FlxTween.tween(six, {y: 365}, 0.001, {ease: FlxEase.sineIn});
            FlxTween.tween(six, {angle: 0}, 0.001, {ease: FlxEase.sineout});
            FlxTween.tween(six, {alpha: 1}, 0.001, {ease: FlxEase.sineout});  
            FlxTween.tween(six, {y: 600}, 0.5, {ease: FlxEase.sineIn});
            FlxTween.tween(six, {alpha: 0}, 0.2, {ease: FlxEase.sineOut});
            FlxTween.tween(six, {angle: -45}, 0.2, {ease: FlxEase.sineOut});

    }
}
