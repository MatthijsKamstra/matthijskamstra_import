
package nl.matthijskamstra.loader{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;		

	/**
	Event object sent by {@link AssetLoader}. Subscribe to type <code>_EVENT</code>.
	*/
	public class AssetLoaderEvent extends Event {

		/** Event type. */
		public static const _EVENT:String = "loaderStackEvent";
	
		/** Event subtype sent when a single object starts being loaded. */
		public static const START:String = "loadStart";
		/** Event subtype  sent during loading. */
		public static const PROGRESS:String = "loadProgress";
		/** Event subtype  sent when loading is done. */
		public static const COMPLETE:String = "loadDone";
		/** Event subtype  sent when all objects have been loaded. */
		public static const ALL_LOADED:String = "allLoadFinished";
		/** Event subtype  sent when there's an error. */
		public static const ERROR:String = "loadError";

		public var subtype:String;
		public var name:String;
		public var totalBytesCount:uint;
		public var loadedBytesCount:uint;
		public var error:String;
		public var loader:Loader;
		public var loaderInfo:LoaderInfo;
		public var imgContainer:MovieClip;
		
		/**
		The loaded asset. In case of an image: the Loader object; in case of an SWF: the Loader's content object.
		*/
		public var asset:DisplayObject;
		public var url:String;

		/**
		Creates a new AssetLoaderEvent.
		@param inSubtype: either subtype; see above
		@param inName: (optional) identifier of the loading action
		*/
		public function AssetLoaderEvent (inSubtype:String, inName:String = "") {
			super(_EVENT);
			
			subtype = inSubtype;
			name = inName;
		}
		
		public override function toString () : String {
			return getQualifiedClassName(this) + "; name=" + name + "; subtype=" + subtype + "; error=" + error + "; totalBytesCount=" + totalBytesCount + "; loadedBytesCount=" + loadedBytesCount;
		}
		
		/**
		Creates a copy of an existing AssetLoaderEvent.
		*/
		public override function clone() : Event {
			return new AssetLoaderEvent(subtype, name);
		} 
	}
}