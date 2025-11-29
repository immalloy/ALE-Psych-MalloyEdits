import hscript.Parser;
import hscript.Interp;
import StringTools;

var buttons:Array<Array<Int>> = [
    [-3, -4, -5, -6],
    [7, 8, 9, -7],
    [4, 5, 6, -8],
    [1, 2, 3, -9],
    [-1, 0, -2, -10]
];

var actualbutton:FlxSpriteGroup;
var buttontext:FlxText;
var sext:FlxSpriteGroup;

var parser = new Parser();
var interp = new Interp();

var nikolaxepstein:FunkinSprite;

function create()
{
    nikolaxepstein = add(new FunkinSprite(0, 300, Paths.image('metalhedz')));
    
    FlxG.mouse.visible = true;
    actualbutton = add(new FlxSpriteGroup(600, 200));
    buttontext = add(new FlxSpriteGroup(600, 200));

    add(sext = new FlxText(-200, 100, FlxG.width)).setFormat(Paths.font('roboto.ttf'), 60, FlxColor.WHITE, 'right', 0);

    for (i in 0...5)
    {
        for (j in 0...4)
        {
            var btnValue = buttons[i][j];
            var label = Std.string(symbol(btnValue));
            
            var btn = new FlxSprite(j * 100, i * 100).loadGraphic(Paths.image('calcbuton'));
            btn.color = FlxColor.fromString(j == 3 ? '#ffa000' : (i == 0 ? '#5a5a5a' : '#303030'));
            btn.ID = btnValue;

            actualbutton.add(btn);

            var txt = new FlxText(j * 100, i * 100 +30, 100, label);
            txt.setFormat(Paths.font('roboto.ttf'), 25, FlxColor.WHITE, 'center', 0);

            buttontext.add(txt);
        }
    }

}

function destroy()
    FlxG.mouse.visible = false;

function symbol(id:Int)
{
    if (id > -1)
        return id;

    switch (id)
    {
        case -2:
            return '.';
        case -3:
            return 'clear';
        case -6:
            return '÷';
        case -7:
            return '×';
        case -8:
            return '-';
        case -9:
            return '+';
        //case -10:
            //return '';
        case -10:
            return 'enter';
        default:
            return -1;

    }
}

function update(elapsed:Float)
{
    if (FlxG.mouse.justPressed)
    {
        for (spr in actualbutton.members)
        {
            if (FlxG.mouse.overlaps(spr))
            {
                //string code and button anim
                spr.scale.set(1.1, 1.1);
                FlxTween.tween(spr.scale, {x: 1, y: 1}, 0.5, {ease: FlxEase.backOut});


                if (spr.ID != -10)
                    sext.text += symbol(spr.ID);
                else
                {
                    var toparse:String = StringTools.replace( (StringTools.replace(StringTools.replace(sext.text, '÷', '/'), '×', '*')),'clear', '*0');
                    sext.text = Std.string(interp.execute(parser.parseString(toparse)));
                }

                break;


            }
        }
    }

    nikolaxepstein.offset.y = Math.abs(Math.sin(Conductor.curBeatFloat * Math.PI) * 100);
}

/*  //code  doodles
function symbol(pee:String, id:Int)
{
    if (id > -1)
        return pee + id;

    switch (id)
    {
        case:
    }
}

string = symbol(string, clicked);


backOut


new cam
cam.alpha = 0.5
cam.copyfrom(camGame)
cm.addShader(shader1)
ytshorts esque  bg filler


import hscript.Parser;
import hscript.Interp;

function evaluateInput()
{
    var parser = new Parser();
    var program = parser.parseString(input.replace('×', '*').replace('÷', '/'));
    var interp = new Interp();
    var result = interp.execute(program);
    input = Std.string(interp.execute(parser.parseString(input.replace('×', '*').replace('÷', '/'))));
}*/