/**
* Angle (AS3), version 1.0
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
* @class  	: 	Angle
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	22-1-2008 22:05 
* 
*/
package nl.matthijskamstra.math {

	public class Angle {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.math.Angle;
		public static var CLASS_NAME : String = "Angle";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.math.Angle";
		
		/**
		* Constructor
		*/
		public function Angle(  ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		}
		
		/**
		 * Converts an angle from radians to degrees
		 * @param	$angleRadian	A number representing the angle in radians
		 * @return					The angle in degrees
		 */
		public static function toDegree ($angleRadian:Number):Number {
			var degrees:Number = $angleRadian / (Math.PI / 180); 
			// degrees = radians * 180/Math.PI
			return (degrees); 
		}
		
		/**
		 * Converts an angle from degrees to radians.
		 * @param	$angleInDegree	A number representing the angle in dregrees
		 * @return					The angle in radians
		 */
		public static function toRadian ($angleInDegree:Number):Number {
			var radians:Number = $angleInDegree * Math.PI / 180;
			//radians = degrees * Math.PI/180
			return (radians); 
		}
		
	} // end class
	
} // end package
