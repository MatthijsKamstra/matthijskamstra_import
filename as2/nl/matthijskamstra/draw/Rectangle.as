﻿ /**
*
* nl.matthijskamstra.Rectangle, version 1.1
*
* Explanation:
*
* Scalable Vector Graphics (SVG)
* - illustrator	-	<rect id="CCCCCC_1_" x="1" y="1" fill="#D4D0C8" width="11" height="11"/>
* - w3.org		-	<rect x="400" y="100" width="400" height="200" fill="yellow" stroke="navy" stroke-width="10"  />
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
* @author  	Matthijs C. Kamstra [mck]
* @version 	1.1
* @see     	nl.matthijskamstra.Draw.Polygon
* @since  	Fri Apr 21 00:04:07 2006
* 
* 
* CHANGE LOG:
	1.1 static 
*/
class nl.matthijskamstra.Draw.Rectangle extends nl.matthijskamstra.Draw.Polygon
{
	// Array
	private var _$pointsArray : Array;
	// constructor
	function Rectangle ()	{
	}
	/**
	* drawRectangle
	* $pointsArray width / height
	*
	*
	* @param	target_mc	a reference to the root movie clip Timeline
	* @param	stroke		array with [thickness in pixels, color, alpha] used in .lineStyle
	* @param	fill		array with [color, alpha] used in .beginFill
	* @param	$pointsArray		2 points measured in pixels (two points, not more will be used) width and height
	*
	* @example	drawRectangle (_root , [0,0,0] , [0x00000 , 100] , [200,200])
	*/
	public function drawRectangle (target_mc : MovieClip, stroke : Array, fill : Array, $pointsArray : Array )	{
		trace ($pointsArray [0] + "  " + $pointsArray [1])
		if (target_mc == undefined){return;}
		// todo: fill [color, alpha]
		// if (alpha = undefined / null){ alpha =  100}
		_$pointsArray = [[0, 0] , [$pointsArray [0] , 0] , [$pointsArray [0] , $pointsArray [1]] , [0 , $pointsArray [1]] , [0, 0]];
		drawPolygon (target_mc , stroke , fill , _$pointsArray);
	}
	/**
	* drawCurvedRectangle
	*
	*
	* @example drawCurvedRectangle (_root, [0,0,0], [0xFF3333 , 100], [100 , 50], [10,10])
	*
	* @param	target_mc	a reference to the root movie clip Timeline
	* @param	stroke		array with [thickness in pixels, color, alpha] used in .lineStyle
	* @param	fill		array with [color, alpha] used in .beginFill
	* @param	$pointsArray		array of $pointsArray measured in pixels [width, height]
	* @param	curve		curve in x and y directions (two points, not more will be used)
	*/

	public function drawCurvedRectangle (target_mc : MovieClip, stroke : Array, fill : Array, $pointsArray : Array, _curve : Array){
		trace ('\rfunction drawCurvedRectangle (target_mc: ' + target_mc + ' , stroke: ' + stroke + ' , fill: ' + fill + ' , $pointsArray: ' + $pointsArray	+ ', _curve: ' + _curve);
		if (_curve [0] == undefined)
		{
			_curve [0] = _curve [1]
		}
		if (_curve [1] == undefined)
		{
			_curve [1] = _curve [0]
		}
		var _txtBoxWidth = $pointsArray [0][0] - (2 * _curve [0]);
		var _txtBoxHeight = $pointsArray [0][1] - (2 * _curve [1]);
		target_mc.lineStyle (stroke [0] , stroke [1] , stroke [2]);
		target_mc.beginFill (fill [0] , fill [1]);
		target_mc.moveTo ((1 * _curve [0]) , 0);
		target_mc.lineTo (((1 * _curve [0]) + _txtBoxWidth) , 0);
		// eerste _curve
		target_mc.curveTo (((2 * _curve [0]) + _txtBoxWidth) , 0, ((2 * _curve [0]) + _txtBoxWidth) , _curve [1]);
		target_mc.lineTo (((2 * _curve [0]) + _txtBoxWidth) , ((1 * _curve [0]) + _txtBoxHeight));
		// tweede _curve
		target_mc.curveTo (((2 * _curve [0]) + _txtBoxWidth) , ((2 * _curve [1]) + _txtBoxHeight) , (1 * _curve [0]) + _txtBoxWidth, (2 * _curve [1]) + _txtBoxHeight);
		target_mc.lineTo ((1 * _curve [0]) , ((2 * _curve [1]) + _txtBoxHeight));
		// derde _curve
		target_mc.curveTo (0, ((2 * _curve [1]) + _txtBoxHeight) , 0, ((1 * _curve [1]) + _txtBoxHeight));
		target_mc.lineTo (0, (1 * _curve [1]));
		// vierde _curve
		target_mc.curveTo (0, 0, _curve [0] , 0);
		target_mc.endFill ();
	}
	
	/**
	 * 
	 * @param	$target_mc
	 * @param	$width
	 * @param	$height
	 */
	static function rectangle ($target_mc:MovieClip, $width:Number, $height:Number) {
		
		
	}
	
}
