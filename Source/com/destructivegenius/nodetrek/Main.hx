package com.destructivegenius.nodetrek;

import nme.display.Sprite;
import flash.events.Event;
import flash.Lib;


class Main extends Sprite {
	
	
	public function new () {
		super ();
		addEventListener(Event.ENTER_FRAME, onEnterFrame);	
	}

	private function onEnterFrame(event:Event) {
		removeEventListener(Event.ENTER_FRAME, onEnterFrame);

		var nodetrek = new NodeTrek(this, stage.stageWidth, stage.stageHeight);
		nodetrek.start();
	}

	private static function main()
    {
        Lib.current.addChild(new Main());
    }
}