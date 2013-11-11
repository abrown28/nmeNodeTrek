
package com.destructivegenius.nodetrek.graphics;

import flash.display.Bitmap;
import openfl.Assets;

class SunView extends Bitmap {

	public function new() {
		super();
		
		bitmapData = Assets.getBitmapData("assets/sprites/sun01.png");
	}	

}
