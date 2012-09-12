package com.polyworks.utils.drawing
{
	import flash.display.Sprite;

	public class CloseButton 
	{
		public static function make(tgt:Sprite, radius:Number, lineWidth:Number, lineColor:Number, bgColor:Number):void
		{
			var _outterCircle:Sprite = new Sprite(); 
			var _innerCircle:Sprite = new Sprite(); 
			var _ex:Sprite = new Sprite(); 

			with(_outterCircle.graphics)
			{
				beginFill(lineColor); 
				drawCircle(0, 0, radius);
				endFill();
			}
			with(_innerCircle.graphics)
			{
				beginFill(bgColor); 
				drawCircle(0, 0, (radius - lineWidth));
				endFill(); 
			}
			
			var w:Number = (radius - (lineWidth*2));
			var startPos:Number = (-radius)/2 - (lineWidth/2);
			var point : Number = (radius - radius * .75) /2;
			with(_ex.graphics)
			{
				moveTo(point, point);
				lineStyle(lineWidth, lineColor);
				lineTo(radius -point, radius -point);
				moveTo(radius - point, point);
				lineTo(point, radius -point);
			}
			_ex.x = -radius/2;
			_ex.y = -radius/2;
			
			_outterCircle.buttonMode = true; 
			_innerCircle.buttonMode = true; 
			_ex.buttonMode = true; 
			
			tgt.addChild(_outterCircle);
			tgt.addChild(_innerCircle);
			tgt.addChild(_ex);
		}
	}
}