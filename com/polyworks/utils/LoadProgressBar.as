package com.polyworks.utils
{
	import flash.display.Sprite;
	
	public class LoadProgressBar extends Sprite
	{
		import flash.display.Shape;
	
		private var _emptyBar:Shape = new Shape();
		private var _loadedBar:Shape = new Shape();
		private var _loadedMask:Shape = new Shape();

		private var _loaded:Number = 0;
		
		public function LoadProgressBar(width:Number = 100, height:Number = 2, emptyColor:Number = 0xFFFFFF, loadedColor:Number = 0x666666)
		{
			_emptyBar = _makeShape(emptyColor, width, height);
			_loadedBar = _makeShape(loadedColor, width, height);
			_loadedMask = _makeShape(emptyColor, width, height);
			
			_loadedMask.x = -(_loadedBar.width);
			_loadedBar.mask = _loadedMask;
			
			addChild(_emptyBar);
			addChild(_loadedBar);
			addChild(_loadedMask);
			
		}
		
		public function updateLoaded(amount:Number, end:Number):void
		{
			_loaded = newX(amount, end);
			_loadedMask.x = (_loaded-(_loadedMask.width));			
			
		}
		
		public function reset():void
		{
			_loaded = 0;
			_loadedMask.x = -_loadedBar.width;
		}
		
		public function getLoaded():Number
		{
			return _loaded;
		}
		
		private function _makeShape(color:Number, width, height):Shape
		{
			var square:Shape = new Shape();
			
			square.graphics.lineStyle(1, color);
			square.graphics.beginFill(color);
			square.graphics.drawRect(0, 0, width, height);
			square.graphics.endFill();
			
			return square;
		}

		private function newX(amount:Number, end:Number):Number
		{
			var	val:Number = new Number();
			val = Math.floor((amount * _emptyBar.width)/end);
			
			return val;
		}			
	}
}
