//
//  ScreenPlayButton
//
//  Created by polyphonic13 on 2010-01-09.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.drawing
{
	import flash.display.Sprite; 
    import flash.filters.BitmapFilter;
    import flash.filters.BitmapFilterQuality;
    import flash.filters.GlowFilter;
	
	//import com.polyworks.utils.drawing.SolidRectangle; 
	
	public class ScreenPlayButton 
	{
		public function ScreenPlayButton(){}
		
		public static function make(width:Number, height:Number, addBg:Boolean = true, btnColor:Number = 0xFFFFFF):Sprite
		{
			var playButton:Sprite = new Sprite();
			var graphicBg:Sprite = new Sprite();
			var btnGraphic:Sprite = new Sprite();

			if(addBg)
			{
				var bg:Sprite = new Sprite();
				with(bg.graphics)
				{
					beginFill(0x000000); 
					lineTo(width, 0); 
					lineTo(width, height); 
					lineTo(0, height); 
					lineTo(0, 0);
					endFill(); 
				}
				bg.alpha = 0.30; 
				playButton.addChild(bg);
			}
			
			with(graphicBg.graphics)
			{
				beginFill(0x000000);
				moveTo(width/4, height/4); 
				lineTo((width/4)*3, height/4);
				lineTo((width/4)*3, (height/4)*3); 
				lineTo(width/4, (height/4)*3);
				lineTo(width/4, height/4); 
				endFill(); 
			} 
			var black:Number = 0x000000;
            var alpha:Number = 0.75;
            var blurX:Number = 50;
            var blurY:Number = 50;
            var strength:Number = 1;
            //var inner:Boolean = true;
			var inner:Boolean = false;
            var knockout:Boolean = false;
            var quality:Number = BitmapFilterQuality.HIGH;
            var blackFilter:GlowFilter = new GlowFilter(black,
                                  alpha,
                                  blurX,
                                  blurY,
                                  strength,
                                  quality,
                                  inner,
                                  knockout);

			var blackFilterArray:Array = new Array(); 
			blackFilterArray.push(blackFilter); 
			
			var white:Number = 0xFFFFFF;
            var whiteFilter:GlowFilter = new GlowFilter(white,
                                  alpha,
                                  blurX,
                                  blurY,
                                  strength,
                                  quality,
                                  inner,
                                  knockout);
			var whiteFilterArray:Array = new Array();
			whiteFilterArray.push(whiteFilter); 

			//graphicBg.filters = whiteFilterArray; 
			graphicBg.alpha = 0.60;
			 
			with(btnGraphic.graphics)
			{
				lineStyle(2, 0x333333, 0.30);
				beginFill(btnColor);
				moveTo(width/3, height/3);
				lineTo((width/3)*2, height/2);
				lineTo(width/3, (height/3)*2)
				lineTo(width/3, height/3);
				endFill();
			}

			btnGraphic.filters = whiteFilterArray; 
           	//btnGraphic.alpha = 0.80; 
			
			playButton.addChild(graphicBg);
			playButton.addChild(btnGraphic);
			playButton.buttonMode = true;
			return playButton; 
		}
		
	}
}