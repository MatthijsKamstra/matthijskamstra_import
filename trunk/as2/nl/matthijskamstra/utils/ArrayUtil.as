/* 
 * ArrayUtil, version 1.0
 *
 * Stuff you can do to an array
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
 * @class : 	ArrayUtil
 * @author :  	Matthijs C. Kamstra [mck]
 * @version:
 *		r1.0 - class creation
 *		r1.1 -
 * @since :		28-10-2008 13:28 
 * 
 */

class nl.matthijskamstra.utils.ArrayUtil {
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.utils.ArrayUtil;
	public static var CLASS_NAME : String = "ArrayUtil";
	public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.ArrayUtil";
	
	/**
	* Constructor
	*/
	public function ArrayUtil( )  {	}
		
	/**
	 * randomize the array
	 * 
	 * @param	$array 		a array to shuffle
	 * @return		randomized NEW array (original array is unmodified)
	 */
	static public function randomise($array:Array):Array {
		var randomArray:Array = [];
		var arrayLength:Number = $array.length;
		for(var i=0; i < arrayLength; i++){
			var randomNumber:Number = Math.floor(Math.random() * ($array.length));
			randomArray[i] = $array.splice(randomNumber,1);
		}
		return randomArray;
	}
	
	/**
	* Shuffles (modifies original) array 
	* 
	* @usage		import nl.matthijskamstra.utils.ArrayUtil;
	* 				var tmpArray:Array = [1,2,3,4]; 	trace( "tmpArray : " + tmpArray );
	* 				ArrayUtil.shuffle (tmpArray); 		trace( "shuffle-tmpArray : " + tmpArray );
	* @param	$array	an array to shuffle (modifies original)
	*/
	static function shuffle($array:Array) {
		var i = $array.length;
		while (i) {
			var p = random(i);
			var t = $array[--i];
			$array[i] = $array[p];
			$array[p] = t;
		}
	}
	

} // end class

