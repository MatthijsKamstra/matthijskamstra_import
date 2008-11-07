/**
Snapshot (AS3), version 1.0

take snapshot or screenshots of movieclips or images



EXAMPLE

		import nl.matthijskamstra.utils.Snapshot;
		var myBitmapData:BitmapData = Snapshot.takeSnapshot(this.foobar_mc);
		
	or
		
		import nl.matthijskamstra.utils.Snapshot;
		var figureOneMC:Bitmap = new Bitmap();
		this.addChild(figureOneMC);
		figureOneMC.bitmapData =  Snapshot.takeSnapshot(this.foorbar_mc);


<pre>
____                   _      ____ 
|  __| _ __ ___    ___ | | __ |__  |
| |   | '_ ` _ \  / __|| |/ /    | |
| |   | | | | | || (__ |   <     | |
| |__ |_| |_| |_| \___||_|\_\  __| |
|____|                        |____|

</pre>

@class  	: 	Snapshot
@author 	:  	Matthijs C. Kamstra [mck]
@version 	:	1.0 - class creation (AS3)
@since 		:	29-10-2008 12:02 

Changelog:
v 1.0 [29-10-2008 12:02] - Initial release

*/
package nl.matthijskamstra.utils {
	
	import flash.display.*;
	import flash.events.*;	
	
	public class Snapshot  {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.Snapshot;
		public static var CLASS_NAME : String = "Snapshot";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.Snapshot";
		// vars

		public static const MAX_SIZE : int = 2880;	// 	Defines the maximum dimension of a BitmapData object in the Flash Player 9 .
		/*
		Flash player 10 can be bigger...
		http://www.bit-101.com/blog/?p=1426
		4,095 x 4,095, 
		
		2169 x 7735
		3133 x 5355
		3315 x 5061
		3615 x 4641
		4095 x 4097
		4097 x 4095
		4641 x 3615
		5061 x 3315
		5355 x 3133
		7735 x 2169

		And if you are super dorky you would use flash to figure all this out for you:

		var maxPix:uint = 16777215;
		var maxSize:uint = 8191;

		for (var i:uint = 1; i < maxSize; i++) {
			var n:Number = maxPix / i;
			if (n == int(n) && n <= maxSize){
				trace(i+” x “+n);
			}
		}
		
		*/
		
		/**
		* Constructor
		*/
		public function Snapshot(  ) {
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		}
		
		/*
			var bitmapData:BitmapData = new BitmapData(target.width, target.height, true, 0xFFFFFF);
			var drawingRectangle:Rectangle =  new Rectangle(0, 0, target.width, target.height);
			bitmapData.draw(target, new Matrix(), null, null, drawingRectangle, false);
		*/	

		/**
		 * @usage		import nl.matthijskamstra.utils.Snapshot;
		 * 				var myBitmapData:BitmapData = Snapshot.takeSnapshot(this.foobar_mc);
		 * 
		 * 
		 * @param	$targetObj		a object that not has to be on the displayObjectlist
		 * @return		the bitmapdata
		 */
		public static function takeSnapshot($targetObj:DisplayObject):BitmapData {
			//trace( "Snapshot.takeSnapshot > $targetObj : " + $targetObj );
			if ($targetObj.width > MAX_SIZE || $targetObj.height > MAX_SIZE ) { 
				trace ('-- currently the bitmapdata can\'t be bigger then ' + MAX_SIZE + ' pixels-- ')
			}
			var myBitmapData:BitmapData = new BitmapData($targetObj.width, $targetObj.height, true, 0x00000000);
			myBitmapData.draw($targetObj);
			return myBitmapData;
		}
		
		public static function bitmapdataArray ($targetObj:MovieClip, $frame:Number = 1 ):Array {
			trace( "$targetObj.totalFrames : " + $targetObj.totalFrames );

			var bmdArray:Array = [];
			var frame:uint = $frame;
			for (var i:int = 0; i < $targetObj.totalFrames; i++) {
				bmdArray.push (Snapshot.takeSnapshot($targetObj));
				$targetObj.gotoAndStop(i);
			}
			return bmdArray
		}
		
		
		/**
		 * 
		 * taken from  
		 * @author jason m horwitz | sekati.com
		 * 
		 * BitmapDataCapture Constructor
		 * @param src 			of the DisplayObject to capture.
		 * @param scale 		to apply to the captured BitmapData.
		 * @param transparent 	Specifies whether the bitmap supports per-pixel transparency. 
		 * 						If <code>true</code> set the <code>fillColor</code> to <code>0x00000000</code> for a full transparent bitmap.
		 * 						If <code>false</code> a minor improvement in rendering performance will result.
		 * @param fillColor 	32-bit ARGB value to fill the bitmap area with.
		 */
		public function BitmapDataCapture(src : DisplayObject, scale : Number = 1, transparent : Boolean = false, fillColor : uint = 0xFFFFFFFF) {
			// super( src.width * scale, src.height * scale, transparent, fillColor );
			//this.draw( src, new Matrix( scale, 0, 0, scale, 0, 0 ) );
		}

		
		//////////////////////////////////////// static ////////////////////////////////////////		


		
		//////////////////////////////////////// Listener ////////////////////////////////////////
		
		
	} // end class
	
} // end package
