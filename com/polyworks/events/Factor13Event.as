//
//  Factor13Event
//
//  Created by polyphonic13 on 2009-11-18.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.events
{
	import flash.events.Event; 
	
	public class Factor13Event extends Event implements IFactor13Event
	{
		public var evtType:String; 
		
		function Factor13Event(evt:String)
		{
			super(evt); 
			evtType = evt;
		}

		public override function clone():Event
		{
			return new Factor13Event(evtType);
		}
		
	}
}