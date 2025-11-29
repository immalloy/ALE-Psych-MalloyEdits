function postCreate()
{
    if (!Options.gameplayShaders) return;

    dad.blend = 7;
    dad.shader = pee = new CustomShader('glitch');

    camGame.addShader(evil = new CustomShader('gray'));

    FlxTween.num(0, 1, 1, null, num -> {
        evil.grey = num;
        pee.pee = 0.04;
    });
}