/**
* MonitorFPS (AS3), version 1.0
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
* @class  	: 	MonitorFPS
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	7-7-2008 11:34 
* 
* Changelog:
*
* 		v 1.0 [7-7-2008 11:34] - Initial release
*
*/
package nl.matthijskamstra.utils {
	
	import flash.display.*;
	import flash.events.*;	
    import flash.utils.getTimer;
    import flash.events.Event;
    import flash.display.Sprite;
    import flash.text.TextField;
    
	
	public class MonitorFPS extends Sprite{
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.MonitorFPS;
		public static var CLASS_NAME : String = "MonitorFPS";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.MonitorFPS";
		// vars
        private var time:int;
        private var prevTime:int = 0;
        private var fps:Number;
        private var fps_txt:TextField;		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.utils.MonitorFPS; // import
		*			var __MonitorFPS:MonitorFPS = new MonitorFPS ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function MonitorFPS( $targetObj:DisplayObjectContainer , $obj:Object = null) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			//
            fps_txt = new TextField();
			if ($obj != null) {
				fps_txt.x = $obj.x;
				fps_txt.y = $obj.y;
			}
            $targetObj.addChild(fps_txt);
            
            //
            addEventListener(Event.ENTER_FRAME, getFps);
            
        }
        
		//////////////////////////////////////// Listener ////////////////////////////////////////
		
        private function getFps(e:Event):void  {
            time = getTimer();
            fps = 1000 / (time - prevTime);
            fps_txt.text = "fps: " + fps.toFixed(2);
            prevTime = getTimer();
        }
		
		//////////////////////////////////////// static ////////////////////////////////////////		
		
	} // end class
	
} // end package
