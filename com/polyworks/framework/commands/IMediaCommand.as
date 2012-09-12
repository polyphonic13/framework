//
//  ICommand
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.framework.commands
{
	import flash.events.Event; 
	import com.polyworks.framework.events.MediaEvent;
	
	public interface IMediaCommand
	{
		function execute(evt:MediaEvent):void;
		function directExecute( data:Object = null ):void;
		function kill():void;
	}
}
