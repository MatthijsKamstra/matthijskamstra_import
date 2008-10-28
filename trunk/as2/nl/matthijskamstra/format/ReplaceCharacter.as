

/**
 *
 * ClassName, version 1.0
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
 * @author  	Matthijs C. Kamstra [mck]
 * @version 	1.0
 * @since		Mon Jan 08 17:25:07 2007
 *
 */
class nl.matthijskamstra.format.ReplaceCharacter {
	
	//
	function ReplaceCharacter(_string:String){
		if(_string == null){
			return;
		}
		//		changeString ( _string );
	}
	
	
	/**
	 * Clean XML document up from tabs, enters, linebreaks and extra spaces
	 *
	 * @usage   var rrf = new nl.matthijskamstra.format.ReplaceCharacter ();
	 * 			var cleanXml = rrf.cleanXML (format_xml);
	 *			trace('cleanXml: ' + cleanXml.firstChild.childNodes.length);
	 *
	 * @param   _xml 	xml document
	 * @return  		cleaned up xml
	 */
	public function cleanXML(_xml:XML):XML{
		var tempReturnXML = new XML(changeString(_xml.toString()));
		return (tempReturnXML);
	}
	
	
	/**
	 * changeString
	 * @usage
	 *
	 * @param   _string 	replacing/removing/changing this string
	 * @return
	 */
	public function changeString(_string:String):String{
		var charactersToChange:Array = [["&gt;", ">"], ["&lt;", "<"], ["&amp;", "&"], ["&apos;", "'"], ["&quot;", "\""], ["\r", ""], ["\n", ""], ["\t", ""], ["   ", ""]];
		for(var i = 0; i < charactersToChange.length; i++){
			_string = _string.split(charactersToChange[i][0]).join(charactersToChange[i][1]);
		}
		// trace('_string: ' + typeof (_string))
		return _string;
	}
	
	/**
	 * 
	 * @param	$content
	 * @return
	 */
	public function escapeHTML ($content:String):String {
		var changeArray:Array = [	["&gt;", ">"], 
									["&lt;", "<"], 
									["&amp;", "&"], 
									["&apos;", "'"], 
									["&quot;", "\""]
								];
		for(var i = 0; i < changeArray.length; i++){
			$content = $content.split(changeArray[i][0]).join(changeArray[i][1]);
		}
		// trace('_string: ' + typeof (_string))
		return $content;
	}
	
	/**
	* replaceAHREF
	* @usage   	var rrf = new nl.matthijskamstra.format.ReplaceCharacter ();
	* 			var _replaceAHREF:replaceAHREF = rrf.replaceAHREF("<a href='http://www.foobar.nl/'>link</a>");
	*			trace('_replaceAHREF: ' + _replaceAHREF); // output "test"
	* 
	* @param	$content
	* @param	$linkColor
	* @param	$func
	* @return
	*/
	public function replaceAHREF ($content:String , $linkColor:String, $func ):String {
		if ($content == null) { return; }
		if ($linkColor == null) { $linkColor = "#FF3333"; }
		//if ($func == null) { return; }
		
		var charactersToChange : Array = [
										["&gt;", ">"], 
										["&lt;", "<"], 
										["&amp;", "&"], 
										["&apos;", "'"], 
										["&quot;", "\""],
										["'>", "'>"] ,
										["\">", "'>"] ,
										//["<a href='" , "<font color='" + $linkColor + "'><u><a href='asfunction:" + $func + "',"] ,
										["<a href='" , "<font color='" + $linkColor + "'><u><a href='"] ,
										["<a href=\"", "<font color='" + $linkColor + "'><u><a href='"] ,
										//["<a href=\"", "<font color='" + $linkColor + "'><u><a href='asfunction:" + $func + "',"] ,
										["</a>", "</a></u></font>"] 
										];
		for (var i = 0; i < charactersToChange.length; i ++) {
			$content = $content.split (charactersToChange [i][0]).join (charactersToChange [i][1]);
		}
		return $content;
	}
	
	//////////////////////////////////////// static ////////////////////////////////////////
	
	/**
	 * 
	 * @param	$content
	 * @return
	 */
	static public function escape ($content:String):String {
		var myReplaceCharacter :ReplaceCharacter = new ReplaceCharacter()
		var temp:String = myReplaceCharacter.escapeHTML ($content);
		return temp;
	}
	
	/**
	 * 
	 * @param	$content
	 * @return
	 */
	static public function ahref ($content:String , $linkColor:String, $func):String {
		var myReplaceCharacter :ReplaceCharacter = new ReplaceCharacter()
		var temp:String = myReplaceCharacter.replaceAHREF ($content , $linkColor, $func);
		return temp;
	}	
	
	
}
