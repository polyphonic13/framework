//
//  CommandBucket
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.framework.data
{
	import com.polyworks.framework.commands.ICommand; 

	public class CommandBucket 
	{
		private var _events:Object;
		private var _commands:Array;
		private var _idx:int;
		
		public function get events():Object { 
			return _events; 
		};
		public function set events( value:Object ):void {
			if ( value !== _events ){
				_events = value;
			};
		};
		
		public function get commands():Array { 
			return _commands; 
		};
		public function set commands( value:Array ):void {
			if ( value !== _commands ){
				_commands = value;
			};
		};
		
		public function get idx():int { 
			return _idx; 
		};
		public function set idx( value:int ):void {
			if ( value !== _idx ){
				_idx = value;
			};
		};
		
		
		public function CommandBucket()
		{
			_events = new Object(); 
			_commands = new Array();
			_idx = 0; 
		}
		
		public function addCommand(str:String, cmd:ICommand):void
		{
			_commands.push(cmd); 
			_events[str] = _idx;
			_idx++;
		}

		public function removeAllCommands():void 
		{
			for(var key:String in _events)
			{
				_events[key] = null; 
			}
			for(var i:int = 0; i < _commands.length; i++)
			{
				_commands[i] = null; 
			} 
		}

		public function getCommand(str:String):ICommand 
		{
			return _commands[_events[str]];
		}
		
		public function hasCommand(str:String):Boolean
		{
			if(typeof(_events[str]) != 'undefined') 
			{
				return true;
			}
			else
			{
				return false; 
			}
		}
	}
}