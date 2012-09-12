//
//  XmlUtils
//
//  Created by paul hoover on 2011-09-20.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
package com.polyworks.utils.xml
{
	import com.polyworks.utils.logging.Logger;

	public class XmlUtils 
	{
		public static function getChildrenBySiblingValue( top:XMLList, siblingName:String, siblingValue:String ):XML
		{   
			return _findSibling( top, siblingName, siblingValue ).parent();
		}
		
		public static function getElementBySiblingValue( top:XMLList, siblingName:String, siblingValue:String, elementName:String ):*
		{
			var xml:XML = _findSibling( top.children(), siblingName, siblingValue );
			return xml.parent()[elementName];
		}
		
		private static function _findSibling( top:XMLList, siblingName:String, siblingValue:String ):XML
		{
			var ret:XML;
			for( var i:int = 0; i < top.length(); i++ )
			{                             
				if( top[ i ].localName() == siblingName && top[ i ] == siblingValue )
				{               
					ret = top[ i ];
					break;
				}
			} 
			return ret;
		}
	}
}
