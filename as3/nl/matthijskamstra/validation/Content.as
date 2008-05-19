/**
*
* Content, version 1.0
*
* Explanation
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
*
* @author  		Matthijs C. Kamstra [mck]
* @version 		1.1 (AS3)
* @since		18-2-2008 14:45
*
*/
package nl.matthijskamstra.validation { 

	public class Content
	{

		
		/**
		 * 
		 * @param	$content
		 * @param	$totalCharacters
		 * @param	$exclude
		 * @return
		 */
		static public function isContent ($content:String = '', $totalCharacters:uint = 0 , $exclude:String = '') : Boolean {
			if ($content == $exclude) { return false;}
			if ($content == '' ) {
				//trace ('\t|\t$content: "' + $content + '"');
				//trace ('\t|\t$content.length: ' + $content.length);
				//trace ('\t|\t$totalCharacters: ' + $totalCharacters);
				return false;
			} else {
				if ($content.length >= $totalCharacters && $content != " ") {
					return true;
				} else {
					return false;
				}
			}
		}
	}
	
}