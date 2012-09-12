package com.polyworks.utils
{
	import flash.display.Sprite; 
	
	public class MediaTimer extends Sprite
	{
		import flash.utils.Timer; 
		import flash.events.TimerEvent; 
		
		private var _timer:Timer; 
		private var _on:Boolean; 
		
		public function MediaTimer() {}

		public function init(delay:int = 500):void 
		{
			_timer = new Timer(delay); 
			_timer.addEventListener(TimerEvent.TIMER, timerHandler); 
			_on = false; 
		}
		
		public function get timerOn():Boolean { return _on; } 
		
		public function start():void 
		{
			_timer.start(); 
			_on = true;
		}
		
		public function stop():void 
		{
			_timer.stop(); 
			_on = false; 
		}
		
		public function timerHandler(evt:TimerEvent):void 
		{
			dispatchEvent(evt.clone()); 
		}
		
		
	}
}

