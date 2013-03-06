package com.destructivegenius.nodetrek.nodes;

import ash.core.Node;

import com.destructivegenius.nodetrek.components.Motion;
import com.destructivegenius.nodetrek.components.Position;

class MovementNode extends Node<MovementNode>
{
    public var position:Position;
    public var motion:Motion;
}