package com.destructivegenius.nodetrek.components;

import box2D.common.*;
import box2D.collision.*;
import box2D.collision.shapes.*;
import box2D.dynamics.*;

class Body
{

	public var bodyDef:B2BodyDef;
	public var body:B2Body;
	public var box:B2PolygonShape;
	public var fixtureDef:B2FixtureDef;
	public var fixture:B2Fixture;
	    
	public function new(x:Float, y:Float) {
		bodyDef = new B2BodyDef();
		bodyDef.type = B2Body.b2_dynamicBody;
		bodyDef.position.set(x,y);
		
		box = new B2PolygonShape();
		box.setAsBox(1.0, 1.0); 
		
		fixtureDef = new B2FixtureDef();
		fixtureDef.shape = box; 
		fixtureDef.density = 1.0; 
		fixtureDef.friction = 0.3; 
    }

}