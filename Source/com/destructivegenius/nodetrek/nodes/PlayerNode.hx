package com.destructivegenius.nodetrek.nodes;

import ash.core.Node;


import com.destructivegenius.nodetrek.components.Position;
import com.destructivegenius.nodetrek.components.Player;

class PlayerNode extends Node<PlayerNode>
{
    public var position:Position;
    public var player:Player;
}