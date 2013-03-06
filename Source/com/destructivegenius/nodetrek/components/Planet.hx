
package com.destructivegenius.nodetrek.components;

class Planet {

	public var armies:Int;
	public var fuel:Bool;
	public var repair:Bool;
	public var agri:Bool;

	public function new(armies:Int, fuel:Bool, repair:Bool, agri:Bool) {
		this.armies = armies;
		this.fuel = fuel;
		this.repair = repair;
		this.agri = agri;
	}	

}