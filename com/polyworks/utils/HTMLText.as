package com.polyworks.utils
{
	import flash.display.Sprite;
	
	public class HTMLText extends Sprite
	{
		import flash.text.*;

		private var _textfield:TextField; 
		
		public function HTMLText(style:StyleSheet, width:Number = 200, height:Number = 20, selectable:Boolean = false, multiLine:Boolean = false)
		{
			_textfield = new TextField();
			_textfield.styleSheet = style;
			_textfield.htmlText = "";
			_textfield.selectable = selectable; 
			_textfield.multiline = multiLine;
			_textfield.width = width;
			_textfield.height = height;
			
			addChild(_textfield);
		}
	
		public function setText(str:String):void
		{
			_textfield.htmlText = str;
		}
		
		public function get htmlText():String { return _textfield.htmlText; }
	}

}

