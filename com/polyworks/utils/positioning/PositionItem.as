//
//  PositionItem
//
//  Created by polyphonic13 on 2010-01-28.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.positioning
{
	import flash.display.DisplayObject; 
	import flash.geom.Point;
	
	public class PositionItem 
	{
		public function PositionItem(){}
		
		public static function centerX(obj1:DisplayObject, obj2:DisplayObject):Number
		{
			var num:Number = obj1.x + (obj1.width/2 - obj2.width/2);
			return num; 
		} 
		
		public static function centerY(obj1:DisplayObject, obj2:DisplayObject):Number
		{
			var num:Number = obj1.y + (obj1.height/2 - obj2.height/2);
			return num; 
		}
		
		public static function centerXY(obj1:DisplayObject, obj2:DisplayObject):Point
		{
			var pt:Point = new Point(); 
			pt.x = centerX(obj1, obj2); 
			pt.y = centerY(obj1, obj2); 
			return pt; 
		}
	}
}