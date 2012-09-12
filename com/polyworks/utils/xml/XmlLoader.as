package com.polyworks.utils.xml
{
	import flash.events.EventDispatcher;
	import flash.events.Event;
    import flash.events.SecurityErrorEvent;
    import flash.events.HTTPStatusEvent;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	import com.polyworks.framework.events.LoadEvent;
	import com.polyworks.utils.logging.Logger;

	/**
	 * XmlLoader
	 * Custom class to load an xml file
	 * and check for correct top node value
	 */
	public class XmlLoader extends EventDispatcher
	{
		private static var _instance:XmlLoader; 
		
		private var _xmlObj:XML;
		private var _loader:URLLoader
		private var _request:URLRequest
		private var _xmlUrl:String; 
		private var _topNode:String;
		private var _traceXml:Boolean = false; 
		
		//private var _dispatcher:EventDispatcher;
		
		/**
		 * Constructor
		 * creates a new URLLoader and EventDispatcher
		 */
		public function XmlLoader()
		{
			_loader = new URLLoader();
			
			//_dispatcher = new EventDispatcher();
		}
		
		/**
		 * addEventListener
		 * @param type:String
		 * @param listener:Function
		 * Assisgn listeners for type to _dispatcher
		 * All events dispatched as LoadEvent, so as to 
		 * limit number of parent imports
		 */
		/*
		public function addEventListener(type:String, listener:Function):void
		{
			_dispatcher.addEventListener(type, listener);
		}
		*/
		
		/**
		 * removeEventListener
		 * @param type:String
		 * @param listener:Function
		 * Removes listeners for type from _dispatcher
		 */
		/*
		public function removeEventListener(type:String, listener:Function):void
		{
			_dispatcher.removeEventListener(type, listener);
		}
		*/
		
		public static function getInstance():XmlLoader 
		{
			if(_instance == null) 
			{
				_instance = new XmlLoader(); 
			}
			return _instance;
		}
		
		public static function killInstance():void 
		{
			_instance = null; 
		}
		
		/**
		 * loadXml
		 * @param url:String 
		 * @param tN:String
		 * Loads url and assign tn to _topNode
		 * Assigns load function handlers
		 */
		public function loadXml(url:String, tN:String = "", traceXml:Boolean = false):void
		{
			_xmlUrl = url;
			_topNode = tN;
			_traceXml = traceXml; 
			
			_request = new URLRequest(_xmlUrl);		
			
			_loader.addEventListener(Event.COMPLETE, _onComplete);
            _loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
            _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onSecurityError);

			_loader.load(_request);
		
		}
		
		/**
		 * getXml
		 * @return XML
		 * returns loaded XML
		 */
		public function get xml():XML
		{
			return _xmlObj;
		}
		
		public function kill():void 
		{
			_loader.removeEventListener(Event.COMPLETE, _onComplete);
            _loader.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError);
            _loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, _onSecurityError);

			_loader = null;
		}
		
		/**
		 * _onComplete
		 * @param evt:Event
		 * Called when XML successfully loaded.
		 * Tests for correct top node value with _topNode
		 * if _topNode not an empty string
		 */
		private function _onComplete(evt:Event):void
		{                       
			Logger.output("XmlLoader/_onComplete");
			var _loader:URLLoader = evt.target as URLLoader;
			
			if (_loader != null)
			{                 
				Logger.output("\t_loader != null");
				var loadEvent:LoadEvent;
				
				try
				{
					_xmlObj = new XML(_loader.data);
					Logger.output("_topNode = " + _topNode + "\n\t_xmlObj[0].localName = " + _xmlObj[0].localName());
					if(_traceXml)
					{
						Logger.output("\txml =\n " + _xmlObj)
					}
					if((_topNode != "") && (_xmlObj[0].localName() != _topNode))
					{
						Logger.output("\tERROR: _topNode mismatch");
						loadEvent = new LoadEvent(LoadEvent.ERROR, LoadEvent.TOP_NODE_ERROR);
					} 
					else
					{
						loadEvent = new LoadEvent(LoadEvent.LOADED);
					}
				}
				catch(error:Error)
				{
					Logger.output("\tERROR: " + error);
					loadEvent = new LoadEvent(LoadEvent.ERROR, error.message);
				}
			}
			else 
			{
				Logger.output("\tERROR: _loader null");
				loadEvent = new LoadEvent(LoadEvent.ERROR, LoadEvent.LOAD_ERROR);
			}
			
			//_dispatcher.dispatchEvent(loadEvent);
			dispatchEvent(loadEvent); 
		}
		
		/**
		 * _onIOError
		 * @evt:IOErrorEvent
		 * Dispatches LoadEvent.ERROR
		 */
        private function _onIOError(evt:IOErrorEvent):void
        {
			Logger.output("XmlLoader/_onIOError");
			var loadEvent = new LoadEvent(LoadEvent.ERROR, LoadEvent.IO_ERROR);
            //_dispatcher.dispatchEvent(loadEvent);
			dispatchEvent(loadEvent); 
        }
        
		/**
		 * _onSecurityError
		 * @evt:SecurityErrorEvent
		 * Dispatches LoadEvent.ERROR
		 */
        private function _onSecurityError(evt:SecurityErrorEvent):void
        {
			Logger.output("XmlLoader/_onSecurityError");
			var loadEvent = new LoadEvent(LoadEvent.ERROR, LoadEvent.SECURITY_ERROR);
            //_dispatcher.dispatchEvent(loadEvent);
			dispatchEvent(loadEvent); 
        }
		
	}

}