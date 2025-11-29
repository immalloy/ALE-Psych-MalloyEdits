import flixel.tweens.FlxEase;


var bloomShader = new CustomShader("bloom");

function bloomHandler() {
    bloomShader.brightness = 0.3;
    bloomShader.threshold = 0.001;
    bloomShader.directions = 10;
    bloomShader.quality = 10;
    bloomShader.size = 10.0;
    camGame.addShader(bloomShader);
}

function postCreate() {
    
    camGame.addShader(evil = new CustomShader('gray'));
    bg.shader = new CustomShader("glitching");
    bg.shader.AMT = 0.2;
    bg.shader.SPEED =0.4;
    stageCurtains.shader = new CustomShader("glitching");
    stageCurtains.shader.AMT = 0.01;
    stageCurtains.shader.SPEED =0.4;
    stageFront.shader = new CustomShader("glitching");
    stageFront.shader.AMT = 0.01;
    stageFront.shader.SPEED =1;
    stageBackbork.shader = new CustomShader("glitching");
    stageBackbork.shader.AMT = 0.2;
    stageBackbork.shader.SPEED =0.4;
    stageFrontbork.shader = new CustomShader("glitching");
    stageFrontbork.shader.AMT = 0.01;
    stageFrontbork.shader.SPEED =0.4;
    lightbork.shader = new CustomShader("glitching");
    lightbork.shader.AMT = 0.01;
    lightbork.shader.SPEED =1;

    skyLincoln.shader = new CustomShader("shake");
    skyLincoln.shader.strength = 0.2;
    skyLincoln.shader.speed = 0.5;
    skyLincoln.shader.even = true;
    skyLincoln.shader.detail = 50.0;
    skyLincoln.shader.baseScale = 0.5;
    FlxTween.num(0, 1, 0.1, null, num -> {
        evil.grey = num;
    });
    dad.x = -1000;
    skyLincoln.alpha =0;
    stageFrontbork.alpha =0;
    stageBackbork.alpha =0;
    lightbork.alpha =0;
    bloomHandler();
}

function onSongStart() {
    if (dad != null)
        FlxTween.tween(dad, { x: 0 }, 6.0);
}

function stepHit(curStep:Int) {
    switch(curStep) {
        case 415:

            bf.y = -100;
            FlxTween.num(0, 0, 3, { ease: FlxEase.circOut }, num -> {
                evil.grey = num;
            });
            FlxTween.tween(stageCurtains, { y : 1500 }, 2, { ease: FlxEase.circOut });
            FlxTween.tween(bg, { y : 1500 }, 2, { ease: FlxEase.circOut });
            FlxTween.tween(stageFront, { y : 1500 }, 2, { ease: FlxEase.circOut });
            FlxTween.tween(stageCurtains, { angle : 15 }, 2, { ease: FlxEase.circOut });
            FlxTween.tween(bg, { angle : 15}, 2, { ease: FlxEase.circOut });
            FlxTween.tween(stageFront, { angle : 15 }, 2, { ease: FlxEase.circOut });  
            skyLincoln.alpha = 1;
            stageFrontbork.alpha = 1;
            stageBackbork.alpha = 1;
            lightbork.alpha = 1;
            dad.x = -400;
            dad.y = -100;
            
            bloomShader.brightness = 10;
            bloomShader.size = 12.0;
            FlxTween.tween(bloomShader, { brightness: 0 }, 1, { ease: FlxEase.circOut });
            FlxTween.tween(bloomShader, { size: 10.0 }, 1, { ease: FlxEase.circOut });
    }
}

var shaderTimer:Float = 0;

var angleTimer:Float = 0;
var yTimer:Float = 0;


function update(elapsed:Float) {
    

    if (curStep >= 415) { 
    
    dad.angle = Math.sin(angleTimer) * 2;
    
    }
    shaderTimer += elapsed;
    skyLincoln.shader.time = shaderTimer * 50;
    bg.shader.iTime = curStep;
    stageBackbork.shader.iTime = curStep;
    stageFrontbork.shader.iTime = curStep;
    lightbork.shader.iTime = curStep;
    angleTimer += elapsed * 2 ;
    linconrock.angle = Math.sin(angleTimer) * 2;
    linconrock2.angle = Math.sin(angleTimer) * 2;
    linconrock3.angle = Math.sin(angleTimer) * 3;
    linconrock4.angle = Math.sin(angleTimer) * 5;
    linconrock2.y = 500 -Math.sin(yTimer) * 20;
    linconrock3.y = 500 + Math.sin(yTimer) * 50;
    linconrock4.y = 500 - Math.sin(yTimer) * 50;
    yTimer += elapsed * 3;
    
}
