//
//  ViewList
//
//  Created by paul hoover on 2011-08-16.
//  Copyright (c) 2011 Selectable Media. All rights reserved.
//
package demo.view
{                                               
	import com.polyworks.framework.view.ViewCollection; 
	
	public class ViewList extends ViewCollection
	{          
		private static var _instance:ViewList; 
		
		public static const VIEW_ONE:String = "viewOne";
		public static const VIEW_TWO:String = "viewTwo"; 
		public static const VIEW_THREE:String = "viewThree";
		
		public function ViewList(){}
		
		public static function getInstance():ViewList
		{
			if(_instance == null)
			{
				_instance = new ViewList();
			}
			return _instance;
		}

		public static function killInstance():void { _instance = null; }
	}
}	