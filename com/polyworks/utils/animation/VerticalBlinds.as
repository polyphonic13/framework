package com.polyworks.utils.animation
{
	import flash.events.Event; 
	import flash.events.EventDispatcher; 
	import flash.display.Sprite; 

	import com.polyworks.utils.animation.MaskAnimate; 
	import com.polyworks.utils.animation.enum.MaskAnimateTypes;
	import com.polyworks.utils.drawing.SolidRectangle;

	public class VerticalBlinds
	{
		private var _dispatcher:EventDispatcher; 
		private var _container:Sprite; 
		private var _blinds:Array = new Array(); 
		
		private var _animations:Array = new Array(); 
		private var _animationCount:int = 0; 
		private var _animationTotal:int = 0;
		private var _animating:Boolean = false; 
		
		public function VerticalBlinds()
		{
			_dispatcher = new EventDispatcher();
			_container = new Sprite; 
		}
		
		public function addEventListener(evt:String, listener:Function):void
		{
			_dispatcher.addEventListener(evt, listener); 
		} 
		
		public function removeEventListener(evt:String, listener:Function):void 
		{
			_dispatcher.removeEventListener(evt, listener); 
		}
		
		public function get container():Sprite { return _container; }
		
		public function create(totalWidth:Number, 
								totalHeight:Number, 
								numberBlinds:int, 
								color:Number = 0x000000, 
								alpha:Number = 1):void 
		{
			var _blind:Sprite; 
			var blindWidth:Number = totalWidth/numberBlinds;
			
			for(var i:int = 0; i < numberBlinds; i++)
			{
				_blind = new Sprite(); 
				//SolidRectangle.make(_blind, blindWidth, totalHeight, 0, color, alpha);
				SolidRectangle.make(_blind, blindWidth, totalHeight, alpha, color);
				_blind.x = i * blindWidth;
				_blind.y = 0; 
				_container.addChild(_blind);
				_blinds.push(_blind);

			}
		}
		
		public function position(newX:Number, newY:Number):void 
		{
			_container.x = newX; 
			_container.y = newY; 
		}
		
		public function open(time:Number = 100, type:String = ""):void
		{
			if(type == "") 
			{
				type = MaskAnimateTypes.VERTICAL_CENTER; 
			}
			
			for(var j:int = 0; j < _blinds.length; j++)
			{

				var maskAnimate:MaskAnimate = new MaskAnimate(); 
				maskAnimate.execute(_blinds[j], 
										type, 
										_blinds[j].width, 
										_blinds[j].height, 
										_blinds[j].x, 
										_blinds[j].y, 
										time, 
										_blinds[j].x);
				maskAnimate.addEventListener(Event.COMPLETE, _onAnimationComplete);
				_animationTotal++;
				_animations.push(maskAnimate); 
			}
			_animating = true; 
		}
		
		public function pause():void 
		{
			for(var key:String in _animations)
			{
				_animations[key].stop(); 
			}
			_animating = false; 
		}
		
		public function resume():void 
		{
			for(var key:String in _animations)
			{
				_animations[key].resume(); 
			}
			_animating = true;
		}
		
		public function destroy():void
		{
			if(_animating) { this.pause(); }
			_container = null; 
			_blinds = null;
			_animations = null; 
		}
		
		private function _onAnimationComplete(evt:Event):void
		{
			_animationCount++; 

			if(_animationCount == _animationTotal)
			{
				for(var j:int = 0; j < _animations.length; j++)
				{
					_animations[j].removeEventListener(Event.COMPLETE, _onAnimationComplete);
				}
				_animating = false; 
				_dispatcher.dispatchEvent(evt.clone());
			}
		}
	}
}

