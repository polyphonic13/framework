//
//  XmlListConverter
//
//  Created by Sarah Newhall on 2010-07-08.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.xml
{	
	public class XmlListConverter 
	{
		public static function toArray(xml:XMLList):Array
		{
			var arr:Array = new Array(); 
			var item:XML;
			var idx:int = 0; 
			
			for each(item in xml)
			{
				arr[idx] = item; 
				idx++;
			} 
			return arr;
		}                                    
		
		public static function toObject(xml:XMLList):Object
		{
			var obj:Object = new Object(); 
			var item:XML; 
			
			for each(item in xml)
			{
				obj[item.localName()] = item; 
			}                                         
			return obj;
		}
	
		public static function addToObject(xml:XMLList, obj:Object):Object
		{
			var item:XML;
			for each(item in xml)
			{
				obj[item.localName()] = item;
			}
			return obj
		}
	}
}