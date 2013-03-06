
package com.destructivegenius.nodetrek.graphics;

import flash.display.Shape;

class PlanetView extends Shape {

	public function new() {

		super();
		graphics.beginFill(0xaa0000);
        graphics.drawCircle(0,0,20);
        graphics.endFill();

	}

}