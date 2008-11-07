/**
* BitmapUtil (AS3), version 1.0
*
* Enter description here
*
* <pre>
*  ____                   _      ____ 
* |  __| _ __ ___    ___ | | __ |__  |
* | |   | '_ ` _ \  / __|| |/ /    | |
* | |   | | | | | || (__ |   <     | |
* | |__ |_| |_| |_| \___||_|\_\  __| |
* |____|                        |____|
* 
* </pre>
*
* @class  	: 	BitmapUtil
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	30-10-2008 17:26 
* 
* Changelog:
*
* 		v 1.0 [30-10-2008 17:26] - Initial release
*
*/
package nl.matthijskamstra.utils {
	
	import flash.display.*;
	import flash.events.*;	

	public class BitmapUtil {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.BitmapUtil;
		public static var CLASS_NAME : String = "BitmapUtil";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.BitmapUtil";
		// vars
		public static var targetObj:DisplayObjectContainer;		
		private var myBitmap:Bitmap;
		private var myBmdArray:Array;
		private var framecounter:uint = 0;
		private var isLoop:Boolean;
		
		/**
		* Constructor
		*/
		public function BitmapUtil(  ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');

		}
		
		
	/**
	 * 
	 * @usage 		import nl.matthijskamstra.utils.BitmapUtil;
	 *				var myBitmapUtil:BitmapUtil = new BitmapUtil ();
	 *				myBitmapUtil.animateBitmap (containerMC, tempAni2MC, 600, 30, true);
	 * 
	 * @param	$bitmap			a bitmap that will show the animition
	 * @param	$targetObj		a movieClip that holds the animation
	 * @param	$width			the width of the snapshot (default the width of the movieclip)
	 * @param	$height			the height of the snapshot (default the height of the movieclip)
	 * @param	$isLoop			a boolean that loops in default
	 */
		 public function animateBitmap ($bitmap:Bitmap, $targetObj:MovieClip, $width:int, $height:int, $isLoop:Boolean = true) {
			
			if ($bitmap == null || $targetObj == null) { return; }
			this.myBitmap = $bitmap;
			this.isLoop = $isLoop;
			var useWidth:int = $width || $targetObj.width;
			var useHeight:int = $height || $targetObj.height;
			
			this.myBmdArray = bitmapdataArray ($targetObj, useWidth, useHeight);
			
			myBitmap.addEventListener(Event.ENTER_FRAME, animate_onEnterFrame);
			
			
		}
		
		private function animate_onEnterFrame(e:Event):void {
			if (framecounter >= myBmdArray.length) {
				if (!isLoop) {
					myBitmap.removeEventListener(Event.ENTER_FRAME, animate_onEnterFrame);
				} 
				framecounter = 0;
			} 
		 
			myBitmap.bitmapData = myBmdArray[framecounter];
			framecounter++
		}
		
		
			
		/**
		 * @usage 		import nl.matthijskamstra.utils.SnapShot;
		 * 				var foobarMC:MovieClip = _root.attachMovie ("foobar_mc", "foobarMC" , _root.getNextHighestDepth()); 
		 * 				foobarMC._visible = false;
		 * 				var walkBmdArray:Array = Snapshot.bitmapdataArray (foobarMC, 60, 120);
		 * 
		 * @param	$targetObj		a reference to a movie clip or object
		 * @param	$width			the width of the snapshot (default the width of the movieclip)
		 * @param	$height			the height of the snapshot (default the height of the movieclip)
		 * @param	$frame				does nothing right now
		 * @return			array of bitmapdata
		 */
		private function bitmapdataArray ($targetObj:MovieClip, $width:int, $height:int,  $frame:int = 1 ):Array {
			// trace( "$targetObj.totalFrames : " + $targetObj.totalFrames );
			if ($targetObj == null) { return; }
			var useWidth:int = $width || $targetObj._width;
			var useHeight:int = $height || $targetObj._height;
			var frame:int = $frame || 1;
			
			var bmdArray:Array = [];			
			for (var i:int = 0; i < $targetObj.totalFrames; i++) {
				bmdArray.push (Snapshot.takeSnapshot($targetObj, useWidth, useHeight));
				$targetObj.gotoAndStop(i);
			}
			return bmdArray
		}
		
		
		//////////////////////////////////////// Listener ////////////////////////////////////////
		
		
	} // end class
	
} // end package
