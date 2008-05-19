/**
* ConfigFile (AS3), version 1.0
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
* @class  	: 	ConfigFile
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	4-12-2007 17:33 
* 
*/
package nl.matthijskamstra.config {
	
	import flash.display.MovieClip;	
	import flash.display.StageQuality;

	public class ConfigFile extends MovieClip {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.config.ConfigFile;
		public static var CLASS_NAME : String = "ConfigFile";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.config.ConfigFile";
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.config.ConfigFile; // import
		*			var __ConfigFile__ : ConfigFile = new ConfigFile ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function ConfigFile( $targetObj:Object = null ) {
			// trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			$targetObj.stage.quality = StageQuality.BEST;
			$targetObj.stage.scaleMode = "noScale";
			$targetObj.stage.showDefaultContextMenu = false;
			$targetObj.stage.align = "TL";
		}
		
		/**
		* static function config.... same as above
		*
		* @usage  	nl.matthijskamstra.config.ConfigFile.config(this);
		* 			ConfigFile.config (this);
		* @param	$targetObj		a reference to a movie clip or object	
		*/
		static public function config ($targetObj:Object ) : void {
			var __config = new nl.matthijskamstra.config.ConfigFile ($targetObj);
		}
		
	} // end class
	
} // end package
