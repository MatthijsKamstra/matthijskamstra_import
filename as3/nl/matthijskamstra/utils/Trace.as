/**
* @class : 		TraceObject
* @author :  	Matthijs C. Kamstra [mck]
* @since :		13-2-2008 11:52 
*/
package nl.matthijskamstra.utils {
	
	public class Trace {
		
		// Constants:
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.TraceObject";
		// vars
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.utils.TraceObject; // import
		*			var __TraceObject__ : nl.matthijskamstra.utils.TraceObject = new nl.matthijskamstra.utils.TraceObject ();
		*/
		public function Trace ( $object:Object ) {
			
		}
		/**
		 * 
		 * @param	$object
		 * @param	$id
		 */
		static public function useObject ( $object:Object, $id:String = '') {
			trace ("// trace object "+$id+" -------------------------------------- ");
			for ( var x:String in $object) {
				trace( "\t-\t key : " + x + ", value : " + $object[x] + ", typeof : " + typeof ($object[x]));
				for ( var y:String in $object[x] ) {
					trace( "\t\t|\t key : " + y + ", value : " + $object[x][y] + ", typeof : " + typeof ($object[x][y]));
				}
			}
			trace ("// end trace object "+$id+" -------------------------------------- ");
		}
	} // end class
	
} // end package
