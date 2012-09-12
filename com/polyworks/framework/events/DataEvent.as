//
//  DataEvent
//
//  Created by polyphonic13 on 2010-01-25.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.framework.events
{
	import flash.events.Event; 
	
	public class DataEvent extends Event
	{
		public var obj:Object;
		
		public function DataEvent(dataEvt:String, obj:Object):void
		{
			super(dataEvt);
			this.obj = obj;
		}
		
		public override function clone():Event
		{
			return new DataEvent(this.type, obj);
		}
		
		public override function toString():String
		{
			return formatToString("DataEvent", "obj", "type", "label", "bubbles", "cancelable", "typePhase");
		}
	}
}