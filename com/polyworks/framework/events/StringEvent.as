//
//  StringEvent
//
//  Created by polyphonic13 on 2010-01-25.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.framework.events
{
	import flash.events.Event; 
	
	public class StringEvent extends Event
	{
		public var str:String;
		public var label:String; 
		
		public function StringEvent(strEvent:String, str:String, label:String = ""):void
		{
			super(strEvent);
			this.str = str;
			this.label = label;
		}
		
		public override function clone():Event
		{
			return new StringEvent(this.type, str, label);
		}
		
		public override function toString():String
		{
			return formatToString("StringEvent", "str", "label", "bubbles", "cancelable", "typePhase");
		}
	}
}