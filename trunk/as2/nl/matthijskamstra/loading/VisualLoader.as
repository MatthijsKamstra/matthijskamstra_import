/**

VisualLoader, version 1.0


EXAMPLE:
	import nl.matthijskamstra.loading.VisualLoader;
	var vl:VisualLoader = new VisualLoader (chapterContainerMC, '../deploy/img/Brenda mugshot.jpg', {onComplete:visualOnComplete, onProgress:onProgressFunc});

	function visualOnComplete () {
		trace ('function visualOnComplete');
	}
	function onProgressFunc ($percentage:Number) {
		trace ('function onProgressFunc $percentage >> ' + $percentage);

	}

<pre>

  ____                   _      ____
|  __| _ __ ___    ___ | | __ |__  |
| |   | '_ ` _ \  / __|| |/ /    | |
| |   | | | | | || (__ |   <     | |
| |__ |_| |_| |_| \___||_|\_\  __| |
|____|                        |____|

Copyright 2006 Matthijs C. Kamstra [mck] - All Rights Reserved

</pre>

@author  	Matthijs C. Kamstra [mck]
@version 	1.0	(AS2)
@since   	15-9-2008 13:53


Changelog:
 		v 1.0 [15-9-2008 ] - Initial release
 */

class nl.matthijskamstra.loading.VisualLoader {
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.loading.VisualLoader;
	public static var CLASS_NAME : String = "VisualLoader";
	public static var LINKAGE_ID : String = "nl.matthijskamstra.loading.VisualLoader";
	// vars

	public var fileURL				:String; 			// flv file that is to be played
	public var vars					:Object; 			// Variables (holds things like alpha or y or whatever we're tweening)
	private var onComplete			:Function;
	private var queueArray			:Array 		= [];	// queue with images

	/**
	* Constructor
	* Enter description here
	* 
	* @usage   		import nl.matthijskamstra.loading.VisualLoader;
	* 				var myVisualLoader:VisualLoader = new VisualLoader (foobar_mc, 'http://www.foobar.nl/img.jpg');
	* @param	$target_mc		a reference to a movie clip or object
	* @param	$fileURL		the location of the image (example: 'http://www.foobar.nl/img.jpg')
	* @param	$vars			extra params 
	*/
	public function VisualLoader( $target_mc : MovieClip, $fileURL:String, $vars:Object)  {
		//trace( "VisualLoader.VisualLoader > $target_mc : " + $target_mc + ", $fileURL : " + $fileURL + ", $vars : " + $vars );
		//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		if ( $target_mc == null ) { return; }
		this.fileURL = $fileURL;
		this.vars = $vars;
		var thisObj = this;
		
		var mcLoader:MovieClipLoader = new MovieClipLoader();
		var listener:Object = new Object();
		listener.onLoadProgress = function(target:MovieClip, bytesLoaded:Number, bytesTotal:Number):Void{
			//trace("listener.onLoadProgress > " + bytesLoaded + " bytes of " + bytesTotal);
			if ($vars.onProgress != null) {
				if ($vars.onProgressParam == null) {
					$vars.onProgress.apply(null, [Math.floor((bytesLoaded / bytesTotal) * 100)]);
				} else {
					$vars.onProgress.apply(null, [Math.floor((bytesLoaded / bytesTotal) * 100) , $vars.onProgressParam]);
				}
			}
		};
		listener.onLoadError = function(target_mc:MovieClip, errorCode:String, httpStatus:Number) {
			Logger.trace(">> listener.onLoadError > ");
			Logger.trace(">> ==========================");
			Logger.trace(">> errorCode: " + errorCode);
			Logger.trace(">> httpStatus: " + httpStatus);
			if (thisObj.queueArray.length > 0) {
				thisObj.startQueue ();
			}
		}
		listener.onLoadInit = function(target:MovieClip):Void {
			//Logger.trace(">> listener.onLoadInit > ");
			if ($vars.onComplete != null) {
				if ($vars.onCompleteParam == null) {
					$vars.onComplete.apply(null, []);
				} else {
					$vars.onComplete.apply(null, $vars.onCompleteParam);
				}
			}	

		};
		listener.onLoadComplete = function(target_mc:MovieClip, httpStatus:Number):Void {
			// trace(">> loadListener.onLoadComplete()");
 			// finish queue, if necessary 
			if (thisObj.queueArray.length > 0) {
				thisObj.startQueue ();
			}
		}
		mcLoader.addListener(listener);
		mcLoader.loadClip($fileURL, $target_mc);
	}
	
	/*
	* @usage   		import nl.matthijskamstra.loading.VisualLoader;
	* 				var myVisualLoader:VisualLoader = new VisualLoader ();
	* 				myVisualLoader.add(foobar_mc, 'http://www.foobar.nl/img.jpg');
	* @param	$target_mc		a reference to a movie clip or object
	* @param	$fileURL		the location of the image (example: 'http://www.foobar.nl/img.jpg')
	* @param	$vars			extra params 
	* @return
	*/
	public function add ( $target_mc : MovieClip, $fileURL:String, $vars:Object ):Void {
		queueArray.push ([$target_mc , $fileURL , $vars]);
	}
	/**
	 * start loading the queue
	 */
	public function startQueue ():Void {
		new VisualLoader( queueArray[0][0], queueArray[0][1], queueArray[0][2]);
		queueArray.shift();
	}
	
	
	//////////////////////////////////////// static ////////////////////////////////////////
	
	/**
	* Nice and easy a quick link to the loader
	* 
	* @usage   nl.matthijskamstra.loading.VisualLoader.start(this.foobar_mc , 'http://www.foobar.nl/img.jpg');
	* @param	$target_mc		a reference to a movie clip or object
	* @param	$fileURL		the location of the image (example: 'http://www.foobar.nl/img.jpg')
	* @param	$vars			extra params 
	* @return
	*/
	public static function start ( $target_mc : MovieClip, $fileURL:String, $vars:Object):VisualLoader {
		return new VisualLoader( $target_mc, $fileURL, $vars );
	}
	
} // end class
