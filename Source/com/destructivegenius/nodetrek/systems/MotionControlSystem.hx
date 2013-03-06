
package com.destructivegenius.nodetrek.systems;

import ash.tools.ListIteratingSystem;

import com.destructivegenius.nodetrek.components.Motion;
import com.destructivegenius.nodetrek.components.MotionControls;
import com.destructivegenius.nodetrek.components.Position;
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
        var position:Position = node.position;
        var motion:Motion = node.motion;

        if (keyPoll.isDown(control.left))
        {
            position.rotation -= control.rotationRate * time;
        }

        if (keyPoll.isDown(control.right))
        {
            position.rotation += control.rotationRate * time;
        }

        if (keyPoll.isDown(control.accelerate))
        {
            motion.velocity.x += Math.cos(position.rotation) * control.accelerationRate * time;
            motion.velocity.y += Math.sin(position.rotation) * control.accelerationRate * time;
        }
    }
}