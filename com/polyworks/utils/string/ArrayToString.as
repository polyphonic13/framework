package com.polyworks.utils.string
{

	public class ArrayToString
	{
	
		public function ArrayToString() {}

		public static function convert(arr:Array):String
		{
			var retString:String = new String(); 
			
			for(var i:int = 0; i < arr.length; i++)
			{
				retString += String(arr[i]); 
				if(i < (arr.length - 1))
				{
					retString += ","; 
				}
			}
			return retString;			
		}
	}
}

