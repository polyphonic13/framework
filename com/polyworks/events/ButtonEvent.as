package com.polyworks.events
{
	import flash.events.Event;
	import com.polyworks.events.Factor13Event; 
		
	public class ButtonEvent extends Factor13Event
	{
		public static const VERTICLE_SCROLL:String = "verticleScroll";
		public static const CLEAR_CLICK:String = "clearClick";
		public static const REMOVE_GOGGLES_CLICK:String = "removeGoggles";
		public static const REMOVE_SCROLL_CLICK:String = "removeScroll";
		public static const STASH_SCROLL_CLICK:String = "stashScroll";
		public static const SCROLL_ICON_CLICK:String = "scrollIconClick";

		public static const NUMBER_CLICK:String = "numberClick";
		public static const INT_CLICK:String = "intClick"; 
		public static const STRING_CLICK:String = "stringClick";
		public static const CLOSE:String = "close";
		
		//public var evt:String;
		public var idx:int;
		public var val:Number; 
		public var str:String;
		
		public function ButtonEvent(bEvent:String, idx:int = 0, val:Number = 0, str:String = ""):void
		{
			super(bEvent);
			//this.event = bEvent;
			this.idx = idx;
			this.val = val;
			this.str = str;
		}
		
		public override function clone():Event
		{
			return new ButtonEvent(evtType, idx, val, str);
		}
		
		public override function toString():String
		{
			return formatToString("ButtonEvent", "type", "bubbles", "cancelable", "eventPhase", "message");
		}
	}
}