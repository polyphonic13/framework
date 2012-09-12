//
//  Command
//	
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 polyworks. All rights reserved.
//
//	@implements com.polyworks.framework.commands.ICommand
//
//	abstract class to be extend by each concrete command
//	class. 
//	utilizes overridable execute method.
//
//	usage: 
/*
	public class TestCommandOne extends Command
	{
		public override function execute(evt:Event):void 
		{
			Logger.output("TEST_COMMAND_ONE  executed");
		}
	}
*/
package com.polyworks.framework.commands
{
	import flash.events.Event; 

	import com.polyworks.framework.events.MediaEvent; 
	import com.polyworks.utils.logging.Logger;
	
	public class Command implements ICommand
	{
		/**
		 * @param evt:Event - to respond / execute
		 * according to
		 */
		public function execute(evt:Event):void 
		{
			Logger.output("Command/execute, evt.type = " + evt.type);
		}
	}
}