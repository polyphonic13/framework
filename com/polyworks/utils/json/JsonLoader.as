package com.polyworks.utils.json
{

	import com.polyworks.utils.logging.Logger;

	/**
	 * JsonLoader
	 * Custom class to load an json file
	 * and check for correct top node value
	 */
	public class JsonLoader
	{
		import flash.events.Event;
		import flash.events.EventDispatcher;
	    import flash.events.SecurityErrorEvent;
	    import flash.events.HTTPStatusEvent;
	    import flash.events.ProgressEvent;
	    import flash.events.IOErrorEvent;
		
		import flash.net.URLLoader;
		import flash.net.URLRequest;

		import com.polyworks.events.LoadEvent;
		
		
		private var _loader:URLLoader
		private var _request:URLRequest
		private var _jsonUrl:String; 
		private var _jsonStr:String;
		
		private var _dispatcher:EventDispatcher;
		
		/**
		 * Constructor
		 * creates a new URLLoader and EventDispatcher
		 */
		public function JsonLoader()
		{
			_loader = new URLLoader();
			_dispatcher = new EventDispatcher();
		}
		
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
		 * loadJson
		 * @param url:String 
		 * Loads url and assign tn to _topNode
		 * Assigns load function handlers
		 */
		public function loadJson(url:String):void
		{
			_jsonUrl = url;

			_request = new URLRequest(_jsonUrl);		
			
			_loader.addEventListener(Event.COMPLETE, _onComplete);
            _loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
            _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onSecurityError);

			_loader.load(_request);
		
		}
		
		/**
		 * getJsonString
		 * @return XML
		 * returns loaded XML
		 */
		public function getJsonString():String
		{
			return _jsonStr;
		}
		
		/**
		 * _onComplete
		 * @param evt:Event
		 * Called when XML successfully loaded.
		 * Tests for correct top node value with _topNode
		 */
		private function _onComplete(evt:Event):void
		{
			var _loader:URLLoader = evt.target as URLLoader;
			
			if (_loader != null)
			{
				var pEvent:LoadEvent;
				
				//Logger.output("JsonLoader._onComplete, _loader.data = " + _loader.data);
	
				_jsonStr = new String(_loader.data);
				pEvent = new LoadEvent(LoadEvent.LOADED);
			}
			else 
			{
				pEvent = new LoadEvent(LoadEvent.LOAD_ERROR);
			}
			
			_dispatcher.dispatchEvent(pEvent);
		}
		
		/**
		 * _onIOError
		 * @evt:IOErrorEvent
		 * Dispatches LoadEvent.ERROR
		 */
        private function _onIOError(evt:IOErrorEvent):void
        {
			var pEvent = new LoadEvent(LoadEvent.ERROR, LoadEvent.IO_ERROR);
            _dispatcher.dispatchEvent(pEvent);
        }
        
		/**
		 * _onSecurityError
		 * @evt:SecurityErrorEvent
		 * Dispatches LoadEvent.ERROR
		 */
        private function _onSecurityError(evt:SecurityErrorEvent):void
        {
			var pEvent = new LoadEvent(LoadEvent.ERROR, LoadEvent.SECURITY_ERROR);
            _dispatcher.dispatchEvent(pEvent);
        }
		
	}

}