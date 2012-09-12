//
//  StringToArray
//
//  Created by polyphonic13 on 2010-01-12.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.string
{
	public class StringToArray 
	{
		public static function parse(str:String, delimiter:String):Array
		{
			var arr:Array = new Array; 
			arr = str.split(delimiter);
			return arr; 
		}
	}
}