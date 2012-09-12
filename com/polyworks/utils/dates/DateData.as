//
//  DateData
//
//  Created by paul hoover on 2010-08-12.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//
package com.polyworks.utils.dates
{
	import com.polyworks.utils.logging.Logger;

	public class DateData 
	{
		public static const MONTHS_OF_YEAR:Array = new Array("Month", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
        public static const DAYS_OF_WEEK:Array = new Array("Day", "Sunday", "Monday", "Tuesday", "Wennesday", "Thursday", "Friday", "Saturday");
        public static const DAYS_OF_MONTH:Array = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		public static const HOURS_OF_DAY:Array = new Array("Hour", "12AM", "1AM", "2AM", "3AM", "4AM", "5AM", "6AM", "7AM", "8AM", "9AM", "10AM", "11AM", "12PM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM", "7PM", "8PM", "9PM", "10PM", "11PM");
		public function DateData(){}
		
		public static function get monthsOfYear():Array { return MONTHS_OF_YEAR; }
		public static function get daysOfWeek():Array { return DAYS_OF_WEEK; }
		public static function get daysOfMonth():Array { return DAYS_OF_MONTH; }
		public static function get hoursOfDay():Array { return HOURS_OF_DAY; }
		public static function getDayOfWeek(idx:int):String { return String(DAYS_OF_WEEK[idx]); }
		
		public static function get monthsDayNumbers():Array
		{
			var days:Array = new Array(); 
			days[0] = "Day";
			for(var i:int = 1; i < 32; i++)
			{
				days[i] = String(i);
			}
			return days;
		}
		
		public static function get ageYears():Array
		{
			var now:Number = new Date().fullYear;
			var years:Array = new Array(); 
			years[0] = "Year";
			for(var i:int = 1; i < 101; i++)
			{
				years[i] = (now - i);
			}
			return years;
		}
		
		public static function validateDayOfMonth(day:int, month:int, year:int = 0):Boolean
		{
			var valid:Boolean = true;
			
			if(year > 0 && isLeapYear(year) && month == 2)
			{
				if(day > 29)
				{
					valid = false;
				}
			}
			else if(day > DAYS_OF_MONTH[(month-1)])
			{
				valid = false;
			}
			else if(day < 1)
			{           
				Logger.output("birth day is 0 or less");
				valid = false;
			}
			return valid;
		}
		
		public static function isLeapYear(year:int):Boolean
		{
			var leap:Boolean = false;
			if(year % 4 == 0)
			{
				if(year % 100 == 0)
				{
					if(year % 400 == 0)
					{
						leap = true;
					}
				}
			}
			return leap;
		}
	}
}