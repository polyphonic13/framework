//
//  DModel
//
//  Created by paul hoover on 2011-08-16.
//  Copyright (c) 2011 Selectable Media. All rights reserved.
//
package demo.model
{   
	import com.polyworks.framework.model.AppModel;
	
	public class DModel extends AppModel
	{     
		private static var _instance:DModel;
		
		private var _config; 
		private var _visibleView:String;
		
		public function DModel(modelName:String = "DemoModel")
		{
			super(modelName);
			_instance = this;
		}                    
		
		public static function getInstance():DModel
		{
			if(_instance == null)
			{
				_instance = new DModel(); 
			}
			return _instance; 
		}
		
		public static function killInstance():void 
		{
			_instance = null;
		}
		
		public function init(config:Object):void
		{
			_config = config;
		}                   
		
		public function get viewOneWidth():Number { return _config.v1.w; }
		public function get viewOneHeight():Number { return _config.v1.h; }
		public function get viewOneX():Number { return _config.v1.x; }
		public function get viewOneY():Number { return _config.v1.y; }
		public function get viewOneColor():Number { return _config.v1.color; }
		
		public function get viewTwoWidth():Number { return _config.v2.w; }
		public function get viewTwoHeight():Number { return _config.v2.h; }
		public function get viewTwoX():Number { return _config.v2.x; }
		public function get viewTwoY():Number { return _config.v2.y; }
		public function get viewTwoColor():Number { return _config.v2.color; }
		
		public function get viewThreeWidth():Number { return _config.v3.w; }
		public function get viewThreeHeight():Number { return _config.v3.h; }
		public function get viewThreeX():Number { return _config.v3.x; }
		public function get viewThreeY():Number { return _config.v3.y; }
		public function get viewThreeColor():Number { return _config.v3.color; }
		
		public function get visibleView():String { return _visibleView; }
		public function set visibleView(str:String):void { _visibleView = str; }
		
	}
}
