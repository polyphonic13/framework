//
//  IModel
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.framework.model
{
	import flash.events.Event; 
	
	public interface IModel 
	{
		function get name():String; 
		
		function get testing():Boolean;
		function set testing(t:Boolean):void;
		
		function get eventCenter():*; 
		function set eventCenter( ec:* ):void;
		
		function get player():*;
		function set player( p:Object ):void;
		
		function notifyOfEvent( evt:Event ):void;
		function addEventListener( evt:String, listener:Function ):void;
		function removeEventListener( evt:String, listener:Function ):void; 
	}
}