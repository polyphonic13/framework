//
//  EventCenter
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
//	application level dispatcher. utilized by commands.Controller
//	to listen to events coupled with Commands' execute methods.
//
// usage:
//
/*
	public class TestEventCenter extends EventCenter
	{
		private static var _instance:TestEventCenter;
	
		public function TestEventCenter(){}
	
		public static function getInstance():TestEventCenter
		{
			if(_instance == null) 
			{
				_instance = new TestEventCenter(); 
			} 
			return _instance;
		}
	
		public static function killInstance():void 
		{
			_instance = null; 
		}
	
	}
	
	TestEventCenter.getInstance().dispatchEvent(new Event(Event.COMPLETE));
*/
//
package com.polyworks.framework.events
{
	import flash.events.EventDispatcher; 
	
	public class EventCenter extends EventDispatcher
	{
		private static var _instance:EventCenter; 
		
		public function EventCenter() {}
		
		public static function getInstance():EventCenter
		{
			if(_instance == null) 
			{
				_instance = new EventCenter(); 
			} 
			return _instance; 
		}
		
		public static function killInstance():void 
		{
			_instance = null;
		} 
	}
}