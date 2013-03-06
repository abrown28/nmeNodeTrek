package com.destructivegenius.nodetrek.systems;

import ash.core.Engine;
import ash.core.NodeList;
import ash.core.System;

import com.destructivegenius.nodetrek.EntityCreator;
import com.destructivegenius.nodetrek.GameConfig;
//import com.destructivegenius.nodetrek.nodes.AsteroidCollisionNode;
//import com.destructivegenius.nodetrek.nodes.BulletCollisionNode;
import com.destructivegenius.nodetrek.nodes.GameNode;
import com.destructivegenius.nodetrek.nodes.SpaceshipNode;
import com.destructivegenius.nodetrek.nodes.PlanetNode;

import flash.geom.Point;

class GameManager extends System
{
    private var config:GameConfig;
    private var creator:EntityCreator;

    private var gameNodes:NodeList<GameNode>;
    private var spaceships:NodeList<SpaceshipNode>;
    private var planets:NodeList<PlanetNode>;
    //private var asteroids:NodeList<AsteroidCollisionNode>;
    //private var bullets:NodeList<BulletCollisionNode>;

    public function new(creator:EntityCreator, config:GameConfig)
    {
        super();
        this.creator = creator;
        this.config = config;
    }

    override public function addToEngine(engine:Engine):Void
    {
        gameNodes = engine.getNodeList(GameNode);
        spaceships = engine.getNodeList(SpaceshipNode);
        planets = engine.getNodeList(PlanetNode);
        //asteroids = engine.getNodeList(AsteroidCollisionNode);
        //bullets = engine.getNodeList(BulletCollisionNode);
    }

    override public function update(time:Float):Void
    {
        for (node in gameNodes)
        {
            if (spaceships.empty)
            {
                if (node.state.lives > 0)
                {
                    var newSpaceshipPosition:Point = new Point( config.width * 0.5, config.height * 0.5 );
                    var clearToAddSpaceship:Bool = true;

/*                    for (asteroid in asteroids)
                    {
                        if (Point.distance(asteroid.position.position, newSpaceshipPosition) <= asteroid.collision.radius + 50)
                        {
                            clearToAddSpaceship = false;
                            break;
                        }
                    }
*/                    
                    if (clearToAddSpaceship)
                    {
                        creator.createSpaceship();
                        node.state.lives--;
                    }
                }
                else
                {
                    // game over
                }
            }

            if( planets.empty && !spaceships.empty ) {
                var scale:Int = 100;
                for( x in 0...5 ) {
                    for( y in 0...5 ) {
                        creator.createPlanet(x*scale, y*scale);
                    }
                }

            }
        }
    }

    override public function removeFromEngine(engine:Engine):Void
    {
        gameNodes = null;
        spaceships = null;
        planets = null;
        //asteroids = null;
        //bullets = null;
    }
}