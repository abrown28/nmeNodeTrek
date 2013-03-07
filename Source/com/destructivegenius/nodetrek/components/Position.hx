
package com.destructivegenius.nodetrek.components;

import flash.geom.Point;

class Position
{

    public var position:Point;
    public var offset:Point;
    public var rotation:Float;

    public function new(position:Point, offset:Point, rotation:Float) {

        this.position = position;
        this.offset = offset;
        this.rotation = rotation;

    }

}