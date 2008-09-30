

/**
 *
 * nl.matthijskamstra.Debug.Debug, version 1.0
 *
 * Explanation:
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
 * Copyright 2006 Matthijs C. Kamstra [mck] - All Rights Reserved
 *
 * </pre>
 *
 *
 * @author 		Matthijs C. Kamstra [mck]
 * @version 	1.0
 * @since		Fri Apr 21 12:44:55 2006
 *
 */
class nl.matthijskamstra.debug.Debug {
	
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.debug.Debug;
	public static var LINKAGE_ID:String = "nl.matthijskamstra.debug.Debug";
	
	//
	/**
	 * constructor
	 *
	 */
	function Debug(){
		// statement
	}
	
	
	/**
	 * Enter description here
	 *
	 * @usage   	var cdtf = new nl.matthijskamstra.debug.Debug()
	 * 				cdtf.createDebugTextField (50, 50);
	 * @param   xPos 	x postion in pixels
	 * @param   yPos 	y postion in pixels
	 */
	public function createDebugTextField(xPos:Number, yPos:Number , $content:String):Void {
		//trace( "Debug.createDebugTextField > xPos : " + xPos + ", yPos : " + yPos );
		if (xPos == null) { xPos = 0; }
		if (yPos == null) { yPos = 0;	}
		var debugContainer_mc:MovieClip = _root.createEmptyMovieClip("debugContainer_mc", _root.getNextHighestDepth());
		var debug_txt = debugContainer_mc.createTextField("debug_txt", debugContainer_mc.getNextHighestDepth(), 0, 0, 300, 300);
		// setup txt
		debug_txt.autoSize = true;
		debug_txt.selectable = true;
		debug_txt.border = true;
		debug_txt.background = true;
		debug_txt.backgroundColor = 0xFFFFFF;
		if ($content == undefined){
			debug_txt.text = "debug window" + newline;
		} else {
			debug_txt.text = "debug window" + newline + "[" +getTimer()+ "] - " +  $content + newline;
		}
		var my_fmt:TextFormat = new TextFormat();
		my_fmt.bold = false;
		my_fmt.color = 0xFF3333;
		my_fmt.size = 12;
		my_fmt.font = "_sans";
		debug_txt.setTextFormat(my_fmt);
		// container
		debugContainer_mc._x = xPos;
		debugContainer_mc._y = yPos;
		debugContainer_mc.onRelease = function(){
			if(_root.debugContainer_mc.getDepth() != _root.getNextHighestDepth() - 1){
				_root.debugContainer_mc.swapDepths(_root.getNextHighestDepth());
			}
		};
	}
	
	
	/**
	 * send data to debug_txt in the _root
	 *
	 * @usage 	nl.matthijskamstra.debug.Debug.trace ("test");
	 * @param   	$content		a string send to the debug window
	 */
	static function trace($content:String):Void {
		//trace( "Debug.trace > $content : " + $content );
		var debug_txt = _root.debugContainer_mc.debug_txt;
		if (_root.debugContainer_mc._name == undefined) {
			var cdtf = new nl.matthijskamstra.debug.Debug()
			cdtf.createDebugTextField (10,10,$content);
		}
		if (_root.debugContainer_mc.getDepth() != _root.getNextHighestDepth() - 1) {
			_root.debugContainer_mc.swapDepths(_root.getNextHighestDepth());
		}
		debug_txt.text += "[" +getTimer()+ "] - " + $content + newline;
		// setup txt
		debug_txt.autoSize = true;
		debug_txt.selectable = true;
		debug_txt.border = true;
		debug_txt.background = true;
		debug_txt.backgroundColor = 0xFFFFFF;
		var my_fmt:TextFormat = new TextFormat();
		my_fmt.bold = false;
		my_fmt.color = 0xFF3333;
		my_fmt.size = 12;
		my_fmt.font = "_sans";
		debug_txt.setTextFormat(my_fmt);
	}
	
} // end class
