//
//  MaskAnimate
//
//  Created by paul hoover on 2010-11-19.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//
package com.polyworks.utils.animation
{
	import flash.display.Sprite; 
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;

	import com.polyworks.utils.animation.enum.MaskAnimateTypes; 
	import com.polyworks.utils.logging.Logger;
	
	public class MaskAnimate extends EventDispatcher
	{
		private var _tween:String; 
		
		public function MaskAnimate(){}
		
		public function execute(tgt:Sprite, 
								type:String, 
								w:Number, 
								h:Number, 
								x:Number, 
								y:Number, 
								time:Number, 
								end:Number):void 
		{
			var halfW:Number = w/2;
			var halfH:Number = h/2; 
			switch(type)
			{
				case MaskAnimateTypes.VERTICAL_CENTER:
				
				break; 
				
				case MaskAnimateTypes.HORIZONTAL_CENTER: 
				
				break;
				
				case MaskAnimateTypes.CENTER:
				
				break;
				
				default:
				Logger.output("MaskAnimate/execute\n\tERROR: unknown type " + type);
				break;
			}
		}
		
		public function stop():void 
		{
			
		}
		
		public function resume():void 
		{
			
		}
		
	}
}