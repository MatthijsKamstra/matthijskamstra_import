/**
* Delay (AS3), version 1.0
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
* @class  	: 	Delay
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	18-4-2008 12:17 
* 
*/
package nl.matthijskamstra.util {
	
	import flash.display.*;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

	public class Delay {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.util.Delay;
		public static var CLASS_NAME : String = "Delay";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.util.Delay";
		// vars
		
		private var onComplete			: Function; 	//The function that should be triggered when this tween has completed
		private var onCompleteParams	: Array; 		//An array containing the parameters that should be passed to the this.onComplete when this tween has finished.

		
		/**
		* Constructor
		*/
		public function Delay( $fnc:Function = null, $delay:int = 1000 ,$param:Array = null  , $repeatCount:uint = 1 ) {
			if ($fnc == null) { return };
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			var myDelay:Delay = new Delay ();
			this.onComplete = $fnc;
			this.onCompleteParams = $param || [];

			
			var myTimer:Timer = new Timer($delay, $repeatCount);
			myTimer.addEventListener("timer", timerHandler);
			myTimer.start();
			
		}
		
		
		 /**
		  * 
		  * @param	$delay					The delay, in milliseconds, between timer events.
		  * @param	$repeatCount			The total number of times the timer is set to run.
		  * @param	$fnc
		  */
		static public function thisFunction ( $fnc:Function, $delay:int = 1000 ,$param:Array = null  , $repeatCount:uint = 1  ){
			return new Delay ($fnc, $delay,  $param , $repeatCount);
		}		
        
		
		public function timerHandler(event:TimerEvent):void {
            trace("timerHandler: " + event);
			if (this.onComplete != null) {
				this.onComplete.apply(null , onCompleteParams);
			}
        }
		
	} // end class
	
} // end package
