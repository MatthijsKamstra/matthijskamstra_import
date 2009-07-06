/**
* Singleton class: AssetLoader (AS3), version 1.0
*
* source: http://www.gskinner.com/blog/archives/2006/07/as3_singletons.html
* 
* Enter description here
*
*
* @class  	: 	AssetLoader
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	6-7-2009 11:22 
* 
* Changelog:
* 		v 1.0 [6-7-2009 11:22] - Initial release
*/
package nl.matthijskamstra.loader 
 {
	 import flash.display.Loader;
	 import flash.display.LoaderInfo;
	 import flash.display.MovieClip;
	 import flash.events.ErrorEvent;
	 import flash.events.Event;
	 import flash.events.IEventDispatcher;
	 import flash.events.IOErrorEvent;
	 import flash.events.ProgressEvent;
	 import flash.events.SecurityErrorEvent;
	 import flash.net.URLRequest;
	 import flash.utils.getQualifiedClassName;

	public class AssetLoader extends MovieClip implements IEventDispatcher
	 {
	
		private static var instance:AssetLoader;
		private static var allowInstantiation:Boolean;
		
		/** List of objects of type FileData. */
		private var mWaitingStack:Array = new Array();
		/** List of objects of type FileData. */
		private var mLoadingStack:Array = new Array();
		
		private var isCurrentlyLoading:Boolean = false; // start everything
		
		public function AssetLoader ():void {
			if (!allowInstantiation) {
				throw new Error("Error: Instantiation failed: Use AssetLoader.getInstance() instead of new.");
			}
		}
		
		public static function getInstance():AssetLoader 
		 {
			if (instance == null) {
				allowInstantiation = true;
				instance = new AssetLoader ();
				allowInstantiation = false;
			}
			return instance;
		}
		
		/**
		 * 
		 * @param	inUrl
		 * @param	inName
		 * @param	inTarget
		 */
		public function add (inUrl:String , inName:String = "" , inImgContainer:MovieClip = null):void
		{
			trace( "AssetLoader.add > inUrl : " + inUrl + ", inName : " + inName + ", inImgContainer : " + inImgContainer );
			if ((inUrl == null) || (inUrl.length == 0)) {
				trace("loadXML: url is not valid", toString());
				// dispatch error event
				var e:AssetLoaderEvent = new AssetLoaderEvent(AssetLoaderEvent.ERROR, inName);
				e.error = "invalid url";
				dispatchEvent(e);
				
				return;
			}
			
			
			var fd:FileData = new FileData(inUrl, inName, inImgContainer);
			mWaitingStack.push(fd);
			
			if (!isCurrentlyLoading){
				loadNext();
			}
		}
		
		
		/**
		Load next asset if the waiting stack is not empty.
		@sends AssetLoaderEvent#ALL_LOADED
		*/
		private function loadNext () : void {
			// quit if all loaders taken
			//if (mLoadingStack.length == mLoaderCount) return;

			// quit if no waiting data
			if (mWaitingStack.length == 0) {
				if (mLoadingStack.length == 0) {
					dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.ALL_LOADED));
				}
				return;
			}
			
			isCurrentlyLoading = true;
			
			// get next object to load
			var fd:FileData = mWaitingStack.shift() as FileData;
			
			// create loader object
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, handleLoaderEvent);
			loader.contentLoaderInfo.addEventListener(Event.OPEN, handleLoadStarted);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, handleLoaderProgressEvent);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, handleLoaderEvent);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleLoaderEvent);

			// store loader in data
			fd.loader = loader;
			
			// store object in loading list
			mLoadingStack.push(fd);
			
			// load object
			loader.load(new URLRequest(fd.url));
		}
		
		
		/**
		@sends AssetLoaderEvent#ERROR
		@sends AssetLoaderEvent#COMPLETE
		*/
		private function handleLoaderEvent (e:Event) : void {
			// get loader
			var info:LoaderInfo = e.target as LoaderInfo;
			
			// get data for loader
			var fd:FileData = getDataForLoaderInfo(info);
			if (fd == null) {
				trace("handleLoaderEvent: data for loader not found", toString());
				return;
			}

			// check if an IOError occurred
			var evt:AssetLoaderEvent;
			if (e is ErrorEvent) {
				// fill error event
				var errorEvent:ErrorEvent = e as ErrorEvent;
				evt = new AssetLoaderEvent(AssetLoaderEvent.ERROR, fd.name);
				evt.error = errorEvent.text;
			} else {
				// notify we're done loading this file
				evt = new AssetLoaderEvent(AssetLoaderEvent.COMPLETE, fd.name);
				evt.loader = fd.loader;
				evt.loaderInfo = info;
				evt.url = fd.url;
				evt.imgContainer = fd.imgContainer;
				// test url to see if this is an SWF
				var reSWF:RegExp = /^.*\.swf$/i;
				evt.asset = reSWF.test(evt.url) ? fd.loader.content : fd.loader;
			}
			dispatchEvent(evt);
			
			// remove data from stack
			mLoadingStack.splice(mLoadingStack.indexOf(fd), 1);
			
			// anyhow, loading is ready (error means atomaticly also to load the next)
			isCurrentlyLoading = false;
			
			// continue loading
			loadNext();
		}

		/**
		@sends AssetLoaderEvent#START
		*/
		private function handleLoadStarted (e:Event) : void {
			// get loader
			var info:LoaderInfo = e.target as LoaderInfo;
			
			// get data for loader
			var fd:FileData = getDataForLoaderInfo(info);
			if (fd == null) {
				trace("handleLoaderEvent: data for loader not found", toString());
				return;
			}

			// dispatch event we've started loading
			var evt:AssetLoaderEvent = new AssetLoaderEvent(AssetLoaderEvent.START, fd.name);
			evt.loader = fd.loader;
			evt.loadedBytesCount = 0;
			evt.totalBytesCount = 0;
			dispatchEvent(evt);
		}
		
		
		/**
		Handle ProgressEvent from Loader.
		@param e: ProgressEvent sent
		@sends AssetLoaderEvent#PROGRESS
		*/
		private function handleLoaderProgressEvent (e:ProgressEvent) : void {
			// get loader
			var info:LoaderInfo = e.target as LoaderInfo;
			
			// get data for loader
			var fd:FileData = getDataForLoaderInfo(info);
			if (fd == null) {
				trace("handleLoaderProgressEvent: data for loader not found", toString());
				return;
			}
			
			// create & dispatch event with relevant data
			var evt:AssetLoaderEvent = new AssetLoaderEvent(AssetLoaderEvent.PROGRESS, fd.name);
			evt.loader = fd.loader;
			evt.loadedBytesCount = e.bytesLoaded;
			evt.totalBytesCount = e.bytesTotal;
			dispatchEvent(evt);
		}
		
		
		/**
		Get the data block in the loading stack for the specified LoaderInfo
		@param inInfo: LoaderInfo
		@return The data, or null if none was found.
		*/
		private function getDataForLoaderInfo (inInfo:LoaderInfo):FileData {
			var len:uint = mLoadingStack.length;
			for (var i:uint = 0; i < len; i++) {
				var fd:FileData = mLoadingStack[i] as FileData;
				if (fd.loader.contentLoaderInfo == inInfo) return fd;
			}
			return null;
		}
		
		
		override public function toString ():String {
			return getQualifiedClassName(this);
		}
	
	} // end class
	
} // end package



import flash.display.Loader;
import flash.display.MovieClip;

/**
Data object for AssetLoader.
*/
class FileData {

	public var loader:Loader;
	public var url:String;
	public var name:String;
	public var bytesTotal:Number;
	public var bytesLoaded:Number;
	public var imgContainer:MovieClip;
	
	public function FileData (inURL:String, inName:String, inImgContainer:MovieClip) {
		url = inURL;
		name = inName;
		imgContainer = inImgContainer;
	}
}
