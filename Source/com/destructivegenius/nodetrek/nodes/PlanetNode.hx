
package com.destructivegenius.nodetrek.nodes;

import ash.core.Node;

import com.destructivegenius.nodetrek.components.Planet;
import com.destructivegenius.nodetrek.components.Position;
import com.destructivegenius.nodetrek.components.Resource;

class PlanetNode extends Node<PlanetNode> {

    public var planet:Planet;
    public var position:Position;
    public var resource:Resource;
    
}