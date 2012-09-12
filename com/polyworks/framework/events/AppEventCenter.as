//
//  AppEventCenter
//
//  Created by Paul Hoover on 2011-10-28.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
package com.polyworks.framework.events
{
	import com.polyworks.framework.events.EventCenter; 
	import com.polyworks.framework.events.MediaEvent; 
	
	public class AppEventCenter extends EventCenter implements IAppEventCenter
	{
		private static var _instance:AppEventCenter; 
		
		private var _globalCenter:EventCenter; 
		
		public function AppEventCenter() {}
		
		public static function getInstance():AppEventCenter
		{
			if(_instance == null) 
			{
				_instance = new AppEventCenter(); 
			} 
			return _instance; 
		}
		
		public static function killInstance():void 
		{
			_instance = null;
		} 
		public function get globalCenter():EventCenter { return _globalCenter; }
		public function set globalCenter( ec:EventCenter ):void { _globalCenter = ec; }
		
		public function broadcast( evt:* ):void
		{
			super.dispatchEvent( evt );
			if( _globalCenter )
			{
				_globalCenter.dispatchEvent( evt );
			}
		}

		public function addDoubleListener( type:String, func:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ):void
		{
			addEventListener( type, func, useCapture, priority, useWeakReference );
			if( _globalCenter )
			{
				_globalCenter.addEventListener( type, func, useCapture, priority, useWeakReference );
			}
		}
		
		public function removeDoubleListener( type:String, func:Function, useCapture:Boolean = false ):void
		{
			removeEventListener( type, func, useCapture );
			if( _globalCenter )
			{
				_globalCenter.removeEventListener( type, func, useCapture );
			}
		}
	}
}