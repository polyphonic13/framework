//
//  GradientTriangle
//
//  Created by paul hoover on 2010-11-03.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//
package com.polyworks.utils.drawing
{	
	import flash.display.Sprite; 
	import flash.geom.Matrix;
	import com.polyworks.utils.drawing.enum.TriangleTypes; 
	
	public class GradientTriangle 
	{
		public static function make(tgt:Sprite, 
									sideLength:Number, 
									colors:Array, 
									alphas:Array, 
									ratios:Array, 
									matrix:Matrix,  
									type:String):void
		{
			with(tgt.graphics)
			{
				beginGradientFill("linear", colors, alphas, ratios, matrix);
		
				switch(type)
				{
			
					case TriangleTypes.BACK:
						moveTo(sideLength, 0);
						lineTo(sideLength, sideLength);
						lineTo(sideLength/2, sideLength/2);
						lineTo(sideLength/2, sideLength);
						lineTo(0, sideLength/2);
						lineTo(sideLength/2, 0);
						lineTo(sideLength/2, sideLength/2);
						lineTo(sideLength, 0);
						break;
			
					case TriangleTypes.NEXT:
						lineTo(sideLength/2, sideLength/2);
						lineTo(sideLength/2, 0);
						lineTo(sideLength, sideLength/2);
						lineTo(sideLength/2, sideLength);
						lineTo(sideLength/2, sideLength/2);
						lineTo(0, sideLength);
						lineTo(0, 0);
						break;

					case TriangleTypes.NORMAL:
						lineTo(sideLength / 2, sideLength /2);
						lineTo(0, sideLength);
						lineTo(0, 0);
						break;

					case TriangleTypes.DOWN_ARROW: 
						lineTo(sideLength, 0); 
						lineTo(sideLength/2, (sideLength/2)+(sideLength/4)); 
						lineTo(0, 0); 
						break; 

					case TriangleTypes.UP_ARROW:
						moveTo(0, sideLength); 
						lineTo(sideLength, sideLength); 
						lineTo(sideLength/2, (sideLength/2)-(sideLength/4)); 
						lineTo(0, sideLength); 
						break;
				}
				endFill();
			}
		}
	}
}