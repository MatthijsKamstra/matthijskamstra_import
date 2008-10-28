 /**
*
* nl.matthijskamstra.Polygon, version 0.1
*
* Explanation:
* Scalable Vector Graphics (SVG)
* - w3.org		-	<polygon fill="red" stroke="blue" stroke-width="10" points="350,75  379,161 469,161 397,215 423,301 350,250 277,301 303,215 231,161 321,161" />
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

* @author  Matthijs C. Kamstra [mck]
* @version 1.0
* @since   Fri Apr 21 00:04:36 2006
*/
class nl.matthijskamstra.Draw.Polygon
{
	// default appearance
	private var fill : Array = new Array (0x3333FF, 100);
	private var stroke : Array = new Array (1, 0xFF3333, 100);
	private var points : Array;
	/**
	*
	* @param	target_mc	a reference to the root movie clip Timeline
	* @param	_stroke		array with [thickness in pixels, color, alpha] used in .lineStyle
	* @param	_fill		array with [color, alpha] used in .beginFill
	* @param	_points		array of points measured in pixels
	*/
	function Polygon (target_mc : MovieClip, _stroke : Array, _fill : Array, points : Array)
	{
		drawPolygon (target_mc , _stroke , _fill, points);
	}
	/**
	* drawPolygon
	*
	* @param	target_mc	a reference to the root movie clip Timeline
	* @param	stroke		array with [thickness in pixels, color, alpha] used in .lineStyle
	* @param	fill		array with [color, alpha] used in .beginFill
	* @param	points		array of points measured in pixels
	*/
	function drawPolygon (target_mc : MovieClip, stroke : Array, fill : Array, points : Array)
	{
		if (target_mc == undefined)
		{
			return;
		};
		if (points == undefined)
		{
			//trace ("Draw.Polygon.drawPolygon: No points were used to create a polygon");
			return;
		};
		//trace ("function drawPolygon (" + target_mc + " : MovieClip, " + stroke + ": Array, " + fill + ": Array, " + points + " : Array)");
		target_mc.lineStyle (stroke [0] , stroke [1] , stroke [2]);
		target_mc.beginFill (fill [0] , fill [1]);
		target_mc.moveTo (points [0][0] , points [0][1]);
		for (var i = 1; i < points.length; i ++)
		{
			target_mc.lineTo (points [i][0] , points [i][1]);
		}
		target_mc.endFill ();
	}
}
