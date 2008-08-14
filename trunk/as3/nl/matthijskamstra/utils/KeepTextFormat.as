/**
* KeepTextFormat (AS3), version 1.0
*
* change a pre formed (textfield made in Flash IDE)
* think spacing, interlin
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
* @class  	: 	KeepTextFormat
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	28-7-2008 17:20 
* 
* Changelog:
*
* 		v 1.0 [28-7-2008 17:20] - Initial release
*
*/
package nl.matthijskamstra.utils {
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class KeepTextFormat {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.KeepTextFormat;
		public static var CLASS_NAME : String = "KeepTextFormat";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.KeepTextFormat";
		// vars
		
		/**
		* Constructor
		*/
		public function KeepTextFormat( ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		}
		
		//////////////////////////////////////// static ////////////////////////////////////////				
		
		/**
		* initKeepTextFormat used to jumpstart everything
		* 
		* @usage   	import nl.matthijskamstra.utils.KeepTextFormat; // import
		*			KeepTextFormat.initKeepTextFormat( foobar_txt, 'tsxt');
		 * @param	$targetTextField		textfield that content needs to change
		 * @param	$content				content of the text field
		 */
		static public function initKeepTextFormat( $targetTextField:TextField , $content:String):void {
			//trace( "KeepTextFormat.initKeepTextFormat > $targetTextField : " + $targetTextField );
			var useTextField:TextField = $targetTextField;
			var storeTextFormat:TextFormat  = useTextField.getTextFormat();
			useTextField.text = $content;
			// TextFormat
			var format:TextFormat = storeTextFormat;
			useTextField.setTextFormat(format);
		}
		
		static public function formatReturn ($targetTextField:TextField ):TextFormat {
			var storeTextFormat:TextFormat = $targetTextField.getTextFormat();
			return (storeTextFormat)
		}
		
	} // end class
	
} // end package
