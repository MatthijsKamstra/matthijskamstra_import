/**
* @class : 		DisplayObjectList
* @author :  	Matthijs C. Kamstra [mck]
* @since :		7-12-2007 12:34 
*/
package nl.matthijskamstra.utils {
	
	public class DisplayObjectList {
		
		// Constants:
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.DisplayObjectList";
		// vars
		/**
		* Constructor
		* @usage   	import nl.matthijskamstra.utils.DisplayObjectList; // import
		*			var __DisplayObjectList__ : nl.matthijskamstra.utils.DisplayObjectList = new nl.matthijskamstra.utils.DisplayObjectList ();
		*/
		public function DisplayObjectList(   ) {
			trace ( LINKAGE_ID + ' class instantiated');
		}
		/**
		 * import nl.matthijskamstra.utils.DisplayObjectList
		 * DisplayObjectList.getList ($loadingMovie)
		 * @param	$target_mc
		 * @param	$tab
		 */
		public static function getList ($target_mc:* , $tab:String = ''):void {
			// $target_mcis a DisplayObject
			trace ('\t[' + $tab + '+ number of DisplayObject: ' + $target_mc.numChildren + '  ================================================');
			for (var i:uint = 0; i < $target_mc.numChildren; i++){
				trace ('\t|' + $tab + ' \t|\t ' +i+'.\t name:' + $target_mc.getChildAt(i).name + '\t type:' + typeof ($target_mc.getChildAt(i))+ '\t' + $target_mc.getChildAt(i));
				if ($target_mc.numChildren == 1 || $target_mc.getChildAt(i).toString () == '[object TextField]' || $target_mc.getChildAt(i).toString () == '[object Shape]' || $target_mc.getChildAt(i).toString () == '[object StaticText]' ) {
					//return;
				}else{
					DisplayObjectList.getList ($target_mc.getChildAt(i) , $tab + '\t');
				}
			}
			//trace ('\t[' + $tab + '+ ---------------------------------------------------------------------------');
		}
		
		/**
		 * import nl.matthijskamstra.utils.DisplayObjectList
		 * DisplayObjectList.getCurrentLevelList ($loadingMovie)
		 * @param	$target_mc
		 * @param	$tab
		 */
		public static function getCurrentLevelList ($target_mc:* , $tab:String = ''):void {
			// $target_mc is a DisplayObject
			trace ('>\t' + $tab + '+ ' + $target_mc.toString() + ' >> number of DisplayObject: ' + $target_mc.numChildren + '  ================================================');
			for (var i:uint = 0; i < $target_mc.numChildren; i++) {
				if ($target_mc.getChildAt(i) != null){
					trace ('\t|' + $tab + ' \t ' +i+'.\t name:' + $target_mc.getChildAt(i).name + '\t type:' + typeof ($target_mc.getChildAt(i))+ '\t' + $target_mc.getChildAt(i));
				} else {
					trace ('\t|' + $tab + ' \t ' +i+'.\t name:' + $target_mc.getChildAt(i) + '\t type:' + typeof ($target_mc.getChildAt(i))+ '\t' + $target_mc.getChildAt(i));
				}
			}
		}
		
		/**
		 * import nl.matthijskamstra.utils.DisplayObjectList
		 * DisplayObjectList.getList ($loadingMovie)
		 * @param	$target_mc
		 * @param	$tab
		 */
		public static function simpleList ($target_mc:* , $tab:String = ''):void {
			// $target_mcis a DisplayObject
			if ($tab == '') { trace ('------------------------------------------------------------------------------'); }
			trace ( $tab + '+ '+  $target_mc.name + ' (number of DisplayObject: ' + $target_mc.numChildren +') ');
			for (var i:uint = 0; i < $target_mc.numChildren; i++){
				var folderIcon:String = '+';
				if ($target_mc.getChildAt(i).numChildren > 1) { folderIcon = '|'; }
				//trace( "folderIcon : " + folderIcon );
				trace( "$target_mc.getChildAt(i).numChildren : " + $target_mc.getChildAt(i).numChildren );
				
				if ($target_mc.getChildAt(i).toString () == '[object TextField]') {
					trace( "$target_mc.getChildAt(i).toString () : " + $target_mc.getChildAt(i).toString () );
				}else {
					if ($target_mc.getChildAt(i).numChildren > 1) { 
						DisplayObjectList.simpleList ($target_mc.getChildAt(i) , '\t');
					}
				} 
				trace ( $tab + '\t' + folderIcon + ' ('+ i +') ' + $target_mc.getChildAt(i).name + '\t type:' + typeof ($target_mc.getChildAt(i))+ '\t' + $target_mc.getChildAt(i));
			}
			if ($tab == '') { trace ('------------------------------------------------------------------------------'); }
		}
		
	} // end class
	
} // end package
