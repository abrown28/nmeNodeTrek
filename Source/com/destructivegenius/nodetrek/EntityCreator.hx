
package com.destructivegenius.nodetrek;

import flash.ui.Keyboard;

import ash.core.Entity;
import ash.core.Engine;
import ash.fsm.EntityStateMachine;
import ash.tools.ComponentPool;

import com.destructivegenius.nodetrek.components.GameState;
import com.destructivegenius.nodetrek.components.Motion;
import com.destructivegenius.nodetrek.components.MotionControls;
import com.destructivegenius.nodetrek.components.Position;
import com.destructivegenius.nodetrek.components.Spaceship;
import com.destructivegenius.nodetrek.components.Gun;
import com.destructivegenius.nodetrek.components.GunControls;
import com.destructivegenius.nodetrek.components.Display;
import com.destructivegenius.nodetrek.graphics.SpaceshipView;


class EntityCreator {

    private var engine:Engine;

    public function new(engine:Engine)
    {
        this.engine = engine;
    }

    public function destroyEntity(entity:Entity):Void
    {
        engine.removeEntity(entity);
//        if (entity.has(Asteroid))
//            ComponentPool.dispose(entity.get(Asteroid));
    }

    public function createGame():Entity
    {
        var gameEntity:Entity = new Entity()
        	.add(new GameState());
        
        engine.addEntity(gameEntity);

        return gameEntity;
    }

    public function createSpaceship():Entity
    {
        var spaceship : Entity = new Entity();
        var fsm : EntityStateMachine = new EntityStateMachine( spaceship );

        fsm.createState( "playing" )
            .add( Motion ).withInstance( new Motion( 0, 0, 0, 15 ) )
            .add( MotionControls ).withInstance( new MotionControls( Keyboard.LEFT, Keyboard.RIGHT, Keyboard.UP, 100, 3 ) )
            .add( Gun ).withInstance( new Gun( 8, 0, 0.3, 2 ) )
            .add( GunControls ).withInstance( new GunControls( Keyboard.SPACE ) )
            //.add( Collision ).withInstance( new Collision( 9 ) )
            .add( Display ).withInstance( new Display( new SpaceshipView() ) );

        //var deathView : SpaceshipDeathView = new SpaceshipDeathView();
        //fsm.createState( "destroyed" )
        //    .add( DeathThroes ).withInstance( new DeathThroes( 5 ) )
        //    .add( Display ).withInstance( new Display( deathView ) )
        //    .add( Animation ).withInstance( new Animation( deathView ) );

        spaceship.add( new Spaceship( fsm ) ).add( new Position( 300, 225, 0 ) );

        fsm.changeState( "playing" );
        engine.addEntity(spaceship);

        return spaceship;
    }
}