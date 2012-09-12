//
//  JsonLoadAndDecode
//	
//	utilizes JsonLoader class to load a json url then passes
//	to JSONDecoder class to get an Object returned with JSON data
//  Created by polyphonic13 on 2009-05-28.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.polyworks.utils.json
{
	import com.polyworks.utils.logging.Logger;

	public class JsonLoadAndDecode 
	{
		import flash.events.EventDispatcher;
		import flash.events.Event; 
		
		import com.adobe.serialization.json.*;

		import com.polyworks.events.LoadEvent;
		import com.polyworks.utils.JsonLoader;

		private var _jsonLoader:JsonLoader;
		private var _jsonDecoder:JSONDecoder; 
		
		private var _dispatcher:EventDispatcher;

		private var _data:Object; 
		private var _loaded:Boolean = false; 

		/**
		 * constructor
		 * creates new EventDispatcher and new 
		 * JsonLoader for _dispatcher and _jsonLoader
		 * members (respectively).
		 */
		public function JsonLoadAndDecode() 
		{ 
			_dispatcher = new EventDispatcher(); 
			_jsonLoader = new JsonLoader();
		}

		/**
		 * init
		 * @param jsonUrl:String - url of json file to load
		 * adds event listeners for LoadEvent's LOADED and ERROR
		 * calls loadJson method, passing jsonUrl
		 */ 
		public function init(jsonUrl:String):void
		{
			_jsonLoader.addEventListener(LoadEvent.LOADED, _onJsonLoaded);
			_jsonLoader.addEventListener(LoadEvent.ERROR, _onJsonLoadError);  
			_jsonLoader.loadJson(jsonUrl); 
		}
		
		/**
		 * get loaded
		 * @return _loaded:Boolean
		 */
		public function get loaded():Boolean { return _loaded; } 
		
		/**
		 * get data
		 * @return _data:Object
		 */
		public function get data():Object { return _data; }
		
		/**
		 * addEventListener
		 * @param type:String
		 * @param listener:Function
		 * Assisgn listeners for type to _dispatcher
		 * All events dispatched as LoadEvent, so as to 
		 * limit number of parent imports
		 */
		public function addEventListener(type:String, listener:Function):void
		{
			_dispatcher.addEventListener(type, listener);
		}
		
		/**
		 * removeEventListener
		 * @param type:String
		 * @param listener:Function
		 * Removes listeners for type from _dispatcher
		 */
		public function removeEventListener(type:String, listener:Function):void
		{
			_dispatcher.removeEventListener(type, listener);
		}
		
		/**
		 * _onJsonLoaded
		 * @param evt:LoadEvent
		 * creates new JSONDecoder, passing the json string
		 * dispatches clone of LoadEvent
		 * sets _data to JSONDecoder getValue Object
		 * removes JsonLoader and sets to null
		 */
		private function _onJsonLoaded(evt:LoadEvent):void
		{
			_jsonDecoder = new JSONDecoder(_jsonLoader.getJsonString());
			
			_data = _jsonDecoder.getValue(); 
			_loaded = true; 
			
			_dispatcher.dispatchEvent(evt.clone());
			_removeJsonLoader();
			_jsonDecoder = null; 
		}
		
		/**
		 * _onJsonLoadError
		 * @param evt:LoadEvent
		 * dispatches close of LoadEvent
		 * removes JsonLoader
		 */
		private function _onJsonLoadError(evt:LoadEvent):void
		{
			//Logger.output("json load error");
			_dispatcher.dispatchEvent(evt.clone()); 
			_removeJsonLoader();
		}

		/**
		 * _removeJsonLoader
		 * removes LoadEvent LOADED and ERROR listeners
		 * sets JsonLoader to null. 
		 */
		private function _removeJsonLoader():void 
		{
			_jsonLoader.removeEventListener(LoadEvent.LOADED, _onJsonLoaded); 
			_jsonLoader.removeEventListener(LoadEvent.ERROR, _onJsonLoaded); 
			
			_jsonLoader = null;
		}
		
	}
}