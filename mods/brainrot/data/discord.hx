import funkin.backend.utils.DiscordUtil;

function onDiscordPresenceUpdate(e) {
	var data = e.presence;

	if(data.button1Label == null)
		data.button1Label = "Community Server";
	if(data.button1Url == null)
		data.button1Url = "https://discord.gg/A8S7gShrVY";
}

function onGameOver() {
	if (!release) DiscordUtil.changePresence('Game Over');
	else DiscordUtil.changeSongPresence("Game Over", PlayState.SONG.meta.displayName);
}

function onPlayStateUpdate() {
    if (!release) {
	    DiscordUtil.changeSongPresence("Playing a Song", (PlayState.instance.paused ? "Paused" : ""));
    } else { 
        DiscordUtil.changeSongPresence(
		    PlayState.instance.detailsText,
		    (PlayState.instance.paused ? "Paused - " : "") + PlayState.SONG.meta.displayName,
		    PlayState.instance.inst,
		    PlayState.instance.getIconRPC()
	    );
    }
}

function onMenuLoaded(name:String) {
	DiscordUtil.changePresenceSince("In the Menus", name);
}

function onEditorTreeLoaded(name:String) {
	switch(name) {
		case "Character Editor":
			DiscordUtil.changePresenceSince("Choosing a Character", null);
		case "Chart Editor":
			DiscordUtil.changePresenceSince("Choosing a Chart", null);
		case "Stage Editor":
			DiscordUtil.changePresenceSince("Choosing a Stage", null);
	}
}

function onEditorLoaded(name:String, editingThing:String) {
	switch(name) {
		case "Character Editor":
			if (!release) DiscordUtil.changePresenceSince("Editing a Character", null);
            else DiscordUtil.changePresenceSince("Editing a Character", editingThing);
		case "Chart Editor":
			if (!release) DiscordUtil.changePresenceSince("Editing a Chart", null);
            else DiscordUtil.changePresenceSince("Editing a Chart", editingThing);
		case "Stage Editor":
			if (!release) DiscordUtil.changePresenceSince("Editing a Stage", null);
            else DiscordUtil.changePresenceSince("Editing a Stage", editingThing);
	}
}