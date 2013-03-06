
package com.destructivegenius.nodetrek.components;

import ash.fsm.EntityStateMachine;

class Spaceship
{
    public var fsm:EntityStateMachine;

    public function new(fsm:EntityStateMachine)
    {
        this.fsm = fsm;
    }
}