/**
 * nl.matthijskamstra.draw.RectangleSimple, Version 1.1
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
 * @version 1.1
 * @since   Fri Apr 21 11:32:17 2006
 */
class nl.matthijskamstra.draw.RectangleSimple {
	
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.draw.RectangleSimple;
	public static var LINKAGE_ID:String = "nl.matthijskamstra.draw.RectangleSimple";
	
	//
	// default values
	private var defaultColor:Number = 0xFF3333;
	
	// Default color: red
	//
	/**
	 * RectangleSimple
	 * Side AB(width) can be different from side BC (height).
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
	 * @example		var rec = new nl.matthijskamstra.draw.RectangleSimple (_root.rectangle_mc , 30 , 20 , 0xFFFFFF)
	 * 				var rec = new nl.matthijskamstra.draw.RectangleSimple (_root.rectangle_mc , 30 , 20 )
	 *
	 * @param   	$target_mc		specifies reference to the movie clip Timeline.
	 * @param   	$width			side (horizontal side) in pixels.
	 * @param   	$height			side (vertical side) in pixels.
	 * @param   	$color			hexadecimal representation of the RGB value for a Color object (0xFF3333)
	 */
	function RectangleSimple($target_mc:MovieClip, $width:Number, $height:Number, $color:Number){
		if ($target_mc == null) { return;  }
		if($width == null) { return;  }
		if($height == null) { return;  }
		if($color == null){ $color = this.defaultColor;}
		//
		var container_mc:MovieClip = $target_mc.createEmptyMovieClip("container_mc", $target_mc.getNextHighestDepth());
		container_mc.beginFill($color);
		container_mc.moveTo(0, 0);
		container_mc.lineTo($width, 0);
		container_mc.lineTo($width, $height);
		container_mc.lineTo(0, $height);
		container_mc.lineTo(0, 0);
		container_mc.endFill();
	}
	
	
	/**
	 * 
	 * @usage 		import nl.matthijskamstra.draw.RectangleSimple 
	 * 				var rect:MovieClip = RectangleSimple.setRectangle (_root.rectangle_mc , 30 , 20 , 0xFFFFFF)
	 * 
	 * @param   	$target_mc		specifies reference to the movie clip Timeline.
	 * @param   	$width			side (horizontal side) in pixels.
	 * @param   	$height			side (vertical side) in pixels.
	 * @param   	$color			hexadecimal representation of the RGB value for a Color object (0xFF3333)
	 * @return
	 */
	static public function setRectangle ($target_mc:MovieClip, $width:Number, $height:Number, $color:Number):MovieClip {
		new RectangleSimple ($target_mc , $width , $height , $color);
		return ($target_mc.container_mc);
	}
	
}
