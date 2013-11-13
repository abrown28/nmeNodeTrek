
package com.destructivegenius.nodetrek;

import flash.ui.Keyboard;
import flash.geom.Point;

import ash.core.Entity;
import ash.core.Engine;
import ash.fsm.EntityStateMachine;
import ash.tools.ComponentPool;

import com.destructivegenius.nodetrek.GameConfig;
import com.destructivegenius.nodetrek.components.*;
import com.destructivegenius.nodetrek.graphics.PlanetView;
import com.destructivegenius.nodetrek.graphics.SunView;
import com.destructivegenius.nodetrek.graphics.PlayerView;
import com.destructivegenius.nodetrek.graphics.PlayerViewSprite;
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

        var fsm : EntityStateMachine = new EntityStateMachine( player );

        fsm.createState("playing")
            .add( Motion ).withInstance( new Motion( 0, 0, 0, 15) )
            .add( MotionControls ).withInstance( new MotionControls( Keyboard.LEFT, Keyboard.RIGHT, Keyboard.UP, 100, 3 ) )
            .add( Display ).withInstance( new Display( new PlayerView() ) );

        //fsm.createState("joining")
        //fsm.createState("spawning")
        //fsm.createState("dead")

        player
            .add( new Player( fsm ) )
			.add( new LocalPlayer() )
            .add( new Position( new B2Vec2(x,y), new Point(0,0), 0 ) );

        fsm.changeState( "playing" );
        
        engine.addEntity(player);

        return player;
    }

    public function createPlanet(sun:Position, orbit:Int, rotation:Float):Entity {

        var p = new B2Vec2( sun.position.x+orbit*50, sun.position.y);
        var planet:Entity = new Entity()
            .add(new Planet() )
            .add(new Position(p, new Point(0, 0), 0) )
            .add(new Resource(ResourceTypes.armies, 1) )
            .add(new Display(new PlanetView()) );

        engine.addEntity(planet);

        return planet;

    }

    public function createSun(x:Int, y:Int):Entity {

		var sunview:SunView = new SunView();
		var offsetX:Float = sunview.width / 2.0;
		var offsetY:Float = sunview.height / 2.0;
		trace(offsetX);
		trace(offsetY);
		
        var sun:Entity = new Entity()
            .add( new Sun() )
            .add( new Position( new B2Vec2(x,y), new Point(offsetX,offsetY), 0) )
            .add( new Display(sunview) );

        engine.addEntity(sun);

        return sun;

    }

    public function createSolarSystem(x:Int, y:Int):Void {

        var sun:Entity = createSun(x,y);
        for( index in 1...4 ) {
         
            createPlanet(sun.get(Position), index, 90*180/Math.PI);

        }

    }
}