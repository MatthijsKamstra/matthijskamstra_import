

/**
 * nl.matthijskamstra.draw.RectangleSimple, Version 1.0
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
 * @author Matthijs C. Kamstra [mck]
 * @version 1.0
 * @since   Fri Apr 21 11:32:17 2006
 */
class nl.matthijskamstra.draw.RectangleSimple {
	
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.draw.RectangleSimple;
	public static var LINKAGE_ID:String = "nl.matthijskamstra.draw.RectangleSimple";
	
	//
	// default values
	private var _color:Number = 0xFF3333;
	
	// Default color: red
	//
	/**
	 * RectangleSimple
	 * Side AB can be different from side BC.
	 *
	 * <pre>
	 *  _________AB_________
	 * |                    |
	 * |                    |
	 * BC                   BC
	 * |                    |
	 * |                    |
	 * |_________AB_________|
	 *
	 * </pre>
	 *
	 * @example		var rec = new nl.matthijskamstra.mediaPlayer.RectangleSimple (_root.rectangle_mc , 30 , 20 , 0xFFFFFF)
	 * 				var rec = new nl.matthijskamstra.mediaPlayer.RectangleSimple (_root.rectangle_mc , 30 , 20 )
	 *
	 * @param   	target_mc	Specifies reference to the movie clip Timeline.
	 * @param   	ab			Side (horizontal side) in pixels.
	 * @param   	bc			Side (vertical side) in pixels.
	 * @param   	_color		hexadecimal representation of the RGB value for a Color object (0xFF3333)
	 */
	function RectangleSimple(target_mc:MovieClip, ab:Number, bc:Number, _color:Number){
		if (target_mc == null) { return;  }
		if(ab == null) { return;  }
		if(bc == null) { return;  }
		if(_color == null){
			_color = this._color;
		}
		//
		var container_mc:MovieClip = target_mc.createEmptyMovieClip("container_mc", target_mc.getNextHighestDepth());
		container_mc.beginFill(_color);
		container_mc.moveTo(0, 0);
		container_mc.lineTo(ab, 0);
		container_mc.lineTo(ab, bc);
		container_mc.lineTo(0, bc);
		container_mc.lineTo(0, 0);
		container_mc.endFill();
	}
	
	static public function setRectangle (target_mc:MovieClip, ab:Number, bc:Number, _color:Number):MovieClip {
		new RectangleSimple (target_mc , ab , bc , _color);
		return (target_mc.container_mc);
	}
	
}
