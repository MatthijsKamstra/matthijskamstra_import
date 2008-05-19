/**
* Cosines (AS3), version 1.0
*
* Goniometrie
* 
* Cos regel (Law of cosines)
* 
*
* De cosinusregel is een goniometrische regel die de relatie beschrijft tussen de lengten van de zijden van een driehoek en een van de hoeken. 
* De regel kan worden toegepast om:
* 		1. als twee zijden en de door die zijden ingesloten hoek bekend zijn de derde zijde te berekenen
*		2. een hoek te berekenen als de drie zijden bekend zijn.
*
* Het is een generalisatie van de Stelling van Pythagoras:
*
*   	a^2 = b^2 + c^2 - 2bc * cos alpha
*   	b^2 = a^2 + c^2 - 2ac * cos beta
* 	  	c^2 = a^2 + b^2 - 2ab * cos gamma 
* 
* OR
*
* 		cos alpha = -(bc*bc-ab*ab-ca*ca)/(2*ab*ca);
* 
*	 (a² = b² + c² -2bc × Cos a)
*
* 
*                             C
*                            /\
*                           /  \
*                          /    \
*                         /gamma \
*                        /        \
*                    b  /          \  a
*                      /            \
*                     /              \
*                    /                \
*                   /                  \
*                  / alpha         beta \
*               A /----------------------\ B
*                            c
*                           
* 
* 
*     * the third side of a triangle if one knows two sides and the angle between them:

        c = sqrt (a^2 + b^2 - 2ab * cos gamma)

    * the angles of a triangle if one knows the three sides:

        gamma = cos ( -(a^2 + b^2 - c^2 )/(2ab))


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
* </pre>
*
* @class  	: 	Cos
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	6-2-2008 21:00 
* 
*/
package nl.matthijskamstra.math {
	
	public class Cosines extends Angle {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.math.Cosines;
		public static var CLASS_NAME : String = "Cosines";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.math.Cosines";
		
		/**
		* Constructor
		*/
		public function Cosines(  ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		}
		
		/**
		 * calculate the angle is 3 sides are known
		 * 
		 * @usage				var angleA:Number = Cosines.useCosines (AB, DA, BD);
		 *						trace( "angleA : " + angleA );
		 * @param	$side1				encloses the angle with $side2
		 * @param	$side2				encloses the angle with $side1
		 * @param	$oppositeSide		the side opposite to the angle to be calculated
		 * @return		angle in degrees
		 */
		static public function useCosines ($side1:Number = NaN , $side2:Number = NaN , $oppositeSide:Number = NaN):Number {
			var cosA = -($oppositeSide*$oppositeSide-$side1*$side1-$side2*$side2)/(2*$side1*$side2);
			//var acosA = Math.acos(cosA)*180/Math.PI;
			var acosA = toDegree (Math.acos(cosA));
			return (acosA);
		}
		
		
		
	} // end class
	
} // end package
