/**
* TimeConverter (AS3), version 1.0
*
* Enter description here
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
* @version:		r1.0 - class creation (AS3)
* @since :		29-11-2007 14:19 
* 
*/
package nl.matthijskamstra.util {

	public class TimeConverter {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.util.TimeConverter;
		public static var CLASS_NAME : String = "TimeConverter";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.util.TimeConverter";
		// vars
	
		
		/**
		* Constructor
		* 
		* @usage   	import nl.consumentveiligheidsplittherisk.util.TimeConverter; // import
		*			var __TimeConverter__ : nl.consumentveiligheidsplittherisk.util.TimeConverter = new nl.consumentveiligheidsplittherisk.util.TimeConverter ( this );
		* @param	$target_mc		a reference to a movie clip or object
		*/
		public function TimeConverter(  ) {
			////trace ( '+ ' + LINKAGE_ID + ' class instantiated');
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
			
			// //trace ($timeInMilisec + " $mmm (" + Math.round (totalSeconds) + " seconds)");
			var minutes = Math.floor (totalSeconds / 60);
			var hours   = Math.floor (minutes / 60);
			var seconds = Math.floor (totalSeconds) % 60;
			var milisec = Math.floor ($timeInMilisec  - HH2mmm(hours) - MM2mmm(minutes)- SS2mmm(seconds));
			if (hours < 10) {
				hours = "0" + hours;
			}
			if (minutes < 10) {
				minutes = "0" + minutes;
			}
			if (seconds < 10) {
				seconds = "0" + seconds;
			}
			if (milisec < 10) {
				milisec = "00" + milisec;
			} else if (milisec < 100 && milisec >= 10) {
				milisec = "0" + milisec;
			}
			////trace (minutes + ":" + seconds);       
			return ([hours , minutes, seconds, milisec]);
		}
		
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
		 * @param	$timeInSec
		 * @return
		 */
		public function timeNotationString ($timeInMilisec:Number):String {
			//trace( "\t|\t timeNotation : " + timeNotation );
			var timeNotation:Array =  mmm2TimeNotation ($timeInMilisec , true)
			return (timeNotation[0] + ":" + timeNotation[1] + ":" + timeNotation[2] );
		}
		/**
		 * 
		 * @param	$timeInSec
		 * @return		
		 */
		public function timeNotationString2 ($timeInMilisec:Number):String {
			//trace( "\t|\t timeNotation : " + timeNotation );
			var timeNotation:Array =  mmm2TimeNotation ($timeInMilisec , true)
			return (timeNotation[2] + ":" + timeNotation[3] );
		}
		
	} // end class
	
} // end package
