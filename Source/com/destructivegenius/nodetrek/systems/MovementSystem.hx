
package com.destructivegenius.nodetrek.systems;

import ash.tools.ListIteratingSystem;

import com.destructivegenius.nodetrek.GameConfig;
import com.destructivegenius.nodetrek.components.Motion;
import com.destructivegenius.nodetrek.components.Position;
import com.destructivegenius.nodetrek.nodes.MovementNode;

class MovementSystem extends ListIteratingSystem<MovementNode>
{
    private var config:GameConfig;

    public function new(config:GameConfig)
    {
        this.config = config;
        super(MovementNode, updateNode);
    }

    private function updateNode(node:MovementNode, time:Float):Void
    {
        var position:Position = node.position;
        var motion:Motion = node.motion;

        position = node.position;
        motion = node.motion;
		
		
		var v = motion.velocity.copy();
		v.multiply(time);
		position.position.add(v);
				
        position.rotation += motion.angularVelocity * time;
		
		//motion.velocity.multiply(0.98*time);

    }
}