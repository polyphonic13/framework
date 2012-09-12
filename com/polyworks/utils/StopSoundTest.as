package com.polyworks.utils
{
	import flash.display.MovieClip;
   	import flash.display.Sprite;
    import flash.events.*;
    import flash.net.*;
   	import flash.display.Loader;
   	import flash.utils.Timer;
   	import flash.media.SoundTransform;
   
	public class SoundStopTest extends Sprite 
	{
		var loader1:Loader;
        var loader2:Loader;
         
        var mc1 : MovieClip;
        var mc2 : MovieClip;
         
        var holder:Sprite;
         
        var mySoundTransform:SoundTransform
         
        public function SoundStopTest() 
		{
      
            holder = new Sprite;
            
            var url1:URLRequest=new URLRequest("scene6_portofino.swf");
            
            loader1=new Loader();
            loader1.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            loader1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            loader1.load(url1);
            
            holder.addChild(loader1);
            
            addChild(holder);
            
            var myTimer = new Timer(2500, 1)
            myTimer.addEventListener("timer", theEvent)         
            myTimer.start();
            
        }
               
 
        private function completeHandler(e:Event):void
		{         
               mc1 = MovieClip(loader1.content);
               mc1.gotoAndPlay(2);
        }
         
        private function theEvent(e:TimerEvent):void 
		{
            mySoundTransform = new SoundTransform();
            _mute();
        }
         
        private function _mute():void 
		{   
            mySoundTransform.volume = 0;     
            holder.soundTransform = mySoundTransform;
        }
         
        private function ioErrorHandler(event:IOErrorEvent):void { }
 
	}
}
#