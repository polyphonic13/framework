//
//  ViewOneClick
//
//  Created by paul hoover on 2011-08-16.
//  Copyright (c) 2011 Selectable Media. All rights reserved.
//
package demo.commands
{       
	import flash.events.Event; 
	
	import com.polyworks.framework.commands.Command;
	
	import demo.model.DModel;
	import demo.view.ViewList;
	
	public class ViewOneClick extends Command
	{
		public override function execute(evt:Event):void 
		{                      
			trace("ViewOneClick/execute");
			var model:DModel = DModel.getInstance();
			var viewList:ViewList = ViewList.getInstance(); 
			viewList.bringToTop(ViewList.VIEW_TWO);
			
			/*
			if(model.visibleView == ViewList.VIEW_ONE)
			{   
				viewList.hideView(ViewList.VIEW_ONE);
				viewList.showView(ViewList.VIEW_TWO);
				model.visibleView = ViewList.VIEW_TWO;
			}
			*/
		}
	}	
}
