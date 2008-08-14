/**
* Delay (AS3), version 1.1
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
* @version 	:	1.1
* @since 	:	18-4-2008 12:17 
* 
* changelog;
* 	- v1.1 [2008-05-05] one frame delay added
* 	- v1.0 [2008-04-18] intial release 
*/
package nl.matthijskamstra.utils {
	
	import flash.display.*;
	import flash.events.*;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

	public class Delay {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.Delay;
		public static var CLASS_NAME : String = "Delay";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.Delay";
		// vars
		
		private var onComplete			: Function; 	//The function that should be triggered when this tween has completed
		private var onCompleteParams	: Array; 		//An array containing the parameters that should be passed to the this.onComplete when this tween has finished.
		
		private var thisRoot:Sprite;
		private var maxFrame:uint;
		private var framCounter:uint;

		
		/**
		* Constructor
		*/
		public function Delay( $fnc:Function = null, $secDelay:int = 1000 ,$param:Array = null  , $repeatCount:uint = 1 ) {
			if ($fnc == null) { return };
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			var myDelay:Delay = new Delay ();
			this.onComplete = $fnc;
			this.onCompleteParams = $param || [];
			
			var myTimer:Timer = new Timer($secDelay, $repeatCount);
			myTimer.addEventListener("timer", timerHandler);
			myTimer.start();
			
		}
		
		public function DelayFrame ( $fnc:Function = null, $frameDelay:uint = 1, $param:Array = null  ) {
			//trace( "\t|\tDelayFrame ----------- " );
			if ($fnc == null) { return };
			
			this.onComplete = $fnc;
			this.onCompleteParams = $param || [];
			
			thisRoot = new Sprite ();
			maxFrame= $frameDelay;
			framCounter= 1;
			thisRoot.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
		}		
		
		///////////////////////////////////////////// statics ///////////////////////////////////////////// 
		
		 /**
		  * @usage		import nl.matthijskamstra.utils.Delay; //import
		  * 			Delay.thisFunction (foobar);
		  * @param	$fnc					function that will be delayed
		  * @param	$secDelay				The delay, in milliseconds, between timer events.
		  * @param	$repeatCount			The total number of times the timer is set to run.
		  */
		static public function thisFunction ( $fnc:Function, $secDelay:int = 1000, $param:Array = null, $repeatCount:uint = 1  ){
			return new Delay ($fnc, $secDelay,  $param , $repeatCount);
		}		
        
		/**
		 * @usage		import nl.matthijskamstra.utils.Delay; //import
		 * 				Delay.frame(foobar);
		 * @param	$fnc			function that will be delayed
		 * @param	$frameDelay			The delay, in milliseconds, between timer events.
		 * @param	$param			The total number of times the timer is set to run.
		 */
		static public function frame ($fnc:Function, $frameDelay:uint = 1 , $param:Array = null ) {
			var _delay:Delay = new Delay ();
			_delay.DelayFrame ($fnc, $frameDelay,  $param );
		}
		
		///////////////////////////////////////////// listeners/handlers ///////////////////////////////////////////// 		
		
		private function enterFrameHandler(e:Event):void {
			//trace( "enterFrameHandler : " + enterFrameHandler );
			//trace( "framCounter : " + framCounter );
			if (framCounter >= maxFrame){
				thisRoot.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);		
				if (this.onComplete != null) {
					this.onComplete.apply(null , onCompleteParams);
				}
				return;
			}
			framCounter++;
		}
		
		public function timerHandler(event:TimerEvent):void {
            //trace("timerHandler: " + event);
			if (this.onComplete != null) {
				this.onComplete.apply(null , onCompleteParams);
			}
        }
		
	} // end class
	
} // end package
