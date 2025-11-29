import Shadow;

var blurShader = new CustomShader('blur');
var shadows = [];

function postCreate() {
    blurShader.directions = 16;
    blurShader.quality = 16;
    blurShader.size = 40;

    for (chars in [strumLines.members[0].characters[0], strumLines.members[1].characters[0]]) {
        var shadow = new Shadow(chars);
        
        if (Options.gameplayShaders)
            shadow.shader = blurShader;

        switch(chars) {
            case strumLines.members[0].characters[0]:
                shadow.transformMatrix = new FlxMatrix(1.1, -0.25, 0, -0.25, -15, -695);
            case strumLines.members[1].characters[0]:
                shadow.transformMatrix = new FlxMatrix(1, 0.1, 0, -0.5, 20, -590);
        }
        shadows.push(shadow);
    }
}