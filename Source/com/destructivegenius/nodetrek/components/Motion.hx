
package com.destructivegenius.nodetrek.components;

import flash.geom.Point;
import box2D.common.math.B2Vec2;

class Motion
{
	public var velocity:B2Vec2;
    public var angularVelocity:Float;
    public var damping:Float;

    public function new(velocityX:Float, velocityY:Float, angularVelocity:Float, damping:Float)
    {
		velocity = new B2Vec2( velocityX, velocityY );
        this.angularVelocity = angularVelocity;
        this.damping = damping;
    }
}