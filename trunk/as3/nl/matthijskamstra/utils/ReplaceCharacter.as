/**
* ReplaceCharacter (AS3), version 1.0
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
* @class  	: 	ReplaceCharacter
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	8-5-2008 11:40 
* 
* Changelog:
*
* 		v1.0 [8-5-2008 11:40] - Initial release
*
*/
package nl.matthijskamstra.utils {
	
	import flash.display.*;
	import flash.events.*;	

	public class ReplaceCharacter {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.ReplaceCharacter;
		public static var CLASS_NAME : String = "ReplaceCharacter";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.ReplaceCharacter";
		// vars
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.utils.ReplaceCharacter; // import
		*			var __ReplaceCharacter:ReplaceCharacter = new ReplaceCharacter ( this );
		* @param	$txt		string that needs some modification
		*/
		public function ReplaceCharacter( $txt:String=null ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $txt == null ) { return; } ;
		}
		
		
		/**
		* change 1 character in another
		* 
		* @usage		import nl.matthijskamstra.utils.ReplaceCharacter; // import
		* 				var __ReplaceCharacter:ReplaceCharacter = new ReplaceCharacter ( this );
		*				__ReplaceCharacter.replaceString ('bla bla <br/> bla bla' , ['bla' ,'hi']); // return 'hi hi <br/> hi hi'
		* @param	$txt					replacing/removing/changing this string
		* @param	$replacementArray		use an array to change characters in (change '<br>' into '\r' ::['<br>' ,'\r'] )
		* @return		modified string (characters replaced)
		*/
		public function replaceString ($txt:String , $replacementArray:Array):String {
			var charactersToChange : Array = $replacementArray
			for (var i = 0; i < charactersToChange.length; i ++) {
				$txt = $txt.split (charactersToChange [0]).join (charactersToChange [1]);
			}
			return $txt;
		}
		
		/**
		* changeString
		* @usage
		* @param   $txt 	replacing/removing/changing this string
		* @return	stripped string
		*/
		public function changeString ($txt:String):String {
			var charactersToChange : Array = 	[["&gt;", ">"] ,
												["&lt;", "<"] ,
												["&amp;", "&"] ,
												["&apos;", "'"] ,
												["&quot;", "\""] ,
												["\r", ""] ,
												["\n", ""] ,
												["\t", ""] ,
												["   ", ""]];
			for (var i = 0; i < charactersToChange.length; i ++) {
				$txt = $txt.split (charactersToChange [i][0]).join (charactersToChange [i][1]);
			}
			// trace('$txt: ' + typeof ($txt))
			return $txt;
		}
		//////////////////////////////////////// static ////////////////////////////////////////		
		
		/**
		* change 1 character in another
		* 
		* @usage		import nl.matthijskamstra.utils.ReplaceCharacter; // import
		*				ReplaceCharacter.stringWithArray ('bla bla <br/> bla bla' , ['bla' ,'hi']); // return 'hi hi <br/> hi hi'
		* @param	$txt					replacing/removing/changing this string
		* @param	$replacementArray		use an array to change characters in (change '<br>' into '\r' ::['<br>' ,'\r'] )
		* @return		modified string (characters replaced)
		*/
		static public function stringWithArray ($txt:String , $replacementArray:Array):String {
			var rc:ReplaceCharacter = new ReplaceCharacter ();
			return rc.replaceString ($txt , $replacementArray);
		}
		
		//////////////////////////////////////// Listener ////////////////////////////////////////
		
		
	} // end class
	
} // end package
