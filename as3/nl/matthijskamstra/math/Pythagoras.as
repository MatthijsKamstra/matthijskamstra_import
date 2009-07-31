/**
* Pythagoras (AS3), version 1.0
*
* Goniometrie
* 
* Pythagoras
* 
* 
* A2 + B2 = C2
* 
*    |
*    |\
*    | \
*    |  \  C
*  B |   \
*    |    \
*    +-----\
*       A
*
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.1 - cleaning up class
* 				r1.0 - class creation (AS3)
* 
*/
package nl.matthijskamstra.math {
	
	public class Pythagoras {
		
		
		/**
		* Constructor
		*/
		public function Pythagoras(  ) { }
		

		/**
		 * calculate the "schuine zijde"
		 * 
		 * @example		trace ('schuinezijde: ' + Pythagoras (4, 3 , NaN )); // schuinezijde: 5
		 * @param	$aSide		side whatever size (pixel or cm)
		 * @param	$bSide		side whatever size (pixel or cm)
		 * @param	$sSide		('schuine zijde') side whatever size (pixel or cm)
		 * @return		the side not given will be calculated in the size use in the other sides
		 */
		public static function usePythagoras ($aSide:Number = NaN, $bSide:Number = NaN , $sSide:Number = NaN  ):Number 
		{
			if (isNaN($aSide)) {
				return Math.sqrt(($sSide * $sSide) - ($bSide * $bSide));
			}
			if (isNaN($bSide)) {
				return Math.sqrt(($sSide * $sSide) - ($aSide * $aSide));
			}
			if (isNaN($sSide)) {
				return Math.sqrt(($aSide * $aSide) + ($bSide * $bSide));
			}
			return NaN;
		}
		
		/**
		 * @example		var schuineZijde:Number = Pythagoras.Hypotenusa (pointsArray[i].x , pointsArray[i].y , pointsArray[nextItem].x , pointsArray[nextItem].y );
		 *
		 * IMPORTANT to use x,y,x,y series!!
		 * 
		 * @param	$x1		x value of point 1
		 * @param	$y1		y value of point 1
		 * @param	$x2		x value of point 2
		 * @param	$y2		y value of point 2
		 * @return		the Hypotnusa of a triangle with one 90 degree corner
		 */
		public static function Hypotenusa ($x1:Number = NaN , $y1:Number = NaN, $x2:Number = NaN , $y2:Number = NaN ):Number
		{
			//trace( "Pythagoras.Hypotenusa > $x1 : " + $x1 + ", $y1 : " + $y1 + ", $x2 : " + $x2 + ", $y2 : " + $y2 );
			var xyObject:Object = calcABSide ($x1, $y1, $x2, $y2);
			var schuineZijde:Number = Pythagoras.usePythagoras (xyObject.xDir, xyObject.yDir , NaN );
			return (schuineZijde);
		}
		
		/**
		 * 
		 * @usage				var xyObject:Object = calcABSide (pointsArray[0].x , pointsArray[0].y , pointsArray[1].x , pointsArray[1].y );
		 *						trace( "xyObject.xDir : " + xyObject.xDir + ",\t xyObject.yDir : " + xyObject.yDir );
		 * @param	$x1
		 * @param	$y1
		 * @param	$x2
		 * @param	$y2
		 * @return
		 */
		public static function calcABSide ($x1:Number = NaN , $y1:Number = NaN, $x2:Number = NaN , $y2:Number = NaN ):Object 
		{
			//trace( "Pythagoras.calcABSide > $x1 : " + $x1 + ", $y1 : " + $y1 + ", $x2 : " + $x2 + ", $y2 : " + $y2 );
			
			if (isNaN ($x1)) { return NaN; }
			if (isNaN ($x2)) { return NaN; }
			if (isNaN ($y1)) { return NaN; }
			if (isNaN ($y2)) { return NaN; }
			
			var xDir:Number = $x2 - $x1;
			var yDir:Number = $y2 - $y1;
			var xRotate:Number = 1;
			var yRotate:Number = 1;
			
			// TODO: [mck] Math.abs()
			
			if (xDir < 0) { 
				xDir *= -1 ;
				xRotate = -1;
			
			}
			if (yDir < 0) { 
				yDir *= -1 ;
				yRotate = -1;
			}
			return { xDir:xDir , yDir:yDir , xRotate:xRotate, yRotate:yRotate };
		}
		
		public static function getRelativeXYDir ($x1:Number = NaN , $y1:Number = NaN, $x2:Number = NaN , $y2:Number = NaN ):Object {
			var storeData:Object = calcABSide ($x1 , $y1, $x2 , $y2 );
			return storeData;
		}
		
	} // end class
	
} // end package
