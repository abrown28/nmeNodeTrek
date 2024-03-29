
package com.destructivegenius.nodetrek;

import flash.display.DisplayObjectContainer;

import ash.tick.ITickProvider;
import ash.tick.FrameTickProvider;
import ash.core.Engine;

import com.destructivegenius.nodetrek.GameConfig;
import com.destructivegenius.nodetrek.systems.*;
import com.destructivegenius.nodetrek.KeyPoll;

class NodeTrek {

	private var container:DisplayObjectContainer;
	private var engine:Engine;
    private var creator:EntityCreator;
    private var config:GameConfig;
    private var tickProvider:FrameTickProvider;
    private var keyPoll:KeyPoll;

	public function new(container:DisplayObjectContainer, width:Float, height:Float) {
        this.container = container;
        prepare(width, height);
    }

    private function prepare(width:Float, height:Float):Void {
        engine = new Engine();
        
        config = new GameConfig();
        config.width = width;
        config.height = height;

        keyPoll = new KeyPoll( container.stage );
        creator = new EntityCreator( engine, config );

        engine.addSystem(new GameManager( creator, config ), SystemPriorities.preUpdate);
        engine.addSystem(new MotionControlSystem( keyPoll ), SystemPriorities.update);
//        engine.addSystem(new GunControlSystem( keyPoll, creator ), SystemPriorities.update);
//        engine.addSystem(new BulletAgeSystem( creator ), SystemPriorities.update);
//        engine.addSystem(new DeathThroesSystem( creator ), SystemPriorities.update);
		engine.addSystem(new Box2DPhysicsSystem(), SystemPriorities.update);
        //engine.addSystem(new MovementSystem( config ), SystemPriorities.move);
//        engine.addSystem(new CollisionSystem( creator ), SystemPriorities.resolveCollisions);
//        engine.addSystem(new AnimationSystem(), SystemPriorities.animate);
        engine.addSystem(new RenderSystem( container ), SystemPriorities.render);


        creator.createGame();

    }

    public function start():Void {
        tickProvider = new FrameTickProvider( container );
        tickProvider.add(engine.update);
        tickProvider.start();
    }

}