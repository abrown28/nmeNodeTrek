
package com.destructivegenius.nodetrek.nodes;

import ash.core.Node;

import com.destructivegenius.nodetrek.components.Position;
import com.destructivegenius.nodetrek.components.Planet;

class PlanetNode extends Node<PlanetNode>
{
    public var planet:Planet;
    public var position:Position;
}