//
//  GradientRectangle
//
//  Created by polyphonic13 on 2010-01-27.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.drawing
{
	import flash.display.Sprite; 
	import flash.display.Shape; 
	import flash.display.GradientType; 
	import flash.geom.Matrix;
	
	public class GradientRectangle 
	{
		public function GradientRectangle(){}
		
		public static function make(tgt:Sprite,
									width:Number, 
									height:Number, 
									colors:Array, 
									alphas:Array, 
									ratios:Array,
									matrix:Matrix = null,
									lineWidth:Number = 0,
									lineColor:Number = 0x000000,
									lineAlpha:Number = 1):void
		{
			var type:String = GradientType.LINEAR; 

			var mtx:Matrix = new Matrix(); 
			
			if(matrix == null)
			{
				var boxWidth:Number = width; 
				var boxHeight:Number = height; 
				var boxRotation:Number = Math.PI/2; // 90° 
				var tx:Number = 0; 
				var ty:Number = 0; 
				mtx.createGradientBox(boxWidth, boxHeight, boxRotation, tx, ty); 
			}
			else
			{
				mtx = matrix;
			}
			var square:Shape = new Shape; 
			square.graphics.beginGradientFill(type,  
			                            colors, 
			                            alphas, 
			                            ratios,  
			                            matrix);
			
			square.graphics.drawRect(0, 0, width, height); 
			tgt.addChild(square);
			if(lineWidth > 0)
			{
				with(tgt.graphics)
				{
					lineStyle(lineWidth, lineColor, lineAlpha);
					lineTo(width, 0);
					lineTo(width, height);
					lineTo(0, height); 
					lineTo(0, 0);
				}
			}

		}
	}
}