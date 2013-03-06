
package com.destructivegenius.nodetrek;

import flash.ui.Keyboard;

import ash.core.Entity;
import ash.core.Engine;
import ash.fsm.EntityStateMachine;
import ash.tools.ComponentPool;

import com.destructivegenius.nodetrek.GameConfig;
import com.destructivegenius.nodetrek.components.GameState;
import com.destructivegenius.nodetrek.components.Motion;
import com.destructivegenius.nodetrek.components.MotionControls;
import com.destructivegenius.nodetrek.components.Position;
import com.destructivegenius.nodetrek.components.Spaceship;
import com.destructivegenius.nodetrek.components.Player;
import com.destructivegenius.nodetrek.components.Planet;
import com.destructivegenius.nodetrek.components.Gun;
import com.destructivegenius.nodetrek.components.GunControls;
import com.destructivegenius.nodetrek.components.Display;
import com.destructivegenius.nodetrek.graphics.SpaceshipView;
import com.destructivegenius.nodetrek.graphics.PlanetView;


class EntityCreator {

    private var engine:Engine;
    private var config:GameConfig;

    public function new(engine:Engine, config:GameConfig) {

        this.engine = engine;
        this.config = config;

    }

    public function destroyEntity(entity:Entity):Void {

        engine.removeEntity(entity);
//        if (entity.has(Asteroid))
//            ComponentPool.dispose(entity.get(Asteroid));

    }

    public function createGame():Entity {

        var gameEntity:Entity = new Entity()
        	.add(new GameState());
        
        engine.addEntity(gameEntity);

        return gameEntity;

    }

    public function createSpaceship():Entity {

        var spaceship : Entity = new Entity();
        var fsm : EntityStateMachine = new EntityStateMachine( spaceship );

        fsm.createState( "playing" )
//            .add( Motion ).withInstance( new Motion( 0, 0, 0, 15 ) )
//            .add( MotionControls ).withInstance( new MotionControls( Keyboard.LEFT, Keyboard.RIGHT, Keyboard.UP, 100, 3 ) )
//            .add( Gun ).withInstance( new Gun( 8, 0, 0.3, 2 ) )
//            .add( GunControls ).withInstance( new GunControls( Keyboard.SPACE ) )
            //.add( Collision ).withInstance( new Collision( 9 ) )
            .add( Display ).withInstance( new Display( new SpaceshipView() ) );

        //var deathView : SpaceshipDeathView = new SpaceshipDeathView();
        //fsm.createState( "destroyed" )
        //    .add( DeathThroes ).withInstance( new DeathThroes( 5 ) )
        //    .add( Display ).withInstance( new Display( deathView ) )
        //    .add( Animation ).withInstance( new Animation( deathView ) );

        spaceship.add( new Spaceship( fsm ) ).add( new Position( config.width*0.5, config.height*0.5, 0 ) );

        fsm.changeState( "playing" );
        engine.addEntity(spaceship);

        return spaceship;
    }

    public function createPlayer(x:Int, y:Int):Entity {
        var player:Entity = new Entity();

        var fsm : EntityStateMachine = new EntityStateMachine( player );
        fsm.createState("playing")
            .add( Motion ).withInstance( new Motion( 0, 0, 0, 15) )
            .add( MotionControls ).withInstance( new MotionControls( Keyboard.LEFT, Keyboard.RIGHT, Keyboard.UP, 100, 3 ) )
            .add( Display ).withInstance( new Display( new SpaceshipView() ) );

        //fsm.createState("joining")
        //fsm.createState("spawning")
        //fsm.createState("dead")

        player.add( new Player( fsm ) ).add( new Position( config.width*0.5, config.height*0.5, 0 ) );
        engine.addEntity(player);

        return player;
    }

    public function createPlanet(x:Int, y:Int):Entity {

        var planet:Entity = new Entity()
            //.add(ComponentPool.get(Planet))
            .add(new Position(x, y, 0))
            .add(new Display(new PlanetView()) );

        engine.addEntity(planet);

        return planet;

    }
}