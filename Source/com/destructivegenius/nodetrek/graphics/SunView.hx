
package com.destructivegenius.nodetrek.graphics;

import flash.display.Shape;

class SunView extends Shape {

	public function new() {

		super();
		graphics.beginFill(0xEEEE00);
        graphics.drawCircle(0,0,30);
        graphics.endFill();

	}	

}
