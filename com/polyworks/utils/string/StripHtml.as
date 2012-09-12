//
//  StripHtml
//
//  Created by polyphonic13 on 2010-01-20.
//  Copyright (c) 2010 factor13. All rights reserved.
//

package com.polyworks.utils.string
{
	import com.polyworks.utils.logging.Logger;

	public class StripHtml 
	{
	
		public static function strip(str:String, delim1:String, delim2:String):String
		{
			var idx1:Number = str.indexOf(delim2); 
			var idx2:Number = str.lastIndexOf(delim1); 
			var strippedStr:String;
			//Logger.output("StripHtml/strip\n\tstr = " + str + "\n\tdelim1 = " + delim1 + "\n\tdelim2 = " + delim2 + "\n\tidx1 = " + idx1 + "\n\tidx2 = " + idx2);

			if(idx1 > -1 && idx2 > -1) 
			{
				var interimStr = str.slice((idx1+delim2.length), idx2); 
				idx1 = interimStr.indexOf(delim1); 
				idx2 = interimStr.lastIndexOf(delim2); 
			
				//Logger.output("\tinterimStr = " + interimStr + "\n\tidx1 = " + idx1 + "\n\tidx2 = " + idx2); 

				if(idx1 > -1 && idx2 > -2)
				{
					strippedStr = interimStr.slice(0, idx1);
					strippedStr += " " + interimStr.slice(idx2+delim2.length); 
				}
				else
				{
					strippedStr = interimStr;
				}
			}
			else
			{
				strippedStr = str; 
			}
			Logger.output("StripHtml/strip\n\tstr = " + str + "\n\tstrippedStr = " + strippedStr);
		
			return strippedStr;
		}
	}
}