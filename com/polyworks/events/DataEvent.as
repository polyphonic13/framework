package com.polyworks.events
{
	import flash.events.Event;
	import com.polyworks.events.Factor13Event; 

	/**
	 * DataEvent
	 *
	 * @author Paul Hoover
	 * Extended Event class that includes
	 * custom messages for custom Data 
	 * loading / parsing classes
	 *
	 */
	public class DataEvent extends Factor13Event
	{
		public static const ALL_DATA_LOADED:String = "allDataLoaded"; 
		
		public static const PLAYLIST_DATA_LOADED:String = "playlistDataLoaded";
		public static const CONTROLS_DATA_LOADED:String = "controlsDataLoaded"; 
		public static const THEME_DATA_LOADED:String = "themeDataLoaded"; 

		public static const ERROR:String = "error";

		//public var evt:String;
		public var message:String;
		public var idx:int;
		
		public function DataEvent(dEvent:String, message:String = "", idx:int = 0):void
		{
			super(dEvent);
			//this.event = dEvent;
			this.message = message;
			this.idx = idx;
		}
		
		public override function clone():Event
		{
			return new DataEvent(evtType, message, idx);
		}
		
		public override function toString():String
		{
			return formatToString("DataEvent", "type", "bubbles", "cancelable", "eventPhase", "message");
		}
	}
}