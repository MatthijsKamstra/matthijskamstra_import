/**
* Button (AS3), version 1.0
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
* @class  	: 	Button
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	23-4-2008 10:51 
* 
*/
package nl.matthijskamstra.util {
	
	import flash.display.*;
	import flash.events.*;

	public class Button {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.util.Button;
		public static var CLASS_NAME : String = "Button";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.util.Button";
		// vars
		private var func:Function;
		private var vars:Array = [];
		
		/**
		 * Constructor
		 * 
		 * @param	$target
		 * @param	$func
		 * @param	$vars
		 */
		public function Button( $target:Object , $func:Function , $vars:* ) {
			if ($target == null) { return; }
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');	
			
			this.func = $func;
			if (typeof ($vars) == 'object') {
				this.vars = $vars || [];
			} else {
				this.vars.push ($vars)
			}
			
			var ___debug_mc = $target;
			___debug_mc.buttonMode = true;
			___debug_mc.addEventListener (MouseEvent.CLICK, buttonListener);
		}
		
		/**
		 * 
		 * @param	$target
		 * @param	$func
		 * @param	$vars
		 */
		static public function create ($target:Object , $func:Function , $vars:*):Button {
			return new Button($target, $func, $vars);
		}
		
		private function buttonListener(e:MouseEvent):void {
			this.func.apply(null, vars);
		}

		
	} // end class
	
} // end package
