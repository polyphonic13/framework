package com.polyworks.events
{
	import flash.events.Event;
	import com.polyworks.events.Factor13Event; 
		
	public class DisplayEvent extends Factor13Event
	{
		public static const BG_LOADED:String = "bgLoaded";
		public static const BG_CLICKED:String = "bgClick";
		public static const BG_ANIMATION_DONE:String = "bgAnimationDone";
		public static const TITLE_ANIMATION_DONE:String = "titleAnimationDone";		
		public static const MAIN_ADDED:String = "mainAdded";
		public static const GOGGLES_ADDED:String = "gogglesAdded";
		public static const SCROLL_ADDED:String = "scrollAdded";
		public static const SCROLL_CLICK:String = "scrollClick";
		public static const END:String = "end";
		public static const PLUG_CLICK:String = "plugClick";
		public static const TUBE_DROPPED:String = "tubeDropped";
		public static const STAR_DROPPED:String = "starDropped";
		public static const ERROR:String = "error"; 
		
	//	public var evt:String;
		public var message:String;
		public var idx:int;
		
		public function DisplayEvent(dEvent:String, idx:int = 0, message:String = ""):void
		{
			super(dEvent);
			//this.event = dEvent;
			this.message = message;
			this.idx = idx;
		}
		
		public override function clone():Event
		{
			return new DisplayEvent(evtType, idx, message);
		}
		
		public override function toString():String
		{
			return formatToString("ParseEvent", "type", "bubbles", "cancelable", "eventPhase", "message");
		}
	}
}