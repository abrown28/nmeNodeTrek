
package com.destructivegenius.nodetrek.graphics;

import flash.display.Shape;

class SpaceshipView extends Shape
{
    public function new() {

        super();
        graphics.beginFill(0x000000);
        graphics.moveTo(10, 0);
        graphics.lineTo(-7, 7);
        graphics.lineTo(-4, 0);
        graphics.lineTo(-7, -7);
        graphics.lineTo(10, 0);
        graphics.endFill();
        
    }

}