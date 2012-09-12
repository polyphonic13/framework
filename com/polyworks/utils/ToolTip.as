package com.polyworks.utils
{
	import flash.display.Sprite
    import flash.text.*;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	
	import com.polyworks.utils.ToolTipProperties;
	import com.polyworks.utils.logging.Logger;
	
	public class ToolTip extends Sprite
	{
		private static var _instance:ToolTip; 
		
		private var _ttp:ToolTipProperties;
		private var _ttText:TextField;
		private var _ttBg:Shape;
		private var _shadow:DropShadowFilter;
		
		public function ToolTip() {} 
		
		public static function getInstance():ToolTip
		{
			if(_instance == null) 
			{
				_instance = new ToolTip(); 
			} 
			return _instance; 
		} 
		
		public static function killInstance():void 
		{
			_instance = null; 
		} 
		
		public function init(ttp:ToolTipProperties)
		{
			this.visible = false;
			_ttp = ttp; 
			
			_makeText(); 
			
			if(_ttp.addBg)
			{
				_makeBg(); 
			}

			if(_ttp.addShadow)
			{
				_makeShadow(); 
				if(_ttp.addBg) 
				{
					_ttBg.filters = [_shadow]; 
				} 
				else
				{
					_ttText.filters = [_shadow]; 
				}
			}
			addChild(_ttText);
		}
		
		public function showTip():void 
		{
			this.visible = true; 
			stage.addEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove); 
		}
		
		public function hideTip():void 
		{
			this.visible = false; 
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove); 
		}
		
		public function setText(str:String):void 
		{ 
			_ttText.text = str; 			
			if(_ttp.addBg) 
			{
				_drawBg();
			} 
		} 
/*
		pubilc function setProperties(ttp:ToolTipProperties):void 
		{
			_ttp = ttp; 
		} 
*/		
		private function _makeShadow():void
		{
			_shadow = new DropShadowFilter();
			_shadow.distance = _ttp.dsdistance;
			_shadow.angle = _ttp.dsangle;
			_shadow.color = _ttp.dscolor;
			_shadow.blurX = _ttp.dsblurX;
			_shadow.blurY = _ttp.dsblurY;
			_shadow.alpha = _ttp.dsalpha;
		}
		
		private function _makeText():void 
		{
            var format:TextFormat = new TextFormat();
            format.font = _ttp.fontFamily;
            format.color = _ttp.fontColor;
            format.size = _ttp.fontSize;
			format.bold = _ttp.bold;
			
			_ttText = new TextField();
			_ttText.autoSize = TextFieldAutoSize.LEFT;
			_ttText.defaultTextFormat = format;
			_ttText.selectable = false;
			
			_ttText.x = 0;
			_ttText.y = 0;			
			_ttText.text = _ttp.text;
		} 

		private function _makeBg():void
		{
			_ttBg = new Shape();
			_drawBg(); 
			addChild(_ttBg);
		}
		
		private function _drawBg():void 
		{
			var metrics:TextLineMetrics = _ttText.getLineMetrics(0); 
			var bgWidth:Number = metrics.width + 5; 
			var bgHeight:Number = metrics.height + 5;
			_ttBg.graphics.clear(); 
			with(_ttBg.graphics) 
			{
				beginFill(_ttp.bgColor);
				lineStyle(0.5, _ttp.borderColor);
				drawRect(0, 0, bgWidth, bgHeight);
				endFill();
			}
			_ttBg.x = -1;
			_ttBg.y = -1;
		}

		private function _onMouseMove(evt:MouseEvent):void
		{
			this.x = stage.mouseX + _ttp.xOffset; 
			this.y = stage.mouseY + _ttp.yOffset; 
			if((this.x + this.width) > _ttp.stageWidth)
			{
				this.x = stage.mouseX - (this.width + _ttp.xOffset); 
			}
			//Logger.output("ToolTip/_onMouseMove\n\tx = " + this.x + ", y = " + this.y + "\n\tstage.width = " + parent.stage.width); 
		}
	}
}