//
//  MediaButton
//
//  Created by polyphonic13 on 2010-01-27.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.drawing
{
	import flash.display.Sprite; 
	import flash.geom.Matrix; 
	
	public class MediaButton 
	{
		public static const PLAY_BUTTON:String = "playButton"; 
		public static const PAUSE_BUTTON:String = "pauseButton"; 
		public static const BACK_BUTTON:String = "backButton"; 
		public static const NEXT_BUTTON:String = "nextButton"; 
		public static const MUTE_BUTTON:String = "muteButton"; 
		public static const UNMUTE_BUTTON:String = "unmuteButton"; 
		
		public function MediaButton(){}
		
		public static function make(sideLength:Number, 
									colors:Array, 
									alphas:Array, 
									ratios:Array, 
									matrix:Matrix,  
									type:String,
									gradient:Boolean = false,
									pauseWidth:Number = 5,
									pauseGap:Number = 2,
									muteSlash:Boolean = true):Sprite {

			var tgt:Sprite = new Sprite(); 
			with(tgt.graphics)
			{
				lineStyle(1, 0x000000, 0.32);

				if(gradient)
				{
					beginGradientFill ("linear", colors, alphas, ratios, matrix);
				}
				else
				{
					beginFill(colors[0], alphas[0]); 
				}

				switch(type)
				{
					case PLAY_BUTTON:
						lineTo(sideLength, sideLength/2);
						lineTo(0, sideLength); 
						lineTo(0, 0);
					break;

					case PAUSE_BUTTON: 
						lineTo(pauseWidth, 0);
						lineTo(pauseWidth, sideLength);
						lineTo(0, sideLength);
						lineTo(0, 0);

						moveTo(pauseGap+pauseWidth, 0);
						lineTo(pauseGap+pauseWidth*2, 0);
						lineTo(pauseGap+pauseWidth*2, sideLength);
						lineTo(pauseGap+pauseWidth, sideLength);
						lineTo(pauseGap+pauseWidth, 0);
					break; 

					case BACK_BUTTON:
						moveTo(((sideLength/2)+(sideLength/4)), 0);
						lineTo(((sideLength/2)+(sideLength/4)), sideLength);
						lineTo(sideLength/4, sideLength/2);
						lineTo(sideLength/4, sideLength);
						lineTo(0, sideLength); 
						lineTo(0, 0); 
						lineTo(sideLength/4, 0); 
						lineTo(sideLength/4, sideLength/2); 
						lineTo(((sideLength/2)+(sideLength/4)), 0); 
					break;

					case NEXT_BUTTON:
						lineTo(0, sideLength); 
						lineTo(sideLength/2, sideLength/2);
						lineTo(sideLength/2, sideLength); 
						lineTo(((sideLength/2)+(sideLength/4)), sideLength); 
						lineTo(((sideLength/2)+(sideLength/4)), 0);
						lineTo(sideLength/2, 0); 
						lineTo(sideLength/2, sideLength/2); 
						lineTo(0, 0); 
					break;

					case MUTE_BUTTON: 
						moveTo(0, sideLength/4);
						lineTo(0, (sideLength/2)+(sideLength/4)); 
						lineTo(sideLength/4, (sideLength/2)+(sideLength/4)); 
						lineTo((sideLength/2)+(sideLength/4), sideLength); 
						lineTo((sideLength/2)+(sideLength/4), 0); 
						lineTo(sideLength/4, sideLength/4); 
						lineTo(0, sideLength/4);  
					break;

					case UNMUTE_BUTTON:
						moveTo(0, sideLength/4);
						lineTo(0, (sideLength/2)+(sideLength/4)); 
						lineTo(sideLength/4, (sideLength/2)+(sideLength/4)); 
						lineTo((sideLength/2)+(sideLength/4), sideLength); 
						lineTo((sideLength/2)+(sideLength/4), 0); 
						lineTo(sideLength/4, sideLength/4); 
						lineTo(0, sideLength/4);  
						endFill();

	 					var fifth:Number = sideLength/8;

						if(gradient)
						{
							beginGradientFill ("linear", colors, alphas, ratios, matrix);
						}
						else
						{
							beginFill(colors[0], alphas[0]); 
						}

						if(muteSlash)
						{
							// slash:
							moveTo(sideLength - fifth, 0);
							lineTo(sideLength, 0);
							lineTo(sideLength, fifth);
							lineTo(fifth, sideLength);
							lineTo(0, sideLength);
							lineTo(0, sideLength-fifth);
							lineTo(sideLength - fifth, 0);
						}
						else
						{
							// X:
							moveTo(0, 0); 
							lineTo(fifth, 0);
							lineTo(sideLength/2, sideLength/2 - fifth); 
							lineTo(sideLength - fifth, 0); 
							lineTo(sideLength, 0); 
							lineTo(sideLength, fifth);
							lineTo(sideLength/2 + fifth, sideLength/2); 
							lineTo(sideLength, sideLength - fifth); 
							lineTo(sideLength, sideLength); 
							lineTo(sideLength - fifth, sideLength); 
							lineTo(sideLength/2, sideLength/2 + fifth);
							lineTo(fifth, sideLength); 
							lineTo(0, sideLength); 
							lineTo(0, sideLength - fifth); 
							lineTo(sideLength/2 - fifth, sideLength/2);
							lineTo(0, fifth); 
							lineTo(0, 0);
						}

					break;
				}
				endFill();
			}
			return tgt;
		}
	}
}