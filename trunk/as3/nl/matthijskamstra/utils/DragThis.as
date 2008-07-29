/**
* DragThis (AS3), version 1.0
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
* @class  	: 	DragThis
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	16-7-2008 16:10 
* 
* Changelog:
*
* 		v 1.0 [16-7-2008 16:10] - Initial release
*
*/
package nl.matthijskamstra.utils {
	
	import flash.display.*;
	import flash.events.*;	

	public class DragThis {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.DragThis;
		public static var CLASS_NAME : String = "DragThis";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.DragThis";
		// vars
		private var _dragThis:Sprite;
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.utils.DragThis; // import
		*			var __DragThis:DragThis = new DragThis ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function DragThis( $targetObj:* = null ) {
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $targetObj == null ) { return; } ;
			
			_dragThis = $targetObj as Sprite;
			
			_dragThis.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler) 
			_dragThis.addEventListener(MouseEvent.MOUSE_UP, onMouseReleasedHandler);
			
		}
		
		
		//////////////////////////////////////// Listener ////////////////////////////////////////
		
		
		private function onMouseDownHandler(e:MouseEvent):void {
			_dragThis.startDrag();
		}
		private function onMouseReleasedHandler(e:MouseEvent):void {
			_dragThis.stopDrag();
		}		
		
		//////////////////////////////////////// static ////////////////////////////////////////		
		
		public static function now ( $targetObj:* ):DragThis {
			return ( new DragThis ( $targetObj ) );
		}
		
		
		
	} // end class
	
} // end package
