//
//  ObjectTracer
//
//  Created by polyphonic13 on 2010-01-06.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.logging
{
	public class ObjectTracer
	{
		public function ObjectTracer(){}
		
		public static function dump(obj:Object, varName:String = "obj", indent:int = 2):void
		{   
			var tabs:String = "";
			                                                                          
			for(var i:int = 0; i < indent; i++)
			{
				tabs += "\t";
			}
			for(var key:String in obj)
			{
				trace(tabs+varName+"['"+key+"'] = " + obj[key]);
			}
		}
	}
}