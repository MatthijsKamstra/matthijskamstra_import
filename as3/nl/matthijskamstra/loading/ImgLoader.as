/**

Loading SWF files or image (JPG, PNG, or GIF) files is asynchronous, which means that when the image is called it isn't available in the next line of code.
To make sure that the img is loaded, and function that depend on image information (width / height) can be triggered after it is loaded

ARGUMENTS:
	1) $targetObj: 	Target MovieClip (or any other object) where the image will be loaded into
	2) $url: 		path to image file
	3) $obj: 		An object containing param that you want to use with the creation of the FLVPlayerLite, playing or ending of the FLV
						SPECIAL PROPERTIES:
							onComplete			: If you'd like to call a function when loading has finished, use this. 
							onCompleteParams	: An array of parameters to pass the onComplete function (optional)
							onProgress			: If you'd like to call a function to follow the progress of the image loading, use this. 
							onProgressParams	: An array of parameters to pass the onProgress function (optional)

EXAMPLE

	load a img (SWF, JPG, PNG, or GIF) into a object:
			import nl.matthijskamstra.loading.ImgLoader;
			var img0:ImgLoader = new ImgLoader (this.imgContainer_mc, 'img/fooImage.jpg');
			
	using a static function:
			import nl.matthijskamstra.loading.ImgLoader;
			ImgLoader.start (this.imgContainer_mc, 'img/fooImage.jpg', {onComplete:onCompleteFunction});
			function onCompleteFunction ():void { //trace( "-- onCompleteFunction --");}
			
	load a img (SWF, JPG, PNG, or GIF) into a object and onComplete send a call to a function (onCompleteFunction) and extra params:
			var img0:ImgLoader = new ImgLoader (this.imgContainer_mc, 'img/fooImage.jpg', {onComplete:onCompleteFunction, onCompleteParams:['test', true]});
			function onCompleteFunction (... $arg):void {
				//trace( "-- onCompleteFunction -- $arg : " + $arg );
			}
			
	load a img (SWF, JPG, PNG, or GIF) into a object and onComplete send a call to a function (onCompleteFunction) 
	and track progress:
			var img0:ImgLoader = new ImgLoader (this.imgContainer_mc, 'img/fooImage.jpg', {onProgress:onProgressHandler});
			function onProgressHandler ($percentage:Number):void {
				//trace( "-- onProgressHandler -- $percentage :: " + $percentage );
			}

<pre>

  ____                   _      ____
|  __| _ __ ___    ___ | | __ |__  |
| |   | '_ ` _ \  / __|| |/ /    | |
| |   | | | | | || (__ |   <     | |
| |__ |_| |_| |_| \___||_|\_\  __| |
|____|                        |____|

Copyright 2008 [Matthijs C. Kamstra] - All Rights Reserved

</pre>


@author  	Matthijs C. Kamstra [mck]
@version 	1.1	(AS3)
@since   	19-5-2008 12:12

Changelog:
 		v 1.1 [2008-05-23] - name added
 		v 1.0 [2008-05-19] - Initial release

*/
package nl.matthijskamstra.loading {

	import flash.errors.*;
	import flash.events.*;
	// import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.Loader;
    
	public class ImgLoader{
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.loading.ImgLoader ;
		public static var CLASS_NAME : String = "ImgLoader";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.loading.ImgLoader";
		
		public static var version:Number = 1.1;
		private var name:String = 'imgContainer';		
		
		public var target				:Object; 			// a reference to a movie clip or object
		public var fileURL				:String; 			// image file that you want to load
		public var obj					:Object; 			// Variables (holds things like alpha or y or whatever we're tweening)
		
		private var onComplete			:Function; 			// The function that should be triggered when this tween has completed
		private var onCompleteParams	:Array; 			// An array containing the parameters that should be passed to the this.onComplete when this tween has finished.
		private var onProgress			:Function; 			// The function that should be triggered when a cuepoint is entered
		private var onProgressParams	:Array; 			// An array containing the parameters that should be passed to the this.onProgress when this tween has finished.

		/**
		* Constructor
		*
		* @usage   		see comments on the top of this class
		* 		
		* @param   	$target					a reference to a movie clip or object
		* @param   	$fileURL				path to xml file (example: "xml/default.xml")
		* @param	$obj					object with extra param (read more about this in the comments on the top)
		*/ 
        public function ImgLoader($target:Object, $fileURL:String, $obj:Object = null) {
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $target == null || $fileURL == null ) { return; }
			this.target = $target;
			this.fileURL = $fileURL;
			
			if ($obj != null) {
				this.onComplete = $obj.onComplete;
				this.onCompleteParams = $obj.onCompleteParams || [];
				this.onProgress = $obj.onProgress;
				this.onProgressParams = $obj.onProgressParams || [];
			}
			
			if ($obj.name != null) {
				this.name = $obj.name;
			}
			
			var loader:Loader = new Loader();
            configureListeners(loader.contentLoaderInfo);
            // loader.addEventListener(MouseEvent.CLICK, clickHandler);
			
            var request:URLRequest = new URLRequest($fileURL);
            loader.load(request);
			loader.name = this.name;			
			
            $target.addChild(loader);
        }
		
		
		private function configureListeners(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.COMPLETE, completeHandler);
            dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            dispatcher.addEventListener(Event.INIT, initHandler);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            dispatcher.addEventListener(Event.OPEN, openHandler);
            dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            dispatcher.addEventListener(Event.UNLOAD, unLoadHandler);
        }		
		
		//////////////////////////////////////// Listener/Handler ////////////////////////////////////////
		
        private function completeHandler(event:Event):void {			
			//trace( "completeHandler :: event.cancelable  : " + event.cancelable );
            //trace("completeHandler: " + event);
			if (this.onComplete != null) {
				this.onComplete.apply(null, this.onCompleteParams);
			}
        }

        private function httpStatusHandler(event:HTTPStatusEvent):void {
            //trace("httpStatusHandler: " + event);			
			//trace( "httpStatusHandler :: event.cancelable  : " + event.cancelable );
        }

        private function initHandler(event:Event):void {
            //trace("initHandler: " + event);			
			//trace( "initHandler :: event.cancelable  : " + event.cancelable );
        }

        private function ioErrorHandler(event:IOErrorEvent):void {
            //trace("ioErrorHandler: " + event);			
			//trace( "ioErrorHandler :: event.cancelable  : " + event.cancelable );
        }

        private function openHandler(event:Event):void {
            //trace("openHandler: " + event);
			
			//trace( "openHandler :: event.cancelable  : " + event.cancelable );
        }

        private function progressHandler(event:ProgressEvent):void {
			//trace( "progressHandler :: event.cancelable  : " + event.cancelable );
            //trace("progressHandler: bytesLoaded=" + event.bytesLoaded + " bytesTotal=" + event.bytesTotal);
			if (this.onProgress != null) {
				// this.onProgressParams.unshift ((event.bytesTotal / event.bytesLoaded)); 
				this.onProgress.apply(null, [(event.bytesLoaded / event.bytesTotal)]);
			}
        }

        private function unLoadHandler(event:Event):void {
			//trace( "unLoadHandler :: event.cancelable  : " + event.cancelable );
            //trace("unLoadHandler: " + event);
        }
		
		//////////////////////////////////////// static ////////////////////////////////////////
		
		/**
		* load a XML file and after the XML is loaded trigger a function 
		* @param   	$target					a reference to a movie clip or object
		* @param   	$fileURL				path to xml file (example: "xml/default.xml")
		* @param	$obj					object with extra param (read more about this in the comments on the top)
		*/ 
		public static function start ($target:Object, $fileURL:String, $obj:Object=null):ImgLoader{
			return new ImgLoader ($target, $fileURL, $obj);
		}
		
	} // end class

} // end package
