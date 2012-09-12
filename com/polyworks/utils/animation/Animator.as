//
//  Animator
//
//  Created by paul hoover on 2010-11-03.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//
package com.polyworks.utils.animation
{
	import flash.events.*; 
	import flash.display.Sprite; 
	import fl.transitions.Tween; 
	import fl.transitions.TweenEvent; 
	import fl.transitions.easing.*; 
	
	public class Animator extends EventDispatcher
	{
		var _tween:Tween; 
		var _started:Boolean; 
		var _tweening:Boolean; 
		
		public function Animator()
		{
			_started = false; 
			_tweening = false;
		}
		
		public function execute(tgt:Sprite, prop:String, begin:Number, finish:Number, duration:Number, ease:Function = null, useSeconds:Boolean = true):void 
		{
//			_tween = new Tween(vciaModel.displayParent, "alpha", Regular.easeIn, 0, 1, vciaModel.animationSeconds, true);
			var easing:Function = Regular.easeIn; 
			if(ease != null)
			{
				easing = ease;
			}
			_tween = new Tween(tgt, prop, easing, begin, finish, duration, useSeconds); 
			_tween.addEventListener(TweenEvent.MOTION_FINISH, _tweenComplete); 
			_started = true; 
			_tweening = true; 
		}
		
		public function pause():void 
		{
			if(_tweening)
			{
				_tween.stop(); 
				_tweening = false; 
			}
		}
		
		public function resume():void
		{
			if(!_tweening && _started)
			{
				_tween.resume(); 
				_tweening = true;
			}
		}
		
		public function end():void 
		{
			if(_tweening)
			{
				_tween.fforward();
				_houseKeeping(); 
			}
		}
		
		private function _tweenComplete(evt:TweenEvent):void 
		{
			dispatchEvent(new Event(Event.COMPLETE)); 
			_houseKeeping();
		}
		
		private function _houseKeeping():void 
		{
			_tween.removeEventListener(TweenEvent.MOTION_FINISH, _tweenComplete); 
			_started = false; 
			_tweening = false; 
		}
	}
}