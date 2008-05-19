/**
* Button (AS3), version 1.1
*
		Button.onRelease (FLVPlayerControler.playBtn_mc , buttonActivateButton, 'play');
		Button.onRollover (FLVPlayerControler.playBtn_mc , buttonActivateButton, 'rolloverPlay');
		
		private function buttonActivateButton($id:String):void {
			//trace( "++ buttonActivateButton : " + buttonActivateButton );
			//trace( "$id : " + $id );
			switch ($id) {
				case 'play': 
					trace('play');
					break;
				case 'rolloverPlay': 
					trace('rolloverPlay');
					break;
				default:
					trace( "case '" + $id + "': \n\ttrace('"+$id+"');\n\t// do something;\n\tbreak;");
			}
		}
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
* @version 	:	1.1 - (AS3)
* @since 	:	23-4-2008 10:51 
* 
* Changelog:
* 		v1.1 [2008-05-14] - all in one function (onRelease/onRollover/onRollout)
* 		v1.0 [2008-04-23] - Initial release
*
*/
package nl.matthijskamstra.utils {
	
	import flash.display.*;
	import flash.events.*;

	public class Button {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.Button;
		public static var CLASS_NAME : String = "Button";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.Button";
		// vars
		// vars
		private var func:Function;
		private var vars:Array = [];
		
		/**
		 * Constructor
		 * 
		 * @param	$target			a reference to a movie clip or object
		 * @param	$func
		 * @param	$vars
		 * @param	$mouseEvent
		 */
		public function Button( $target:Object , $func:Function , $vars:* = null , $mouseEvent:String = '' ) {
			if ($target == null) { return; }
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');	
			
			this.func = $func;
			if (typeof ($vars) == 'object') {
				this.vars = $vars || [];
			} else {
				this.vars.push ($vars)
			}
			
			var _btn_mc = $target;
			_btn_mc.buttonMode = true;	
			if ($mouseEvent == '') {
				_btn_mc.addEventListener (MouseEvent.CLICK, ButtonListener);
				//_btn_mc.addEventListener (MouseEvent.ROLL_OUT, ButtonListener);
			} else {
				_btn_mc.addEventListener (MouseEvent[$mouseEvent], ButtonListener);
			}
			
		}
		
		/////////////////////////////////////// Static ///////////////////////////////////////
		
		/**
		 * create a button with one function (onRelease/onRollover/onRollout)
		 * 
		 * @usage		import nl.matthijskamstra.utils.Button; //import
		 * 				Button.allInOne ( btn_mc, btnFunction, 'infoBtn');
		 * @param	$target		a reference to a movie clip or object
		 * @param	$func		call this function when rollover/rollout/release the button. 
		 * @param	$vars		blabla
		 * @return		button
		 */
		static public function create ($target:Object , $func:Function , $vars:* = null , $mouseEvent:String = '' ):Button {
			return new Button($target, $func, $vars , $mouseEvent);
		}
		static public function onRelease ($target:Object , $func:Function , $vars:*=null ):Button {
			return new Button($target, $func, $vars , 'CLICK');
		}
		static public function onRollover ($target:Object , $func:Function , $vars:*= null ):Button {
			return new Button($target, $func, $vars , 'ROLL_OVER');
		}
		static public function onRollout ($target:Object , $func:Function , $vars:*= null ):Button {
			return new Button($target, $func, $vars , 'ROLL_OUT');
		}
		
		/**
		 * create a button with one function (onRelease/onRollover/onRollout)
		 * 
		 * @usage		import nl.matthijskamstra.utils.Button; //import
		 * 				Button.allInOne ( btn_mc, btnFunction, 'infoBtn');
		 * @param	$target		a reference to a movie clip or object
		 * @param	$func		call this function when rollover/rollout/release the button. 
		 * @param	$id			use to create uniq feedback to $func
		 * @return		button
		 */
		static public function allInOne ($target:Object , $func:Function , $id:String = null):Button {
			if ($id == null) {
				$id = $target.name.toString().split('_')[0];
			}
			var btn:Button = new Button ($target, $func, $id + '_OnRelease' , 'CLICK');
			btn = new Button ($target, $func, $id + '_OnRollover' , 'ROLL_OVER');
			btn = new Button ($target, $func, $id + '_OnRollout' , 'ROLL_OUT');
			return btn;
		}
		
		/////////////////////////////////////// Listener ///////////////////////////////////////
		
		private function ButtonListener(e:MouseEvent):void {
			this.func.apply(null, vars);
		}

		
	} // end class
	
} // end package
