//
//  VideoClient
//
//  Created by Sarah Newhall on 2010-07-08.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.media
{	
	import flash.display.Sprite; 
	import flash.events.Event;
	
	import com.polyworks.framework.events.MediaEvent;
	import com.polyworks.utils.logging.Logger; 
	
	public class VideoClient extends Sprite
	{
		private var _duration:Number; 
		
		public function VideoClient()
		{
			_duration = 0;
		}

		public function get duration():Number
		{
			return _duration; 
		}
		
	    public function onMetaData(info:Object):void 
		{
	        //Logger.output("metadata: duration=" + info.duration + " width=" + info.width + " height=" + info.height + " framerate=" + info.framerate);
			Logger.dump(info, "META");
			_duration = info.duration
			dispatchEvent(new Event(MediaEvent.META_DATA));
	    }
	
	    public function onCuePoint(info:Object):void 
		{
	        Logger.output("cuepoint: time=" + info.time + " name=" + info.name + " type=" + info.type);
	    }

	}
}