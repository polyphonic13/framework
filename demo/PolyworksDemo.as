﻿////  PolyworksDemo////  Created by paul hoover on 2011-08-16.//  Copyright (c) 2011 Selectable Media. All rights reserved.//package demo{                          	import flash.display.Sprite; 	import flash.events.Event; 		import demo.commands.DController;	import demo.events.*;	import demo.model.DModel; 	import com.polyworks.framework.model.CountingModel;		/**	* PolyworksDemo is a simple application to demostrate the	* polyworks AS3 framework. It consists of:	* <ul>	* 	<li>Two Views ViewOne and ViewTwo which act as "buttons".</li>	* 	<li>DModel which contains the configuration object as well as the current states of the views.</li>	* 	<li>EventList containing all of the custom events of the application.</li>	*	<li>DEventCenter and extended EventCenter which dispatches and listens for EventList events.</li>	* 	<li>DController that, via the DEventCenter, listens for and executes Commands with relation to events.</li>	* 	<li>Three Commands, executed by the controller:	* 		<ul>	* 			<li>BuildViews: creates ViewOne and ViewTwo and places in the ViewList and adds to Model.displayParent (this).</li>	* 			<li>ViewOneClick: hides ViewOne if visible and shows ViewTwo.</li>	* 			<li>ViewTwoClick: hides ViewTwo if visible and shows ViewOne.</li>	* 		</ul>	* 	</li>	* </ul> 	*/	public class PolyworksDemo extends Sprite	{       		private var _model:DModel;		private var _controller:DController;		private var _eventCenter:DEventCenter;				public function PolyworksDemo()		{			var config = {				v1:{ w:100, h:100, x:50, y:10, color:0x0000ff },				v2:{ w:100, h:100, x:100, y:60, color:0x123456 },				v3:{ w:100, h:100, x:150, y:110, color:0x000000 }			}						// initialize model with view params            _model = new DModel();			_model.displayParent = this;			_model.init(config); 			// create event center and controller			_eventCenter = DEventCenter.getInstance();			_controller = new DController(_eventCenter);						// send build views command			_eventCenter.broadcast(new Event(EventList.BUILD_VIEWS));						var countingModelTest:CountingModel = new CountingModel( 'countingModelTest' );			countingModelTest.initMe();		}	}}