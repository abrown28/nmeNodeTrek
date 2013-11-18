package com.destructivegenius.nodetrek.systems;

import ash.core.Engine;
import ash.core.NodeList;
import ash.core.System;

import com.destructivegenius.nodetrek.EntityCreator;
import com.destructivegenius.nodetrek.GameConfig;
import com.destructivegenius.nodetrek.nodes.*;

import flash.geom.Point;

class GameManager extends System
{
    private var config:GameConfig;
    private var creator:EntityCreator;

    private var gameNodes:NodeList<GameNode>;
    private var orbitals:NodeList<OrbitalNode>;
    private var players:NodeList<PlayerNode>;

    public function new(creator:EntityCreator, config:GameConfig)
    {
        super();
        this.creator = creator;
        this.config = config;
    }

    override public function addToEngine(engine:Engine):Void
    {
        gameNodes = engine.getNodeList(GameNode);
        orbitals = engine.getNodeList(OrbitalNode);
        players = engine.getNodeList(PlayerNode);
    }

    override public function update(time:Float):Void
    {
        for (node in gameNodes)
        {
            if (players.empty)
            {
                //creator.createPlayer(config.width * 0.5, config.height * 0.5);
				creator.createPlayer(0,0);
            }

            if( orbitals.empty && !players.empty ) {
/*                var scale:Int = 100;
                for( x in 0...5 ) {
                    for( y in 0...5 ) {
                        creator.createPlanet(x*scale, y*scale);
                    }
                }
*/

                creator.createSolarSystem(100, 100);
            }
        }
    }

    override public function removeFromEngine(engine:Engine):Void
    {
        gameNodes = null;
        orbitals = null;
        players = null;
    }
}