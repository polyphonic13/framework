//
//  Logger
//
//  Created by Paul Hoover on 2011-10-06.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
package com.polyworks.utils.logging
{
	
	public class Logger 
	{
		private static var _level:int = 0; 

		public function Logger() {}
		
		public static function set level(lvl:int):void { _level = lvl; }

		public static function log( str:String, data:Object = null, varName:String = "obj", indent:int = 2 ):void
		{
			output( str, data, varName, indent );
		}

		public static function output( str:String, data:Object = null, varName:String = "obj", indent:int = 2 ):void
		{
			if( _level > 0 )
			{
				trace( str );

				if( data != null )
				{
					ObjectTracer.dump( data, varName, indent );
				}
			}
		}
		
		public static function dump( obj:Object, varName:String = "obj", indent:int = 2 ):void
		{
			if( _level > 0 )
			{
				ObjectTracer.dump( obj, varName, indent );
			}
		}
		
		public static function outputAndDump( str:String, obj:Object, varName:String = "obj", indent:int = 2 ):void
		{
			output( str );
			dump( obj, varName, indent );
		}
	}
}