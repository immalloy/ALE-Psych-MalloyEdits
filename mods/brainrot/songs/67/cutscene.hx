function create() {
    pausable = false;

	FlxTween.tween(PlayState.instance.dad.colorTransform, {redOffset: -255, greenOffset: -255, blueOffset: -255}, 0.01);
	FlxTween.num(-255, 0, 2, {ease: FlxEase.sineOut}, function(num) {
        PlayState.instance.dad.colorTransform.redOffset = num;
        PlayState.instance.dad.colorTransform.greenOffset = num;
        PlayState.instance.dad.colorTransform.blueOffset = num;
    });

	FlxG.camera.fade(0xFF000000, 1, true);
	FlxG.camera.zoom = 0.5;

	FlxTween.tween(FlxG.camera, {zoom: 1.5}, 2, {ease: FlxEase.quintOut, onComplete: function() {
		close();
	}});
}