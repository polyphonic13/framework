//
//  Pinger
//
//  Created by polyphonic13 on 2009-11-18.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.utils
{
	import flash.events.*;
	import flash.net.URLRequest; 
	import flash.net.URLLoader;
	import flash.net.URLVariables;
	
	import com.polyworks.utils.logging.Logger;

	public class Pinger 
	{
		//private var _loader:URLLoader; 

		/**
		 * @param url:String - url to attempt to 
		 * load with URLLoader / URLRequest
		 */
		public static function ping(url:String, usePost:Boolean = false):void 
		{
			Logger.output("Pinger/ping, url = " + url + "\n\tnow = " + (new Date().getTime()));
			var request = new URLRequest(url); 
			//_loader = URLLoader(); 
			var _loader = new URLLoader();
			//addListeners(_loader);
            _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            _loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			try
			{
				_loader.load(request); 
			}
			catch(error:Error) 
			{
				Logger.output("\tERROR: Pinger/ping, url = " + url + "\n\tmessage = "+ error.message); 
			}
		}

 		private static function addListeners(l:IEventDispatcher):void
		{
			l.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler); 
			l.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}
			
		private static function securityErrorHandler(event:SecurityErrorEvent):void 
		{
            Logger.output("securityErrorHandler: " + event);
        }
        
		private static function ioErrorHandler(event:IOErrorEvent):void 
		{
            Logger.output("ioErrorHandler: " + event);
        }

		private static function httpStatusHandler(event:HTTPStatusEvent):void 
		{
			Logger.output("httpStatusHander: " + event); 
		}
	}
}