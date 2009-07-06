/**
 * 
 * 
 * The load an image with listeners
 * 
 * 
 * Example:
 * import nl.matthijskamstra.loader.ImgLoader;
 * var _ImgLoader:ImgLoader = new ImgLoader('img/foobar.jpg', this); 
 * // Listeners
 * _ImgLoader.addEventListener(Event.COMPLETE, onCompleteHandler);  
 * private function onCompleteHandler(e:Event):void 
 * {
 * 		trace( "onCompleteHandler > e : " + e );
 * }
*/
package nl.matthijskamstra.loader {
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	
	public class ImgLoader extends MovieClip implements IEventDispatcher
	{
		private var _url:String;
		private var loader:Loader;
		
		
		/**
		 * The load an image with listeners
		 * 
		 * @param	inURL		path to the image
		 * @param	inTarget	image container (a MovieClip or the stage) to place the image in
		 */
		public function ImgLoader( inURL:String , inTarget:MovieClip = null)
		{
			//trace( "ImgLoader.ImgLoader > inURL : " + inURL + ", inTarget : " + inTarget );
			
			_url = inURL;
			loadImg();
			if (inTarget == null) {
				addChild(loader);
			} else {
				inTarget.addChild(loader);
			}
			
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
