package com.polyworks.events
{
	import flash.events.Event;
	import com.polyworks.events.Factor13Event; 
	
	/**
	 * LoadEvent
	 *
	 * @author Paul Hoover
	 * Extended Event class that includes
	 * custom messages, and int and Number values
	 * as well as containing events for 
	 * <ul>
	 * 	<li>ProgressEvent</li>
	 * 	<li>IOErrorEvent</li>
	 * 	<li>HTTPStatusEvent</li>
	 * </li>
	 * thus eliminating the need to import each. 
	 */
	public class LoadEvent extends Factor13Event
	{
		public static const LOADED:String = "loaded";
		public static const ERROR:String = "error";
		public static const COMPLETE:String = "complete";
		
		public static const TOP_NODE_ERROR:String = "top node of xml doesn't match parseXml parameter";		
		public static const LOAD_ERROR:String = "error loading url";
		
		public static const IO_ERROR:String = "io error";
		public static const SECURITY_ERROR:String = "security error";
		public static const HTTP_STATUS:String = "httpStatus"; 
		
		public static const LOADER_NULL:String = "loaderNull";
		
		public static const PROGRESS:String = "progress"; 
		
		public static const PLAYLIST_LOADING:String = "loading playlist";
		public static const PLAYLIST_LOADED:String = "loaded playlist";
	
		//public var evt:String;
		public var message:String;
		public var idx:int;
		public var value:Number;
		
		public function LoadEvent(loadEvent:String, message:String = "", idx:int = 0, value:Number = 0):void
		{
			super(loadEvent);
			//this.event = loadEvent;
			this.message = message;
			this.idx = idx;
			this.value = value; 
		}
		
		public override function clone():Event
		{
			return new LoadEvent(evtType, message, idx, value); 
		}
		
		public override function toString():String
		{
			return formatToString("LoadEvent", "type", "bubbles", "cancelable", "typePhase", "message");
		}
	}
}