//
//  GridLayout
//
//  Created by paul hoover on 2010-11-03.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//
package com.polyworks.utils.positioning
{
	import flash.display.Sprite; 
	
	import com.polyworks.utils.logging.Logger;

	public class GridLayout 
	{
		public static function positionItemsByColumns(items:Array, 
													tgt:Sprite, 
													cols:int, 
													h:Number, 
													w:Number, 
													hSpacer:Number = 0, 
													wSpacer = 0, 
													lGutter:Number = 0, 
													tGutter:Number = 0):void
		{
			//Logger.output("GridLayout/positionItemsByColumns\n\titems.length = " + items.length + ", cols = " + cols);
			var row:int = 0; 
			var col:int = 0; 
			for(var i:int = 0; i < items.length; i++)
			{
				items[i].x = lGutter + ((wSpacer + w) * col);
				col++;

				items[i].y = tGutter + (hSpacer * row) + (h * row); 
				tgt.addChild(items[i]);
				//Logger.output("\titem["+i+"].x = " + items[i].x + ", y = " + items[i].y + ", col = " + col + ", row = " + row);
				
				if((i+1) % cols == 0)
				{
					if(i > 0)
					{
						row++;
						col = 0;
					}
				}
			}
		}
	}
}