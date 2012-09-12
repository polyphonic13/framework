//
//  ViewThreeClick
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
	
	public class ViewThreeClick extends Command
	{
		public override function execute(evt:Event):void 
		{
			trace("ViewThreeClick/execute");
			var model:DModel = DModel.getInstance();
			var viewList:ViewList = ViewList.getInstance(); 
			viewList.bringToTop(ViewList.VIEW_ONE);
			/*
			if(model.visibleView == ViewList.VIEW_TWO)
			{   
				viewList.hideView(ViewList.VIEW_TWO);
				viewList.showView(ViewList.VIEW_ONE);
				model.visibleView = ViewList.VIEW_ONE;
			}
			*/
		}
	}	
}
