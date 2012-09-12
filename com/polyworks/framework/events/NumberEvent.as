//
//  NumberEvent
//
//  Created by polyphonic13 on 2010-01-25.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.framework.events
{
	import flash.events.Event; 
	
	public class NumberEvent extends Event
	{
		public var num:Number;
		public var label:String; 
		
		public function NumberEvent(numberEvent:String, num:Number, label:String = ""):void
		{
			super(numberEvent);
			this.num = num;
			this.label = label;
		}
		
		public override function clone():Event
		{
			return new NumberEvent(this.type, num, label);
		}
		
		public override function toString():String
		{
			return formatToString("NumberEvent", "num", "label", "bubbles", "cancelable", "typePhase");
		}
	}
}