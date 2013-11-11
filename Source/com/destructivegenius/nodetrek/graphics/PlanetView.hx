
package com.destructivegenius.nodetrek.graphics;

import flash.display.Bitmap;
import openfl.Assets;

class PlanetView extends Bitmap {

	public function new() {
		super();
		
		bitmapData = Assets.getBitmapData("assets/sprites/p1_48x48.png");
	}

}