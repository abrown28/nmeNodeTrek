
package com.destructivegenius.nodetrek.components;

//import haxe.FastList;
import haxe.ds.GenericStack;
import com.destructivegenius.nodetrek.components.Resource;
import ash.core.Entity;

class Planet {

	public var orbit:Float;
	public var rotation:Float;
	public var sun:Entity;
	public var resources:GenericStack<Resource>;



	//public function new( sun:Entity, orbit:Int, rotation:Float ) {
	public function new() {
/*
		this.sun = sun;
		this.orbit = orbit;
		this.rotation = rotation;
*/
	}	

}