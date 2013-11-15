
package com.destructivegenius.nodetrek.nodes;

import ash.core.Node;

import com.destructivegenius.nodetrek.components.Motion;
import com.destructivegenius.nodetrek.components.MotionControls;
import com.destructivegenius.nodetrek.components.Body;

class MotionControlNode extends Node<MotionControlNode>
{
    public var control:MotionControls;
    public var body:Body;
    public var motion:Motion;
}