
package com.destructivegenius.nodetrek;

import flash.ui.Keyboard;
import flash.geom.Point;

import ash.core.Entity;
import ash.core.Engine;
import ash.fsm.EntityStateMachine;
import ash.tools.ComponentPool;

import com.destructivegenius.nodetrek.GameConfig;
import com.destructivegenius.nodetrek.components.*;
import com.destructivegenius.nodetrek.graphics.*;
import com.destructivegenius.nodetrek.systems.ResourceTypes;

import box2D.common.math.B2Vec2;

class EntityCreator {

    private var engine:Engine;
    private var config:GameConfig;

    public function new(engine:Engine, config:GameConfig) {

        this.engine = engine;
        this.config = config;

    }

    public function destroyEntity(entity:Entity):Void {

        engine.removeEntity(entity);

    }

    public function createGame():Entity {

        var gameEntity:Entity = new Entity()
        	.add(new GameState());
        
        engine.addEntity(gameEntity);

        return gameEntity;

    }

    public function createPlayer(x:Float, y:Float):Entity {
        var player:Entity = new Entity();

        player
			//.add( new LocalPlayer() )
			.add( new Body(x,y) )
			.add( new Player() )
			.add( new MotionControls( Keyboard.LEFT, Keyboard.RIGHT, Keyboard.UP, 100, 3 ) )
			.add( new Display(new PlayerView()) );

		engine.addEntity(player);

        return player;
    }

    public function createPlanet(x:Float, y:Float, orbit:Int, rotation:Float):Entity {

        var planet:Entity = new Entity()
            .add( new Orbital() )
			.add( new Body(x, y) )
            .add( new Display(new PlanetView()) );

        engine.addEntity(planet);

        return planet;

    }

    public function createSun(x:Int, y:Int):Entity {

        var sun:Entity = new Entity()
            .add( new Orbital() )
            .add( new Body( x, y ) )
            .add( new Display(new SunView()) );

        engine.addEntity(sun);

        return sun;

    }

    public function createSolarSystem(x:Int, y:Int):Void {

        var sun:Entity = createSun(x,y);
        for( index in 1...4 ) {
         
            createPlanet(x+50*index, y, index, 90*180/Math.PI);

        }

    }
}