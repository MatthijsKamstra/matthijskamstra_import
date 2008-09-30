import flash.display.BitmapData;
import flash.geom.*;
/**
 * http://blog.pixelfumes.com/?p=126
 * http://jobemakar.blogspot.com/2007/05/taking-movieclip-snapshot.html
 */
class nl.matthijskamstra.utils.SnapShot {
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.utils.SnapShot;
	public static var CLASS_NAME : String = "SnapShot";
	public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.SnapShot";
	// vars
	private var mc		:MovieClip;
	private var bmp		:BitmapData;
	private var target	:MovieClip;
	/**
	 * constructor
	 * @usage		import nl.matthijskamstra.utils.SnapShot;
	 * 				var _snapShot:SnapShot = new SnapShot (this.foobar);
	 * @param	$m		a reference to a movie clip or object
	 */
	function SnapShot($target_mc:MovieClip) {
		if ($target_mc == null) { return; }
		trace( "SnapShot.SnapShot > $target_mc : " + $target_mc );
		bmp = new BitmapData($target_mc._width, $target_mc._height, true, 0xFFFFFF);
		bmp.draw($target_mc);
	}
	
 	/**
	 * @usage		import nl.matthijskamstra.utils.SnapShot;
	 * 				var _snapShot:SnapShot = new SnapShot (this.foobar);
	 * 				_snapShot.showSnapShot(frame_mc);
	 * @param	$target_mc		a reference to a movie clip or object
	 */
	public function showSnapShot($target_mc:MovieClip):Void{
		target = $target_mc;
		target.createEmptyMovieClip("snapShot", target.getNextHighestDepth());
		target.snapShot.attachBitmap(bmp, 1);
	}
	
	// 
	public function removeSnapShot():Void{
		removeMovieClip(target.snapShot);
	}
	
	/**
	* http://jobemakar.blogspot.com/2007/05/taking-movieclip-snapshot.html
	* 
	* @usage		import nl.matthijskamstra.utils.SnapShot;
	* 				var _snapShot:SnapShot = new SnapShot ();
	* 				_snapShot.snapShotNow (img_mc, frame_mc);
	* @param	$target_mc		a reference to a movie clip or object that will be used for the snapShot
	* @param	$frame_mc		the reference to a movie used to show the snapShot
	*/
	public function snapShotNow ($target_mc:MovieClip, $frame_mc:MovieClip) {
		$frame_mc.attachBitmap(takeSnapshot($target_mc), 1);
	}
	
	//http://jobemakar.blogspot.com/2007/05/taking-movieclip-snapshot.html
	public function takeSnapshot($mc:MovieClip):BitmapData {
		var myBitmapData:BitmapData = new BitmapData($mc._width, $mc._height, true, 0x000000);
		myBitmapData.draw($mc, new Matrix(), new ColorTransform(), "normal");
		return myBitmapData;
	}
}
