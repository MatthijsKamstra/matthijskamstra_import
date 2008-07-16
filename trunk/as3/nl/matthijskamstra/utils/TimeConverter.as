/**
* TimeConverter (AS3), version 1.1
*
* Convert miliseconds to normal time notation (HH:MM:SS:mmm)
* 
* Usage:
* 		import nl.matthijskamstra.utils.TimeConverter;// import
* 		import flash.utils.getTimer;
*		var tc:TimeConverter = new TimeConverter ();
*		trace (">> " + tc.timeNotation_SSmmm ( 1000 ));
*		trace (">> " + tc.timeNotation_SSmmm ( getTimer ()));
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
* @class : 		TimeConverter
* @author :  	Matthijs C. Kamstra [mck]
* @version:		1.1 - class creation (AS3)
* @since :		29-11-2007 14:19 
* 
* Changelog:
*
* 		v 1.1 [14-07-2008 10:13] - Bug in milisecond fixed
* 		v 1.0 [29-11-2007 14:19] - Initial release
*
*/
package nl.matthijskamstra.utils {

	public class TimeConverter {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.TimeConverter;
		public static var CLASS_NAME : String = "TimeConverter";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.TimeConverter";
		// vars
	
		
		/**
		* Constructor
		*/
		public function TimeConverter(  ) {
			// trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		}
		
		/**
		 * 
 		 * @usage	
		 * 
		 * @param	$string
		 * @return
		 */
		public static function string2$mmm ($string:String = '00:01:00,000'):Number {
			var __TimeConverter:TimeConverter = new TimeConverter ();
			var miliSecArray:Array = $string.split(',');
			var timeArray:Array = miliSecArray[0].split(':');
			var mmm:Number  = __TimeConverter.time2mmm( Number (timeArray[0]), Number (timeArray[1]), Number (timeArray[2]), Number (miliSecArray[1]) );
			return mmm;
		}
		
		/**
		 * The time property is a number representing the time in hours, minutes, seconds, and milliseconds ($HH:$MM:$SS.$mmm)
		 * 
		 * @usage	
		 * 
		 * @param	$HH
		 * @param	$MM
		 * @param	$SS
		 * @param	$mmm
		 * @return
		 */
		public function time2mmm ($HH:Number = 00, $MM:Number = 00, $SS:Number = 00, $mmm:Number = 000 ):Number {
			$SS = $SS * 1000;
			$MM = ($MM * 60) * 1000;
			$HH = (($HH * 60 ) * 60) * 1000;
			if ($mmm.toString().length > 3){
				$mmm = Number ($mmm.toString().substring (0,3)); 
			}
			return ($mmm + $SS + $MM + $HH)
		}
		
		/**
		 * $HH = hours
		 * $MM = minutes
		 * $SS = seconds
		 * $mmm = milliseconds
		 */
		public function HH2mmm ($HH:Number) : Number { return ($HH / 60 / 60 / 1000); }
		public function MM2mmm ($MM:Number) : Number { return ($MM / 60 / 1000); }
		public function SS2mmm ($SS:Number) : Number { return ($SS / 1000); }
		
		/*
		 * mm2TimeNotation 
		 * 
		 * 
		 * @param	$timeInMilisec
		 * @return		00:00:00:000		$HH:$MM:$SS:mls
		 */
		public function mmm2TimeNotation ($timeInMilisec:Number , $miliSecondsUsed:Boolean = true):Array {
			var totalSeconds:Number ;
			if ($miliSecondsUsed){
				totalSeconds = $timeInMilisec / 1000;
			} else {
				totalSeconds= $timeInMilisec ;
			}
			// trace ($timeInMilisec + " $mmm (" + Math.round (totalSeconds) + " seconds)");
			var minutes = Math.floor (totalSeconds / 60);
			var hours   = Math.floor (minutes / 60);
			var seconds = Math.floor (totalSeconds) % 60;
			var milisec = Math.floor ($timeInMilisec  - HH2mmm(hours) - MM2mmm(minutes) - SS2mmm(seconds));
			
			if (hours < 10) {
				hours = "0" + hours;
			}
			if (minutes < 10) {
				minutes = "0" + minutes;
			}
			if (seconds < 10) {
				seconds = "0" + seconds;
			}
			milisec = Number (( milisec / 1000).toString().split('.')[1] ) ;
			if (milisec == null || isNaN (milisec) ) {
				milisec = "000";
			}else if (milisec < 10) {
				milisec = "00" + milisec;
			} else if (milisec < 100 && milisec >= 10) {
				milisec = "0" + milisec;
			}
			////trace (minutes + ":" + seconds);       
			return ([hours , minutes, seconds, milisec]);
		}
		
		/**
		 * convert miliseconds to MM:SS:mmmm
		 * 
		 * @usage		import nl.matthijskamstra.utils.TimeConverter; // import
		 * 				TimeConverter.mmm2TimeQuick (1050547);
		 * 				
		 * @param		$timeInMilisec
		 * @return			"10:50:547" (MM:SS:mmmm)
		 */
		static public function mmm2TimeQuick ($timeInMilisec:Number):String {
			var __TimeConverter:TimeConverter = new TimeConverter ();
			var timeNotation:Array =  __TimeConverter.mmm2TimeNotation ($timeInMilisec , true)
			return ( timeNotation[1] + ":" + timeNotation[2] + ":" + timeNotation[3] );
		}
		
		/**
		 * 
		 * @param	$timeInSec
		 * @return
		 */
		public function timeNotation ($timeInSec:Number):Array {
			//trace( "\t|\t timeNotation : " + timeNotation );
			var timeNotation:Array =  mmm2TimeNotation ($timeInSec , false)
			return (timeNotation);
		}
		
		/**
		 * 
		 * @param	$timeInMilisec
		 * @return		HH:MM:SS
		 */
		public function timeNotationString ($timeInMilisec:Number):String {
			//trace( "\t|\t timeNotation : " + timeNotation );
			var timeNotation:Array =  mmm2TimeNotation ($timeInMilisec , true)
			return (timeNotation[0] + ":" + timeNotation[1] + ":" + timeNotation[2] );
		}
		/**
		 * convert miliseconds to SS:mmmm
		 * 
		 * @usage		import nl.matthijskamstra.utils.TimeConverter; // import
		 * 				var tc:TimeConverter = new TimeConverter ();
		 * 				tc.timeNotation_SSmmm ( getTimer () - startingTime);
		 * @param		$timeInMilisec
		 * @return			SS:mmm
		 */
		public function timeNotation_SSmmm ($timeInMilisec:Number):String {
			//trace( "TimeConverter.timeNotation_SSmmm > $timeInMilisec : " + $timeInMilisec );
			var timeNotation:Array =  mmm2TimeNotation ($timeInMilisec , true)
			return (timeNotation[2] + ":" + timeNotation[3] );
		}
		
	} // end class
	
} // end package
