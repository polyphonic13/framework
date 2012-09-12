//
//  SolidRectangle
//
//  Created by polyphonic13 on 2010-01-19.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.drawing
{
	import flash.display.Sprite; 
	import flash.geom.Rectangle;
	
	public class SolidRectangle 
	{
		public function SolidRectangle(){}
		
		public static function make(tgt:Sprite, width:Number, height:Number, color:Number = 0x000000, alpha:Number = 1):void
		{
			with(tgt.graphics)
			{
				beginFill(color); 
				moveTo(0, 0); 
				lineTo(width, 0); 
				lineTo(width, height); 
				lineTo(0, height); 
				lineTo(0, 0);
				endFill();
			}
			tgt.alpha = alpha;
		}
		
		public static function draw( rect:Rectangle, theColor:Number = 0, theAlpha:Number = 1 ):Sprite {
			var rectangle:Sprite = new Sprite();
			
			rectangle.graphics.beginFill( theColor, 1 );
			rectangle.graphics.lineTo( rect.width, 0 );
			rectangle.graphics.lineTo( rect.width, rect.height );
			rectangle.graphics.lineTo( 0, rect.height );
			rectangle.graphics.lineTo( 0, 0 );
			rectangle.graphics.endFill();
		
			rectangle.x = rect.x;
			rectangle.y = rect.y;
			rectangle.alpha = theAlpha;
			
			return rectangle;
		};
		
		public static function drawWithBorder( 
			rect:Rectangle, 
			fillColor:Number = 0, 
			borderColor:Number = 0, 
			borderThickness:Number = 1, 
			theAlpha:Number = 1 
		):Sprite {
			var rectangle:Sprite = new Sprite();
			
			rectangle.graphics.lineStyle( borderThickness, borderColor, theAlpha );
			rectangle.graphics.beginFill( fillColor, theAlpha );
			rectangle.graphics.lineTo( rect.width, 0 );
			rectangle.graphics.lineTo( rect.width, rect.height );
			rectangle.graphics.lineTo( 0, rect.height );
			rectangle.graphics.lineTo( 0, 0 );
			rectangle.graphics.endFill();
		
			rectangle.x = rect.x;
			rectangle.y = rect.y;
		
			return rectangle;
		};
		
	}
}