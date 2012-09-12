package com.polyworks.animation
{

	public class GridBlinds
	{
		import flash.events.Event; 
		import flash.events.EventDispatcher; 
		import flash.display.Sprite; 
		
		import com.polyworks.utils.animation.MaskAnimate; 
		import com.polyworks.utils.animation.enum.MaskAnimateType;
		import com.polyworks.utils.drawing.SolidRectangle; 
		
		private var _dispatcher:EventDispatcher; 
		private var _container:Sprite; 
		private var _blinds:Array = new Array(); 
		
		private var _animations:Array = new Array(); 
		private var _animationCount:int = 0; 
		private var _animationTotal:int = 0;
		private var _animating:Boolean = false; 
		
		public function GridBlinds()
		{
			_dispatcher = new EventDispatcher();
			_container = new Sprite; 
		}
		
		public function addEventListener(evt:String, listener:Function):void
		{
			_dispatcher.addEventListener(event, listener); 
		} 
		
		public function removeEventListener(evt:String, listener:Function):void 
		{
			_dispatcher.removeEventListener(event, listener); 
		}
		
		public function get container():Sprite { return _container; }
		
		public function create(totalWidth:Number, 
								totalHeight:Number, 
								numberRows:int,
								numberColumns:int, 
								color:Number = 0x000000, 
								alpha:Number = 1):void 
		{
			var _blind:Sprite; 
			var blindHeight:Number = totalHeight/numberColumns;
			var blindWidth:Number = totalWidth/numberColumns
			
			for(var i:int = 0; i < numberRows; i++)
			{
				for(var j:int = 0; j < numberColumns; j++)
				{
					_blind = new Sprite(); 
					SolidRectangle.make(_blind, blindWidth, blindHeight, 0, color, alpha);
					_blind.x = j * blindWidth;
					_blind.y = i * blindHeight; 
					_container.addChild(_blind);
					_blinds.push(_blind);
				}
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
				type = MaskAnimateTypes.CENTER; 
			}
			
			for(var i:int = 0; i < _blinds.length; i++)
			{

				var maskAnimate:MaskAnimate = new MaskAnimate(); 
				maskAnimate.execute(_blinds[i], 
										type, 
										_blinds[i].width, 
										_blinds[i].height, 
										_blinds[i].x, 
										_blinds[i].y, 
										time, 
										_blinds[i].x, 
										_blinds[i].y);
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
				for(var i:int = 0; i < _animations.length; i++)
				{
					_animations[i].removeEventListener(Event.COMPLETE, _onAnimationComplete);
				}
				_animating = false; 
				_dispatcher.dispatchEvent(evt.clone());
			}
		}
	}
}

