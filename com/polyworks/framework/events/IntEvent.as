//
//  IntEvent
//
//  Created by polyphonic13 on 2010-01-25.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.framework.events
{
	import flash.events.Event; 
	
	public class IntEvent extends Event
	{
		public var intVal:int;
		public var label:String; 
		
		public function IntEvent(intEvent:String, intVal:int, label:String = ""):void
		{
			super(intEvent);
			this.intVal = intVal;
			this.label = label;
		}
		
		public override function clone():Event
		{
			return new IntEvent(this.type, intVal, label);
		}
		
		public override function toString():String
		{
			return formatToString("IntEvent", "intVal", "type", "label", "bubbles", "cancelable", "typePhase");
		}
	}
}