package com.polyworks.utils
{
	import flash.display.Sprite;
	
	import com.polyworks.utils.logging.Logger;

	public class ImageLoader extends Sprite
	{
		import flash.display.Loader;
		import flash.net.URLRequest;
		import flash.events.*;
		
		public var loader:Loader; 
		
		public function ImageLoader(url:String)
		{
			//Logger.output("ImageLoader, url = " + url);
			var request:URLRequest = new URLRequest(url); 
			loader = new Loader();
			addListeners(); 
			loader.load(request);
			addChild(loader);
		}
		
		public function addListeners():void
		{
			loader.contentLoaderInfo.addEventListener(Event.INIT, eventHandler);
			loader.contentLoaderInfo.addEventListener(Event.OPEN, eventHandler);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, eventHandler);  
			loader.contentLoaderInfo.addEventListener(Event.UNLOAD, eventHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHttpStatus); 
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
		}
		
		public function eventHandler(evt:Event):void
		{
			Logger.output("eventHandler: " + evt.type);
			this.dispatchEvent(evt.clone());
			
			if(evt.type == Event.COMPLETE)
			{
				removeListeners();
			}
		}

		public function onIOError(evt:IOErrorEvent):void
		{
			Logger.output("onIOError: " + evt); 
			this.dispatchEvent(evt.clone());
		}
		
		public function onHttpStatus(evt:HTTPStatusEvent):void
		{
			Logger.output("onHttpStatus: " + evt);
			this.dispatchEvent(evt.clone());
		}

		public function onProgress(evt:ProgressEvent):void
		{
			Logger.output("onProgress: bytesLoaded = " + Math.floor((evt.bytesLoaded/evt.bytesTotal)*100) + "%");
			this.dispatchEvent(evt.clone());
		}

		public function removeListeners():void
		{
			//Logger.output("removeListeners");
			loader.contentLoaderInfo.removeEventListener(Event.INIT, eventHandler);
			loader.contentLoaderInfo.removeEventListener(Event.OPEN, eventHandler);
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, eventHandler);  
			loader.contentLoaderInfo.removeEventListener(Event.UNLOAD, eventHandler);
			loader.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS, onHttpStatus); 
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loader = null;
		}
	}
}

