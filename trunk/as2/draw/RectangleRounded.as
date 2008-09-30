 /**
*
* ClassName, version 1.0
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
* Copyright 2006 Fabrique [Matthijs C. Kamstra] - All Rights Reserved
*
* </pre>
*
*
* @author 		Matthijs C. Kamstra [mck]
* @version 		1.0
* @since		Fri May 26 09:53:18 2006
*
*/
class nl.matthijskamstra.Draw.RectangleRounded
{
	private var DEFAULTOFFSETX : Number = 0;
	private var DEFAULTOFFSETY : Number = 0;
	private var DEFAULTCURVE : Number = 0;
	private var DEFAULTALPHA : Number = 100;	// full alpha
	private var DEFAULTCOLOR : Number = 0x000000;	// black
	private var DEFAULTOUTLINESIZE : Number = 0;
	/**
	*
	* Draw a rectangle with or without a curve.
	* A rectangle with rounded corners
	* Default values are:
	* - offSetX = 0
	* - offSetY = 0
	* - curve = 0
	* - alpha = 100
	* - outlineSize = 0
	* Required values are:
	* - target_mc
	* - ab
	* - bc
	*
	* <pre>
	* +------------- ab -------------+
	* |                              |
	* |                              |
	* bc                             |
	* |                              |
	* |                              |
	* +------------------------------+
	* </pre>
	*
	*
	* @example 		new nl.beeldengeluid.mijnBeeldEnGeluid.Draw.RectangleRounded (_root, 20, 20, 100, 100, 10, 0xFF3333, 100, 0)
	* @example 		new nl.beeldengeluid.mijnBeeldEnGeluid.Draw.RectangleRounded (_root, 00, 00, 100, 100, 10);
	*
	* @param   target_mc 	a reference to the root movie clip timeline
	* @param   offSetX		the x coordinate of the top-left corner of the rectangle
	* @param   offSetY		the y coordinate of the top-left corner of the rectangle
	* @param   ab			the width of the rectangle in pixels
	* @param   bc			the heigth of the rectangle in pixels
	* @param   curve		the curve of the corners of the rectangle in pixels
	* @param   color		the hexadecimal or RGB color to be set (example 0xFF3333)
	* @param   alpha		the alpha transparency value of the movie clip (0 == transparant)
	* @param   outlineSize	the outline of the rectangle in pixels
	* @return
	*/
	public function RectangleRounded (	target_mc : MovieClip,
										offSetX : Number,
										offSetY : Number,
										ab : Number,
										bc : Number,
										curve : Number,
										color : Number,
										alpha : Number,
										outlineSize : Number)
	{
		if (target_mc == null){return;}
		if (ab == null){return;}
		if (bc == null){return;}
		if (offSetX == null){offSetX = DEFAULTOFFSETX;}
		if (offSetY == null){offSetY = DEFAULTOFFSETY;}
		if (curve == null){curve = DEFAULTCURVE;}
		if (alpha == null){alpha = DEFAULTALPHA;}
		if (color == null){color = DEFAULTCOLOR;}
		if (outlineSize == null){outlineSize = DEFAULTOUTLINESIZE;}

		var innerRectangleWidth : Number = ab - 2 * curve;
		var innerRectangleHeight : Number = bc - 2 * curve;
		var _curve : Number = curve;
		if (outlineSize != null)
		{
			_curve = curve + 1 * outlineSize;
		}
		var rectangleRounded_mc : MovieClip = target_mc.createEmptyMovieClip ("rectangleRounded_mc" , target_mc.getNextHighestDepth());
		with (rectangleRounded_mc)
		{
			beginFill (color);
			moveTo (1 * _curve, 0);
			lineTo (1 * _curve + innerRectangleWidth, 0);
			curveTo (2 * _curve + innerRectangleWidth, 0, 2 * _curve + innerRectangleWidth, _curve);
			lineTo (2 * _curve + innerRectangleWidth, 1 * _curve + innerRectangleHeight);
			curveTo (2 * _curve + innerRectangleWidth, 2 * _curve + innerRectangleHeight, 1 * _curve + innerRectangleWidth, 2 * _curve + innerRectangleHeight);
			lineTo (1 * _curve, 2 * _curve + innerRectangleHeight);
			curveTo (0, 2 * _curve + innerRectangleHeight, 0, 1 * _curve + innerRectangleHeight);
			lineTo (0, 1 * _curve);
			curveTo (0, 0, _curve, 0);
			endFill ();
		}
		rectangleRounded_mc._x = offSetX;
		rectangleRounded_mc._y = offSetY;
		rectangleRounded_mc._alpha = alpha;
	}
}
