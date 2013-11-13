
package com.destructivegenius.nodetrek.components;

import flash.geom.Point;
import box2D.common.math.B2Vec2;

class Position
{

    public var position:B2Vec2;
    public var offset:Point;
    public var rotation:Float;

    public function new(position:B2Vec2, offset:Point, rotation:Float) {

        this.position = position;
        this.offset = offset;
        this.rotation = rotation;

    }

}