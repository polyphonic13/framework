//
//  StringUtils
//
//  Created by paul hoover on 2010-07-28.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.string
{                                            
	public class StringUtils 
	{                                        
		public static const NON_ALPHA_NUMERIC_PATTERN:RegExp = /[^a-z0-9A-Z_]/g;    
		public static const TIMESTAMP:RegExp = /\[timestamp\]/i;
		public static const RANDOM:RegExp = /\[random\]/i;                   
		
		public function StringUtils(){}
		
		public static function reverse(str:String):String
		{
			var arr1:Array = str.split("");
			var str2:String = new String(""); 

			for(var i:int = arr1.length; i > 0; i--) 
			{
				str2 += arr1.pop();
			}

			return str2;
		}    
		
		public static function removeNonAlphaNumberic(str:String):String
		{
			return (str.replace(NON_ALPHA_NUMERIC_PATTERN, ""));
		}         
		
		public static function timestamper(s1:String):String
		{                                     
			var timestamp:String = String(new Date().getTime());
			var s2 = s1.replace(TIMESTAMP, timestamp);
			var s3 = s2.replace(RANDOM, timestamp);
			return s3;
		}
		
		public static function replaceTimestamp(str:String, searchStr:String, ignoreCase:Boolean = false):String
		{
			if(ignoreCase) 
			{ 
				str = str.toLowerCase(); 
				searchStr = searchStr.toLowerCase(); 
			}
			
			var retStr:String;
			var idx:int = str.indexOf(searchStr); 
			if(idx > -1) 
			{
				retStr = str.split(searchStr).join(String(new Date().getTime()));
			}
			else
			{
				retStr = str; 
			} 
			return retStr;
		}
	}
}