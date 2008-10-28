 /**
*
*
* To access and manipulate information about the boundaries of a SWF file.
*
* <pre>
*  ____                   _      ____
* |  __| _ __ ___    ___ | | __ |__  |
* | |   | '_ ` _ \  / __|| |/ /    | |
* | |   | | | | | || (__ |   <     | |
* | |__ |_| |_| |_| \___||_|\_\  __| |
* |____|                        |____|
*
* Copyright 2006 Matthijs C. Kamstra [mck] - All Rights Reserved
*
* </pre>
*
*
* @author Matthijs C. Kamstra [mck]
* @version 1.0
* @since   Wed Apr 19 23:53:48 2006
*/
class nl.matthijskamstra.utils.ConfigFile
{
	/**
	* Constructor 
	* 
	* To access and manipulate information about the boundaries of a SWF file.
	* 
	*/
	public function ConfigFile ()
	{
		// trace ("set flash to 'browser'-mode");
		_root._quality = "BEST";
		Stage.scaleMode = "noScale";
		Stage.showMenu = false;
		Stage.align = "TL";
	}
	/**
	* static function utils.... same as above
	*
	* @usage   nl.matthijskamstra.utils.ConfigFile.config ();
	*/
	static function config () : Void
	{
		var temp = new nl.matthijskamstra.utils.ConfigFile ();
	}
}
