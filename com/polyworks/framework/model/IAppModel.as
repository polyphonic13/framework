//
//  IAppModel
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.framework.model
{
	import flash.display.Sprite; 
	
	public interface IAppModel 
	{
		function get displayParent():Sprite; 
		function set displayParent(spr:Sprite):void; 
		function removeChildren():void
		
	}
}