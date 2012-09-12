//
//  DController
//
//  Created by paul hoover on 2011-08-16.
//  Copyright (c) 2011 Selectable Media. All rights reserved.
//
package demo.commands
{                                                        
	import com.polyworks.framework.commands.Controller; 
	import com.polyworks.framework.events.EventCenter; 
	
	import demo.commands.*;                    
	import demo.events.EventList;
	
	public class DController extends Controller
	{
		public function DController(evtCenter:EventCenter)
		{
			super(evtCenter);
			_init();
		}
		
		private function _init():void 
		{
			addCommand(EventList.BUILD_VIEWS, new BuildViews);
			addCommand(EventList.VIEW_ONE_CLICK, new ViewOneClick);
			addCommand(EventList.VIEW_TWO_CLICK, new ViewTwoClick);
			addCommand(EventList.VIEW_THREE_CLICK, new ViewThreeClick);
		}
	}
}
