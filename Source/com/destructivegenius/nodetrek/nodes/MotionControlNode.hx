
package com.destructivegenius.nodetrek.nodes;

import ash.core.Node;

import com.destructivegenius.nodetrek.components.Motion;
import com.destructivegenius.nodetrek.components.MotionControls;
import com.destructivegenius.nodetrek.components.Position;

class MotionControlNode extends Node<MotionControlNode>
{
    public var control:MotionControls;
    public var position:Position;
    public var motion:Motion;
}