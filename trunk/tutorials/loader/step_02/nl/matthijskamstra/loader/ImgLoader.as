/**
var _ImgLoader:ImgLoader = new ImgLoader(this, 'img/foobar.jpg'); 
	
// Listeners
_ImgLoader.addEventListener(Event.COMPLETE, onCompleteHandler);  

private function onCompleteHandler(e:Event):void 
{
	trace( "ImgLoaderMain.onCompleteHandler > e : " + e );
}

*/
package nl.matthijskamstra.loader {
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	
	public class ImgLoader extends EventDispatcher 
	{
		private var _url:String;
		private var loader:Loader;
		
		public function ImgLoader(inTarget:MovieClip, inURL:String) 
		{
			_url = inURL;
			
			loadImg();
			
			inTarget.addChild(loader);
		}
		
		
		private function loadImg():void 
		{
			loader = new Loader();
			
	        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            /*
			// other events that we could use, but don't for now
			loader.contentLoaderInfo.addEventListener(Event.OPEN, openHandler);
			loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            loader.contentLoaderInfo.addEventListener(Event.INIT, initHandler);
            loader.contentLoaderInfo.addEventListener(Event.UNLOAD, unLoadHandler);
			*/
			
			var request:URLRequest = new URLRequest(_url);
			loader.load(request);
		}
		
		private function completeHandler(e:Event):void 
		{
			var evt:Event = new Event(Event.COMPLETE);
			dispatchEvent(evt);
		}	
		
		private function progressHandler(e:ProgressEvent):void 
		{
			var evt:ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS, false, false, e.bytesLoaded, e.bytesTotal);
			dispatchEvent(evt);
		}		
		
		private function ioErrorHandler(e:IOErrorEvent):void 
		{
			var evt:IOErrorEvent = new IOErrorEvent(IOErrorEvent.IO_ERROR, false, false, e.text);
			dispatchEvent(evt);
		}
		
	} // end class

} // end package
