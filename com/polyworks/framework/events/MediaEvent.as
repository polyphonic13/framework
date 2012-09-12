package com.polyworks.framework.events
{
	import flash.events.Event;

	import com.polyworks.utils.logging.Logger; 
	
	/**
	 * MediaEvent
	 *
	 * @author Paul Hoover
	 * @extends flash.events.Event
	 * custome media events with optional data Object
	 * for event values
	 */
	public class MediaEvent extends Event
	{
		public static const MEDIA_START:String = "mediaStart"; 
		public static const MEDIA_STOP:String = "mediaStop"; 
		public static const MEDIA_COMPLETE:String = "mediaComplete"; 

		public static const ID3_DATA:String = "id3Data";
		public static const META_DATA:String = "metaData";
		public static const POSITION_UPDATE:String = "positionUpdate"; 
		public static const VOLUME_ADJUST:String = "volumeAdjust";
		public static const VOLUME_UPDATE:String = "volumeUpdate";
		public static const VARS_LOADED:String = "varsLoaded";
		public static const PAUSE_CONTENT:String = "pauseContent"; 
		public static const RESUME_CONTENT:String = "resumeContent"; 
		public static const FATAL_ERROR:String = "fatalError"; 
		public static const AD_STARTED:String = "adStarted";
		public static const AD_COMPLETE:String = "adComplete";

 		public var data:Object; 
		
		public function MediaEvent(mEvent:String, mData:Object=null, bubbles:Boolean=false, cancelable:Boolean=false):void
		{
			super(mEvent);
			this.data = mData;
		}

		public override function clone():Event
		{
			//Logger.output("MediaEvent/clone\n\ttoString = " + this.toString());
			return new MediaEvent(this.type, data); 
		}

		public override function toString():String
		{
			return formatToString("MediaEvent", "data", "bubbles", "cancelable", "eventPhase", "message");
		}
	}
}