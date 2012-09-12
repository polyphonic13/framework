//
//  IView
//
//  Created by polyphonic13 on 2009-11-05.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.framework.view
{
	import flash.display.Sprite; 
	import flash.geom.Point; 
	import com.polyworks.framework.view.display.ISuperSprite;
	import flash.events.Event;
	
	public interface IView extends ISuperSprite
	{
		function get view():Sprite;
		function show():void;
		function hide():void;
		function setPosition(pt:Point):void;
		function get position():Point;
		function setSize(w:Number, h:Number):void;
		function get size():Point;
		function get viewName():String;
		function update( e:Event = null ):void;
	}
}