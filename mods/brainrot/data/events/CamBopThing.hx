function onEvent(e) {
    if (e.event.name != "CamBopThing") return;

    FlxG.camera.zoom += 0.015;
	camHUD.zoom += 0.03;
}