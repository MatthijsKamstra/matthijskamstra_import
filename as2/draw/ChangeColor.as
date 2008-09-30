 /**
*
* nl.matthijskamstra.draw.ChangeColor, version 1.0
*
* Simple to change the color of a movieClip
*
*
* <pre>
*  ____                   _      ____
* |  __| _ __ ___    ___ | | __ |__  |
* | |   | '_ ` _ \  / __|| |/ /    | |
* | |   | | | | | || (__ |   <     | |
* | |__ |_| |_| |_| \___||_|\_\  __| |
* |____|                        |____|
*
* Copyright 2006 Fabrique [Matthijs C. Kamstra] - All Rights Reserved
*
* </pre>
*
*
* @author 		Matthijs C. Kamstra [mck]
* @version 		1.0
* @since
*
*/
class nl.matthijskamstra.draw.ChangeColor
{
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.draw.ChangeColor;
	public static var LINKAGE_ID : String = "nl.matthijskamstra.draw.ChangeColor";
	//
	/**
	* Enter description here
	*
	* @usage	var cc = new nl.matthijskamstra.draw.ChangeColor (this.movie_mc, 0xff3333)
	*
	* @param   target_mc 		root timeline
	* @param   color     		hex value color (example: 0xff3333)
	* @return
	*/
	function ChangeColor (target_mc : MovieClip , color : Number)
	{
		var my_color : Color = new Color (target_mc);
		my_color.setRGB (color);
	}
	/**
	* Enter description here
	*
	* @usage   nl.matthijskamstra.draw.ChangeColor.now (this.movie_mc, 0xff3333)
	* 
	* @param   target_mc 		root timeline
	* @param   color     		hex value color (example: 0xff3333)
	*/
 	static function now (target_mc : MovieClip , color : Number)
	{
		var cc = new nl.matthijskamstra.draw.ChangeColor (target_mc, color);
	}
}
