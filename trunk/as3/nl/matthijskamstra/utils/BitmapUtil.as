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
		* 
		* @usage   	import nl.matthijskamstra.utils.BitmapUtil; // import
		*			var __BitmapUtil:BitmapUtil = new BitmapUtil (  );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function BitmapUtil(  ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');

		}
		
		
		/**
		 * 
		 * @param	$bitmap
		 * @param	$animation
		 * @param	$isLoop
		 */
		 public function animateBitmap ($bitmap:Bitmap, $targetObj:MovieClip, $isLoop:Boolean = true) {
			
			this.myBmdArray = bitmapdataArray ($targetObj);
			this.myBitmap = $bitmap;
			this.isLoop = $isLoop;
			
			myBitmap.addEventListener(Event.ENTER_FRAME, figure_ENTERFRAME);
			
			
		}
		
		private function figure_ENTERFRAME(e:Event):void {
			if (framecounter >= myBmdArray.length) {
				if (!isLoop) {
					myBitmap.removeEventListener(Event.ENTER_FRAME, figure_ENTERFRAME);
				} 
				framecounter = 0;
			} 
		 
			myBitmap.bitmapData = myBmdArray[framecounter];
			framecounter++
		}
		
		
		
				
		private function bitmapdataArray ($targetObj:MovieClip, $frame:Number = 1 ):Array {
			// trace( "$targetObj.totalFrames : " + $targetObj.totalFrames );
			var bmdArray:Array = [];
			var frame:uint = $frame;
			for (var i:int = 0; i < $targetObj.totalFrames; i++) {
				bmdArray.push (Snapshot.takeSnapshot($targetObj));
				$targetObj.gotoAndStop(i);
			}
			return bmdArray
		}
		
		
		//////////////////////////////////////// Listener ////////////////////////////////////////
		
		
	} // end class
	
} // end package
