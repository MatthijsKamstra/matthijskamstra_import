/**
* Color (AS3), version 1.0
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
* @class  	: 	Color
* @author 	:  	Matthijs C. Kamstra [mck]
* @version :	1.0 - class creation (AS3)
* @since 	:	11-5-2008 0:22 
* 
*/
package nl.matthijskamstra.utils {
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.ColorTransform;

	public class Color {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.Color;
		public static var CLASS_NAME : String = "Color";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.Color";	
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.utils.Color; // import
		*			var __Color:Color = new Color ( this , 0xff33333);
		* @param	$targetObj		a reference to a movie clip or object
		* @param	$colorValue		hex value of the color: 0xff3333 is a red, don't forget '0x' before the hex value
		*/
		public function Color(   $targetObj:Object=null, $colorValue:uint = 0xff3333) {
			// trace ( LINKAGE_ID + ' class instantiated');
			if ($targetObj == null) { return; }
			var newColorTransform:ColorTransform = $targetObj.transform.colorTransform;
			newColorTransform.color = $colorValue;
			$targetObj.transform.colorTransform = newColorTransform;
		}
		
		//////////////////////////////////////// Static ///////////////////////////////////////
		
		
		/**
		* 
		* @usage   	import nl.matthijskamstra.utils.Color; // import
		*			Color.setRGB ( foobar_mc,  0xff33333);
		* @param	$targetObj		a reference to a movie clip or object
		* @param	$colorValue		hex value of the color: 0xff3333 is a red, don't forget '0x' before the hex value
		*/
		static public function setRGB(  $targetObj:Object = null, $colorValue:uint = 0xff3333) {
			return new Color ( $targetObj, $colorValue);			
		}
		
		// http://rosettastone.allen-poole.com/?subject=Raw_Code&center=Hex%20to%20Dec%20converter%20--%20AS3
		function getHex(i:uint):String{
			var hex:String = '';
			if(!i)return '#000000';
			while(hex.length < 6){
				var tmpS:String = '0';
				if((i%16) > 9){
					tmpS = String.fromCharCode((87 + i%16));
				} else if(i%16) {
					tmpS = String(i%16);
				}
				if (tmpS != 'null') hex += tmpS; 
				i -= i%16;
				i /=16;
			}
			var tmpA:Array = hex.split('');
			tmpA.reverse();
			hex = tmpA.join('');
			hex = '#'+hex;
			return hex.toUpperCase();
		}
		
	} // end class
	
} // end package
