
package com.destructivegenius.nodetrek.systems;

import ash.tools.ListIteratingSystem;

import box2D.common.math.*;
import box2D.dynamics.*;
import box2D.collision.*;

import com.destructivegenius.nodetrek.components.*;
import com.destructivegenius.nodetrek.nodes.MotionControlNode;
import com.destructivegenius.nodetrek.KeyPoll;

class MotionControlSystem extends ListIteratingSystem<MotionControlNode>
{
    private var keyPoll:KeyPoll;

    public function new(keyPoll:KeyPoll)
    {
        super(MotionControlNode, updateNode);
        this.keyPoll = keyPoll;
    }

    private function updateNode(node:MotionControlNode, time:Float):Void
    {
        var control:MotionControls = node.control;
        var body:B2Body = node.body.body;
        //var motion:Motion = node.motion;

        if (keyPoll.isDown(control.left))
        {
            //position.rotation -= control.rotationRate * time;
			body.applyTorque(control.rotationRate*-1);
        }

        if (keyPoll.isDown(control.right))
        {
            //position.rotation += control.rotationRate * time;
			body.applyTorque(control.rotationRate);
        }

        if (keyPoll.isDown(control.accelerate))
        {
			var force = new B2Vec2(-1,0);
			var transform:B2Transform = body.getTransform();
			force = B2Math.mulMV(transform.R, force);
			
			//body.applyForce(force, new B2Vec2(0,0));
			body.applyImpulse(force, body.m_sweep.c);
            //motion.velocity.x += Math.cos(position.rotation) * control.accelerationRate * time;
            //motion.velocity.y += Math.sin(position.rotation) * control.accelerationRate * time;
        }
    }
}