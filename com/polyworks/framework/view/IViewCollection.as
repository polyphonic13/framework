//
//  IViewCollection
//
//  Created by polyphonic13 on 2009-11-05.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.framework.view
{
	import flash.display.Sprite; 

	public interface IViewCollection 
	{
		function init(pops:Sprite):void; 
		function addView(view:*, name:String, addToPops:Boolean = false):void; 
		function bringToTop(name:String):void; 
		function removeAll():void;
	}
}