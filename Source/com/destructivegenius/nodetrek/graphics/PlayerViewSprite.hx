package com.destructivegenius.nodetrek.graphics;

import spritesheet.AnimatedSprite;
import spritesheet.data.BehaviorData;
import spritesheet.importers.BitmapImporter;
import spritesheet.Spritesheet;
import openfl.Assets;
import flash.display.Sprite;

class PlayerViewSprite extends Sprite
{
	var spritesheet:Spritesheet;
	
    public function new()
    {
		super();
		
		trace("PlayerViewSprite");
		spritesheet = BitmapImporter.create(Assets.getBitmapData("assets/sprites/kit_from_firefox.png"), 3, 9, 56, 80);
    }

}