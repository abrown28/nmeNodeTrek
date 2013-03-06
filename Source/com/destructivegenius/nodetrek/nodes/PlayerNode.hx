package com.destructivegenius.nodetrek.nodes;

import ash.core.Node;


import com.destructivegenius.nodetrek.components.Spaceship;
import com.destructivegenius.nodetrek.components.Player;
import com.destructivegenius.nodetrek.components.Spaceship;

class PlayerNode extends Node<PlayerNode>
{
    public var spaceship:Spaceship;
    public var position:Position;
}