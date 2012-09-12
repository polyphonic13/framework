//
//  SwfLoader
//
//  Created by polyphonic13 on 2010-01-09.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils
{
    import flash.display.Loader;
	import flash.display.LoaderInfo;
    import flash.display.Sprite;
	import flash.display.MovieClip;
    import flash.events.*;
    import flash.net.URLRequest;

	import com.polyworks.events.LoadEvent;
	import com.polyworks.utils.logging.Logger;

    public class SwfLoader extends Sprite 
	{
        private var _loader:Loader;
      	private var _loaderInfo:LoaderInfo; 

		public function SwfLoader() 
		{
            _loader = new Loader();
            _configureListeners(loader.contentLoaderInfo);
            addChild(_loader);
		}

		public function loadSwf(url:String):void 
		{
			Logger.output("SwfLoader/loadSwf, url = " + url);
            var request:URLRequest = new URLRequest(url);
            _loader.load(request);
		}
		
		public function unLoadSwf():void 
		{
			_loader.unload();
		}
		
		public function get loader():Loader { return _loader; }
		public function get loadedSwf():MovieClip { return MovieClip(_loaderInfo.content); }
       	
		private function _configureListeners(dispatcher:IEventDispatcher):void 
		{
			Logger.output("SwfLoader/_configureListeners");
            dispatcher.addEventListener(Event.COMPLETE, _onLoadComplete);
			dispatcher.addEventListener(Event.INIT, _onLoadInit);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
        }

        private function _onLoadComplete(evt:Event):void 
		{
            Logger.output("\tcompleteHandler: " + evt);
			_loaderInfo = evt.target as LoaderInfo;
			dispatchEvent(new LoadEvent(LoadEvent.LOADED)); 
			_removeListeners();
        }

		private function _onLoadInit(evt:Event):void
		{
			Logger.output("\t_onLoadInit: " + evt);
			//_onLoadComplete(evt.clone());
		}

        private function _onIOError(evt:IOErrorEvent):void 
		{
            Logger.output("\tioErrorHandler: " + evt);
			var loadEvent = new LoadEvent(LoadEvent.ERROR, LoadEvent.IO_ERROR);
			_removeListeners(); 
        }

		private function _removeListeners():void 
		{
			this.removeEventListener(Event.COMPLETE, _onLoadComplete); 
			this.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError); 
		}
    }
}

