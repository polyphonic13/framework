//
//  IAppEventCenter
//
//  Created by Paul Hoover on 2011-10-28.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
package com.polyworks.framework.events
{
	import com.polyworks.framework.events.EventCenter; 
	
	public interface IAppEventCenter 
	{
		function get globalCenter():EventCenter;
		function set globalCenter(ec:EventCenter):void;
		
		function broadcast(evt:*):void;
/*		
		function addDoubleListener( type:String, func:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ):void;
		function removeDoubleListener( type:String, func:Function, useCapture:Boolean = false ):void;
*/		
	}
}