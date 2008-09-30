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

	/**
	* Constructor
	* Enter description here
	* 
	* @usage   		import nl.matthijskamstra.loading.VisualLoader;
	* 				var myVisualLoader:VisualLoader = new VisualLoader (this);
	* @param	$target_mc		a reference to a movie clip or object
	* @param	$fileURL			
	* @param	$vars			
	*/
	public function VisualLoader( $target_mc : MovieClip, $fileURL:String, $vars:Object)  {
		//trace( "VisualLoader.VisualLoader > $target_mc : " + $target_mc + ", $fileURL : " + $fileURL + ", $vars : " + $vars );
		//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		if ( $target_mc == null ) { return; }
		this.fileURL = $fileURL;
		this.vars = $vars;
		
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
			trace(">> listener.onLoadError > ");
			trace(">> ==========================");
			trace(">> errorCode: " + errorCode);
			trace(">> httpStatus: " + httpStatus);
		}
		listener.onLoadInit = function(target:MovieClip):Void {
			//trace(">> listener.onLoadInit > ");
			if ($vars.onComplete != null) {
				if ($vars.onCompleteParam == null) {
					$vars.onComplete.apply(null, []);
				} else {
					$vars.onComplete.apply(null, $vars.onCompleteParam);
				}
			}
		};
		mcLoader.addListener(listener);
		mcLoader.loadClip($fileURL, $target_mc);
	}
	
	
	//////////////////////////////////////// static ////////////////////////////////////////
	
	/**
	*
	* 
	* @usage   nl.matthijskamstra.loading.VisualLoader.start(this.foobar_mc);
	* @param	$target_mc		a reference to a movie clip or object
	* @param	$fileURL
	* @param	$vars
	* @return
	*/
	public static function start ( $target_mc : MovieClip, $fileURL:String, $vars:Object):VisualLoader {
		return new VisualLoader( $target_mc, $fileURL, $vars );
	}
	
} // end class
