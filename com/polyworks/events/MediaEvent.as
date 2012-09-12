package com.polyworks.events
{
	import flash.events.Event;
	import com.polyworks.events.Factor13Event; 
	import com.polyworks.utils.logging.Logger; 
	
	/**
	 * MediaEvent
	 *
	 * @author Paul Hoover
	 * @extends flash.events.Event
	 * custome media events with optional data Object
	 * for event values
	 */
	public class MediaEvent extends Factor13Event
	{
		public static const MEDIA_START:String = "mediaStart"; 
		public static const MEDIA_STOP:String = "mediaStop"; 
		public static const MEDIA_COMPLETE:String = "mediaComplete"; 

		public static const META_DATA:String = "metaData";
		public static const ID3_DATA:String = "id3Data";
		public static const POSITION_UPDATE:String = "positionUpdate"; 
		public static const VARS_LOADED:String = "varsLoaded";
		
		public var evt:String;
		public var data:Object; 
		
		public function MediaEvent(mEvent:String, mData:Object):void
		{
			super(mEvent);
			this.evt = mEvent;
			this.data = mData;
		}

		public override function clone():Event
		{
			//Logger.output("MediaEvent/clone\n\tthis.type = " + this.type + "\n\tdata = " + Logger.dump(data));
			return new MediaEvent(this.type, data); 
		}

		public override function toString():String
		{
			return formatToString("MediaEvent", "evt", "bubbles", "cancelable", "eventPhase", "message");
		}
	}
}