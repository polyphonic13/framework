//
//  TimeFormatter
//
//  Created by polyphonic13 on 2009-11-13.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.utils
{
	public class TimeFormatter 
	{
		
		public function TimeFormatter() {}
		
		public static function stringHHMMSStoMins(str:String, delim:String = ":"):Number
		{
			var buckets:Array = str.split(delim); 
			var retNum:Number; 
			
			retNum = (buckets[0] * 60 * 60) + (buckets[1] * 60) + buckets[2];
			
			return retNum;
		}
		
		public static function numbersToHHMMSS(hr:Number, min:Number, sec:Number, delim:String = ":"):String 
		{
			var hour:String = _convertToString(hr);
			var minute:String = _convertToString(min);
			var second:String = _convertToString(sec);
			var dateStr:String = hour + delim + minute + delim + second; 
			
			return dateStr;
		}
		
		public static function secondsToDDHHMMSS(secs:Number, delim:String = ":"):String
		{
			var mins:Number = Math.floor(secs/60);
			var hrs:Number = 0;
			var days:Number = 0;
			var secs = secs % 60;
			
			if(mins > 60)
			{
				hrs = Math.floor(mins/60);
				mins = mins % 60;
			}
			
			if(hrs > 24)
			{
				days = Math.floor(hrs/24);
				hrs = hrs & 24;
			}
			
			var retString:String = _convertToString(days) + ":" + numbersToHHMMSS(hrs, mins, secs);
			return retString; 
			
		}
		
		private static function _convertToString(num:Number):String 
		{
			if(num < 10)
			{
				return "0" + String(num);
			}
			else
			{
				return String(num);
			}
		}
	}
}