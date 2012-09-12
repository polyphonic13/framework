//
//  ViewCollection
//
//  Created by polyphonic13 on 2009-11-05.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.framework.view
{
	import flash.display.Sprite; 
	
	import com.polyworks.framework.view.IView; 
	import com.polyworks.utils.logging.Logger;
	
	public class ViewCollection implements IViewCollection 
	{
		private static var _instance:ViewCollection; 
		
		private var _names:Object;
		private var _views:Array;
		private var _idx:int; 
		private var _top:int; 
		private var _pops:Sprite; 
		
		public function ViewCollection():void {
			_names = new Object(); 
			_views = new Array(); 
			_idx = 0;
			_top = 0;
			
		}
		
		public function get views():Array { 
			return _views; 
		};
		public function set views( value:Array ):void {
			if ( value !== _views ){
				_views = value;
			};
		};
		
		public function get names():Object { 
			return _names; 
		};
		public function set names( value:Object ):void {
			if ( value !== _names ){
				_names = value;
			};
		};
		
		public function init(pops:Sprite):void 
		{
			_pops = pops;
			//Logger.output('ViewCollection/init\n\t_names = ' + _names + '\n\t_views = ' + _views + '\n\t_idx = ' + _idx);
		}
		
		public function addView(view:*, name:String, addToPops:Boolean = false):void 
		{
			if(addToPops) { _pops.addChildAt(view, _idx); }
			_views.push(view); 
			_names[name] = _idx; 
			_top = _idx;
			_idx++;
			//_pops.addChild(view);
		}
		

		public function removeView(name:String):void 
		{   
			_views[_names[name]] = null;
			_names[name] = -1;
			_pops.removeChildAt(_names[name]);
		}


		public function bringToTop(name:String):void 
		{                                                          
			Logger.output('bringToTop\n\t_names['+name+']: ' + _names[name] + '\n\t_top: ' + _top);
			if(_names[name] != _names[_top] && _names[name] > -1)
			{
				_pops.swapChildrenAt(_names[name], _top);
				_top = _names[name];
			}
			Logger.output('\t_names['+name+']: ' + _names[name] + '\n\t_top: ' + _top)
		}

		public function removeAll():void 
		{
			for(var key:String in _names)
			{
				_names[key] = null; 
			}
			for(var i:int = 0; i < _views.length; i++)
			{
				_views[i] = null;
				_pops.removeChildAt(i); 
			} 
		}

		public function hideView(str:String):void 
		{
			if(hasView(str))
			{
				_views[_names[str]].hide();
			} 
		}
		
		public function showView(str:String):void
		{
			if(hasView(str))
			{
				_views[_names[str]].show(); 
			} 
		}
		
		public function getView(str:String):* 
		{
			Logger.output('ViewCollection/getView, str = ' + str);
			
			return _views[_names[str]];
		}
		
		public function hasView(str:String):Boolean
		{
			if(typeof(_names[str]) != 'undefined') 
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