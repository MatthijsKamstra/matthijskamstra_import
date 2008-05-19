/**
* ChangeDepths (AS3), version 1.0
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
* @class  	: 	ChangeDepths
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	28-1-2008 15:06 
* 
*/
package nl.matthijskamstra.utils {
	import flash.display.DisplayObjectContainer;
	import nl.consumentveiligheid.splittherisk.ScreenView;
	import nl.consumentveiligheid.splittherisk.utils.PixelGrid;
	import nl.matthijskamstra.video.FLVPlayer;
	

	public class ChangeDepths  {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.ChangeDepths;
		public static var CLASS_NAME : String = "ChangeDepths";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.ChangeDepths";
		// vars
		public static var targetObj:Object;		
		
		private static var wordArray:Array;
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.utils.ChangeDepths; // import
		*			var __ChangeDepths:nl.matthijskamstra.utils.ChangeDepths = new nl.matthijskamstra.utils.ChangeDepths ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function ChangeDepths( $targetObj:Object = null ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $targetObj == null ) { return; } ;
			targetObj = $targetObj;
		}
		/**
		 * @usage		var objectArray:Array = [	FLVPlayer.myFLVPlayer, targetObj.getChildByName('bgDirt'), targetObj.getChildByName('bottomTile_mc'), targetObj.getChildByName('topTile_mc') , targetObj.getChildByName('loading_mc') , targetObj.getChildByName('inlog') , targetObj.getChildByName('PoliceTape') ];
		 * 				ChangeDepths.arrangeDepths (targetObj , objectArray ); 
		 * @param	$targetObj		displayObjectContainer (root stage)
		 * @param	$objectArray	with the movies in the order the will be arranged on stage ($objectArray[0] at the bottom, the rest on top of that)
		 * @param	$index			starting at number (default zero) // [mck] doesn't work yet.
		 */
		public static function arrangeDepths ($targetObj , $objectArray:Array , $index:uint = 0) {
			for (var i:int = 0; i < $objectArray.length; i++) {
				if ($targetObj.getChildAt(i) != $objectArray[i]) {
					$targetObj.setChildIndex($objectArray[i], i + $index);
				}
			}
		}
		
		
		/**
		 * @usage	ChangeDepths.arrangeDepths (targetObj , objectArray ); 
		 * @param	$targetObj
		 * @param	$objectArray
		 * @param	$index
		 */
		public static function arrangeDepthsName ($targetObj:DisplayObjectContainer, $objectArray:Array , $index:uint = 0) {
			ChangeDepths.wordArray = $objectArray;
			// do the special move first
			ChangeDepths.specialActionOnResize ($targetObj , $objectArray);
			ChangeDepths.changeOrder($targetObj , $objectArray);
		}
		
		/**
		 * 
		 * @param	$targetObj
		 * @param	$objectArray
		 * @param	$index
		 */
		private static function changeOrder ($targetObj:DisplayObjectContainer, $objectArray:Array , $index:uint = 0) {
			for (var i:int = 0; i < $objectArray.length; i++) {
				var store = $targetObj.getChildByName($objectArray[i]);
				//trace($targetObj.getChildIndex(store)); 
				if (store != null) {
					if ($targetObj.getChildAt(i) != store) {
						$targetObj.setChildIndex(store, i + $index);
						
					}
				}
			}
		}
		
		/**
		 * 
		 * @param	$targetObj
		 * @param	$objectArray
		 */
		private static function specialActionOnResize ($targetObj:DisplayObjectContainer, $objectArray:Array ) {
			//trace( "+ specialActionOnResize : " + specialActionOnResize + "\t\|t\ $name : " + $name );
			var __ScreenView:ScreenView = new ScreenView();
			for (var i:int = 0; i < $objectArray.length; i++) {
				var name = $objectArray[i]
				switch (name) {
				case 'bgDirt':
					__ScreenView.createBGDirtFullscreen ();
					break;
				case 'FLVPlayer':
					__ScreenView.setVideoFullScreen ();
					break;
				case 'loading_mc':
					__ScreenView.stretchLoaderLogo () ;
					break;
				case 'footer_mc':
					$targetObj.getChildByName('footer_mc').x = PixelGrid.setOnGrid( ($targetObj.stage.stageWidth - $targetObj.getChildByName('footer_mc').width)/2 ); // inlog movieclip
					break;
				case 'inlog':
					$targetObj.getChildByName('inlog').x = PixelGrid.setOnGrid( ($targetObj.stage.stageWidth - 489)/2 ); // inlog movieclip
					break;
				case 'PoliceTape':
					break;
				case 'bottomTile_mc':
				case 'topTile_mc':
					__ScreenView.createTilePatternFullscreen () ;
					break;
				default:
					trace ( '+ ' + LINKAGE_ID + " + specialActionOnResize : " + specialActionOnResize + "\t\|t\ store : " +  name );
					trace ('>> no value yet: ' +  name );
				}
			}
		}
		
		
// 	http://www.kirupa.com/forum/showthread.php?p=1897023#post1897023	
/**
* 
* 
var sortedItems:Array = new Array(mc1, mc2, mc3);
function arrange():void {
    sortedItems.sortOn("y", Array.NUMERIC);
    var i:int = sortedItems.length;
    while(i--){
        if (getChildAt(i) != sortedItems[i]) {
            setChildIndex(sortedItems[i], i);
        }
    }
}

* 
*/

		
	} // end class
	
} // end package
