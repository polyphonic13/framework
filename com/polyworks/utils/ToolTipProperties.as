package com.polyworks.utils
{
	public class ToolTipProperties
	{
		public var text:String = "";
		public var addBg:Boolean = true;
		public var addShadow:Boolean = true;
		public var bgColor:Number = 0xFFFFFF; 
		public var borderColor:Number = 0x000000;
		public var fontFamily:String = "Arial"; 
		public var fontColor:Number = 0x000000;
		public var fontSize:Number = 10;
		public var bold:Boolean = true; 
		
		public var dsdistance:Number = 3;
		public var dsangle:Number = 45;
		public var dscolor:Number = 0x000000;
		public var dsblurX:Number = 3;
		public var dsblurY:Number = 3;
		public var dsalpha:Number = 0.3;
		
		public var xOffset:Number = 10; 
		public var yOffset:Number = -20;
		
		public var stageWidth:Number = 500;
		
		public function ToolTipProperties():void {}
	}
}