/**
* CasSosToa (AS3), version 1.0
*
* SOS - sinus = overstaande zijde gedeeld door schuine zijde;
* 		sin ( a ) = overstaande zijde / schuine zijde
* CAS - cosinus = aanliggende zijde gedeeld door schuine zijde
* TOA - tangens = overstaande zijde / aanliggende zijde.
* 
* De overstaande en aanliggende zijde zijn steeds de rechthoekszijden die de hoek vormen 
* (in eenrechthoekige driehoek).
* 
* Het woord soscastoa is een ezelsbruggetje waarmee de drie basisverhoudingen uit de goniometrie onthouden kunnen worden:
* 
*    |
*    |\
*    | \
*    |  \
*    |   \
*    |    \
*    +-----\
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
* @class  	: 	CasSosToa
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	22-1-2008 21:56 
* 
*/
package nl.matthijskamstra.math {


	public class CasSosToa  {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.math.CasSosToa;
		public static var CLASS_NAME : String = "CasSosToa";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.math.CasSosToa";
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.math.CasSosToa; // import
		*			var __CasSosToa:CasSosToa = new CasSosToa ( this );
		* @param	$target_mc		a reference to a movie clip or object
		*/
		public function CasSosToa(  ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		}
		
		/**
		 * use the cos to calculate the angle or one of the sides ('aanliggende zijde' or 'schuine zijde')
		 * 
		 * @usage 	trace ('aanliggende zijde: ' + CASsostoa ( 45, NaN, 20 );
		 * @param	$angleInDegree		angle in degrees	(return value will be in degrees)
		 * @param	$aSide				'aanliggende zijde'	whatever size (pixel or cm)
		 * @param	$sSide				'schuine zijde' whatever size (pixel or cm)
		 * @return		depends on the data not send in the params
		 * 				angle in degrees or a side value (depends on input: pixel or cm)
		 */
		public static function CASsostoa ( $angleInDegree:Number = NaN  , $aSide:Number = NaN  , $sSide:Number = NaN  ):Number{	
			if (isNaN ($angleInDegree) ) {
				// return (caculate) the angle in degrees
				return toDegree(Math.acos($aSide / $sSide));
			}
			if (isNaN ($aSide) ) {
				// return (caculate) the 'aanliggende zijde'
				return (Math.cos(toRadian($angleInDegree)) * $sSide);
			}
			if (isNaN ($sSide) ) { 
				// return (caculate) the 'schuine zijde'
				return ( $aSide / Math.cos(toRadian($angleInDegree)) );
			}
			return NaN ;
		}
		
		/**
		 * use the sinus to calculate the angle or one of the sides ('overstaande zijde' or 'schuine zijde')
		 * 
		 * @usage 	trace ('angle in degree: ' + casSOStoa ( NaN, 10, 20 );
		 * @param	$angleInDegree		angle in degrees	(return value will be in degrees)
		 * @param	$oSide				'overstaande zijde'	whatever size (pixel or cm)
		 * @param	$sSide				'schuine zijde' whatever size (pixel or cm)
		 * @return		depends on the data not send in the params
		 * 				angle in degrees or a side value (depends on input: pixel or cm)
		 */
		public static function casSOStoa ( $angleInDegree:Number = NaN  , $oSide:Number = NaN , $sSide:Number = NaN ):Number {	
			if (isNaN ($angleInDegree) ) {
				// return (caculate) the angle in degrees
				return toDegree(Math.asin($oSide / $sSide));
			}
			if (isNaN ($oSide) ) {
				// return (caculate) the 'overliggende zijde'
				return (Math.sin(toRadian($angleInDegree)) * $sSide);
			}
			if (isNaN ($sSide) ) { 
				// return (caculate) the 'schuine zijde'
				return ( $oSide / Math.sin(toRadian($angleInDegree)) );
			}
			return NaN ;
		}
		
		/**
		 * use the tan to calculate the angle or one of the sides ('overstaande zijde' or 'aanliggende zijde')
		 * 
		 * @usage 	trace ('aanliggende zijde: ' + cassosTOA ( 80, 10, NaN );
		 * 			trace( ">> cassosTOA (NaN , 40 , 40) : " + cassosTOA (NaN , 40 , 40) );
		 * @param	$angleInDegree		angle in degrees	(return value will be in degrees)
		 * @param	$oSide				'overstaande zijde'	whatever size (pixel or cm)
		 * @param	$aSide				'aanliggende zijde' whatever size (pixel or cm)
		 * @return		depends on the data not send in the params
		 * 				angle in degrees or a side value (depends on input: pixel or cm)
		 */
		public static function cassosTOA ( $angleInDegree:Number = NaN , $oSide:Number = NaN , $aSide:Number = NaN ):Number {	
			if (isNaN ($angleInDegree) ) {
				// return (caculate) the angle in degrees
				return toDegree(Math.atan($oSide / $aSide));
			}
			if (isNaN ($oSide) ) {
				// return (caculate) the 'overliggende zijde'
				return (Math.tan(toRadian($angleInDegree)) * $aSide);
			}
			if (isNaN ($aSide) ) { 
				// return (caculate) the 'aanliggende  zijde'
				return ( $oSide / Math.tan(toRadian($angleInDegree)) );
			}
			return NaN ;
		}
		
		
		// so we don't need other classes to make it work
		/**
		 * Converts an angle from radians to degrees
		 * @param	$angleRadian	A number representing the angle in radians
		 * @return					The angle in degrees
		 */
		public static function toDegree ($angleRadian:Number):Number {
			var degrees:Number = $angleRadian / (Math.PI / 180); 
			// degrees = radians * 180/Math.PI
			return (degrees); 
		}
		
		/**
		 * Converts an angle from degrees to radians.
		 * @param	$angleInDegree	A number representing the angle in dregrees
		 * @return					The angle in radians
		 */
		public static function toRadian ($angleInDegree:Number):Number {
			var radians:Number = $angleInDegree * Math.PI / 180;
			//radians = degrees * Math.PI/180
			return (radians); 
		}

		
	} // end class
	
} // end package
