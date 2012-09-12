//
//  IController
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.framework.commands
{
	public interface IMediaController
	{
		function addCommand(str:String, cmd:IMediaCommand):void;
		//function removeCommand(cmd:ICommand):void;
	}
}