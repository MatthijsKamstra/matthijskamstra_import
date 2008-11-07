/**
* BooleanUtils (AS3), version 1.0
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
* @class  	: 	BooleanUtils
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	8-9-2008 14:19 
* 
* Changelog:
*
* 		v 1.0 [8-9-2008 14:19] - Initial release
*
*/
package nl.matthijskamstra.utils {
	
	public class BooleanUtils {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.BooleanUtils;
		public static var CLASS_NAME : String = "BooleanUtils";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.BooleanUtils";
		// vars
		
		/**
		* Constructor
		*/
		public function BooleanUtils( ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		}
		
		
		//////////////////////////////////////// static ////////////////////////////////////////		
		
		/**
		 * @usage	import nl.matthijskamstra.utils.BooleanUtils;
		 * 			var temp:Boolean = BooleanUtils.stringToBoolean ('true');
		 * @param	$string
		 * @return		a string onverted to a boolean
		 */
		public static function stringToBoolean($string:String):Boolean {
			return ($string.toLowerCase() == "true" || $string.toLowerCase() == "1");
		}


		
		//////////////////////////////////////// Listener ////////////////////////////////////////
		
		
	} // end class
	
} // end package
