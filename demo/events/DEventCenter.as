//
//  DEventCenter
//
//  Created by paul hoover on 2011-08-16.
//  Copyright (c) 2011 Selectable Media. All rights reserved.
//
package demo.events
{
	import com.polyworks.framework.events.AppEventCenter;

	public class DEventCenter extends AppEventCenter
	{
		private static var _instance:DEventCenter;
		
		public function DEventCenter(){}
		
		public static function getInstance():DEventCenter
		{
			if(_instance == null) 
			{
				_instance = new DEventCenter(); 
			} 
			return _instance;
		}
		
		public static function killInstance():void 
		{
			_instance = null; 
		}
		
	}
}