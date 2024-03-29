package com.destructivegenius.nodetrek;

import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import flash.events.Event;
import flash.Lib;


class Main extends Sprite {
	
	
	public function new () {
		super ();
		addEventListener(Event.ENTER_FRAME, onEnterFrame);	
	}

	private function onEnterFrame(event:Event) {
		removeEventListener(Event.ENTER_FRAME, onEnterFrame);

		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		var nodetrek = new NodeTrek(this, stage.stageWidth, stage.stageHeight);
		nodetrek.start();
	}

	private static function main()
    {
        Lib.current.addChild(new Main());
    }

}