package com.destructivegenius.nodetrek.systems;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;

import ash.core.Engine;
import ash.core.NodeList;
import ash.core.System;

import com.destructivegenius.nodetrek.components.*;
import com.destructivegenius.nodetrek.nodes.RenderNode;
import com.destructivegenius.nodetrek.nodes.LocalPlayerNode;

class RenderSystem extends System
{
    public var container:DisplayObjectContainer;

    private var nodes:NodeList<RenderNode>;
	private var player:NodeList<LocalPlayerNode>;

    public function new(container:DisplayObjectContainer)
    {
        super();
        this.container = container;
    }

    override public function addToEngine(engine:Engine):Void
    {
        nodes = engine.getNodeList(RenderNode);
        for (node in nodes)
            addToDisplay(node);
        nodes.nodeAdded.add(addToDisplay);
        nodes.nodeRemoved.add(removeFromDisplay);
		
		player = engine.getNodeList(LocalPlayerNode);
    }

    private function addToDisplay(node:RenderNode):Void
    {
        container.addChild(node.displayObject);
    }

    private function removeFromDisplay(node:RenderNode):Void
    {
        container.removeChild(node.displayObject);
    }

    override public function update(time:Float):Void
	{
		var p = player.head;

		var camera = p.body.body.getPosition();
		camera.multiply(-1.0);
		
        for (node in nodes)
        {
			var displayObject:DisplayObject = node.displayObject;
			var pos = node.body.body.getPosition();
			var rot = node.body.body.getAngle();
			
			displayObject.rotation = rot * 180 / Math.PI;

			if( node.entity != p.entity ) {
				displayObject.x = pos.x - camera.x;
				displayObject.y = pos.y - camera.y;
			}
			else {
				displayObject.x = 400;
				displayObject.y = 300;
			}
		}
    }

    override public function removeFromEngine(engine:Engine):Void
    {
        nodes = null;
    }
}