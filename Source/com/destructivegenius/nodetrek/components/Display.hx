
package com.destructivegenius.nodetrek.components;

import flash.display.DisplayObject;

class Display
{
    public var displayObject(default, null):DisplayObject;
	public var displayLayer:Int = 0;

    public function new(displayObject:DisplayObject)
    {
        this.displayObject = displayObject;
    }
}