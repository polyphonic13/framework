//
//  AppModel
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
// @implements com.polyworks.framework.model.IAppModel
//
//	base class used to store both application data
//	and root display object (for add children)
//	
// usage:
/*
	public class TestAppModel extends AppModel
	{

		private static var _instance:TestAppModel; 
	
		private var _obj:Object; 
		private var _message:String = ""; 
		private var _idx:int = 0; 
		private var _value:Number = 0; 
		private var _viewsCreated:int = 0;
		private var _totalViews:int = 2; 
	
		public function TestAppModel(modelName:String = "TestAppModel")
		{
			super(modelName); 
			_instance = this;
		}
	
		public static function getInstance():TestAppModel
		{
			if(_instance == null)
			{
				_instance = new TestAppModel();
			}
			return _instance; 
		}
	
		public static function killInstance():void 
		{
			_instance = null; 
		}
	
		public function init(obj:Object):void
		{
			_obj = obj;
		}
	
		public function get obj():Object { return _obj; }
	
		public function get message():String { return _message; } 
		public function set message(str:String):void { _message = str; }
	
		public function get idx():int { return _idx; } 
		public function set idx(num:int):void { _idx = num; } 
	
		public function get value():Number { return _value; } 
		public function set value(num:Number):void { _value = num; }
	
		public function get viewsCreated():int { return _viewsCreated; } 
		public function set viewsCreated(num:int):void { _viewsCreated = num; } 
	
		public function get totalViews():int { return _totalViews; }
	
	}
*/
package com.polyworks.framework.model
{
	import flash.display.Sprite;
	
	import com.polyworks.framework.model.Model; 
	import com.polyworks.utils.logging.Logger;
	
	public class AppModel extends Model implements IAppModel
	{
		private var _displayParent:Sprite;
		
		/**
		* @param modelName:String - unique identifier
		* constructor
		*/
		public function AppModel(modelName:String):void 
		{
			super(modelName);
		}

		/**
		* @return _displayParent:Sprite - application's top level
		* display object
		*/
		public function get displayParent():Sprite { return _displayParent; }

		/**
		* @param spr:Sprite - sets _displayParent with application's
		* top level display object
		*/ 
		public function set displayParent(spr:Sprite):void { _displayParent = spr; }
		
		public function removeChildren():void 
		{
			//Logger.output("AppModel/removeChildren");
			var obj:Sprite;
			for(var i:int = 0; i < displayParent.numChildren; i++)
			{
				obj = Sprite(displayParent.removeChildAt(i));
			}
		}

		/**
		* @param str:String - message to trace sent to Logger.outputAndDump / output
		* @param obj:Object - if not null sent to Logger.outputAndDump
		*/ 
		public static function log( str:String = "", obj:Object = null ):void 
		{ 
			if( obj != null )
			{
				Logger.outputAndDump( str, obj );
			}
			else
			{
				Logger.output( str );
			}
		}
		
	}
}