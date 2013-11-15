package com.destructivegenius.nodetrek.systems;

import ash.core.*;
import ash.tools.ListIteratingSystem;
import box2D.common.math.*;
import box2D.dynamics.*;
import box2D.collision.*;
import com.destructivegenius.nodetrek.nodes.*;

class Box2DPhysicsSystem extends ListIteratingSystem<BodyNode> {

	var world:B2World;
	var gravity:B2Vec2;
	var velocityIterations = 6; 
	var positionIterations = 2;
	
	public function new()
    {
        super(BodyNode, nodeUpdate, nodeAdd, nodeRemove);
		
		gravity = new B2Vec2(0.0, 0.0);
		world = new B2World(gravity, true);
    }

	override public function update(time:Float):Void {
		world.step(time, velocityIterations, positionIterations);
	}
	
	private function nodeUpdate(node:BodyNode, time:Float):Void {
		trace('nodeUpdate');
		//world.step(time, velocityIterations, positionIterations);
	}
	
	private function nodeAdd(node:BodyNode):Void {
		trace('added node');
		
		node.body.body = world.createBody(node.body.bodyDef);
		node.body.fixture = node.body.body.createFixture(node.body.fixtureDef); 
		
		//node.body.body.setLinearDamping(0.1);
		node.body.body.setAngularDamping(0.9);

	}
	
	private function nodeRemove(node:BodyNode):Void {
	}
}