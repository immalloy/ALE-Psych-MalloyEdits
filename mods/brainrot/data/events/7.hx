var seven:FlxSprite = new FlxSprite();
seven.loadGraphic(Paths.image("game/score/num7"));
add(seven);
seven.alpha = 0;

FlxTween.tween(seven, {y: 365}, 0.001, {ease: FlxEase.sineIn});
FlxTween.tween(seven, {x: 1100}, 0.001, {ease: FlxEase.sineIn});
function onEvent(event)
{
    switch(event.event.name)
    {
        case "7":
            
            FlxTween.tween(seven, {y: 365}, 0.001, {ease: FlxEase.sineIn});
            FlxTween.tween(seven, {angle: 0}, 0.001, {ease: FlxEase.sineout});
            FlxTween.tween(seven, {alpha: 1}, 0.001, {ease: FlxEase.sineout});  
            FlxTween.tween(seven, {y: 600}, 0.5, {ease: FlxEase.sineIn});
            FlxTween.tween(seven, {alpha: 0}, 0.2, {ease: FlxEase.sineOut});
            FlxTween.tween(seven, {angle: 45}, 0.2, {ease: FlxEase.sineOut});
    }
}
