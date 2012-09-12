//
//  BuildViews
//
//  Created by paul hoover on 2011-08-16.
//  Copyright (c) 2011 Selectable Media. All rights reserved.
//
package demo.commands
{       
	import flash.events.Event; 
	
	import com.polyworks.framework.commands.Command;
	
	import demo.model.DModel;
	import demo.view.*;
	
	public class BuildViews extends Command
	{
		public override function execute(evt:Event):void 
		{
			var model:DModel = DModel.getInstance();
			var viewList:ViewList = ViewList.getInstance();
			viewList.init(model.displayParent);

			var viewOne:ViewOne = new ViewOne(ViewList.VIEW_ONE, model.displayParent, false);
			viewOne.init(model.viewOneWidth, model.viewOneHeight, model.viewOneColor, model.viewOneX, model.viewOneY); 
			viewList.addView(viewOne.view, ViewList.VIEW_ONE, true);
			
			var viewTwo:ViewTwo = new ViewTwo(ViewList.VIEW_TWO, model.displayParent, false);
			viewTwo.init(model.viewTwoWidth, model.viewTwoHeight, model.viewTwoColor, model.viewTwoX, model.viewTwoY);
			viewList.addView(viewTwo.view, ViewList.VIEW_TWO, true);
			
			var viewThree:ViewThree = new ViewThree(ViewList.VIEW_THREE, model.displayParent, false);
			viewThree.init(model.viewThreeWidth, model.viewThreeHeight, model.viewThreeColor, model.viewThreeX, model.viewThreeY);
			viewList.addView(viewThree.view, ViewList.VIEW_THREE, true);
			
			//viewList.hideView(ViewList.VIEW_TWO);
			//viewList.bringToTop(ViewList.VIEW_ONE);
			model.visibleView = ViewList.VIEW_ONE;
		}
	}	
}
