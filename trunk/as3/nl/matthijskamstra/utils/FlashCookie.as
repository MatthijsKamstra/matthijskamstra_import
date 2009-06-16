/**
* Singleton class: FlashCookie (AS3), version 1.0
*
* Base Class for maintaining persistent local storage 
* 
* 
* code example:
* 
 			FlashCookie.getInstance().CONTROL_ALT_SHIFT(stage);
			FlashCookie.getInstance().saveValue('test', 'hierwat');
			FlashCookie.getInstance().saveValue('testd' );
			var _obj:Object = FlashCookie.getInstance().data
			trace( "_obj.savedValue : " + _obj.savedValue );
			trace( "_obj.hierwat : " + _obj.hierwat );
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
* @class  	: 	FlashCookie
* @author 	:  	as2 code from David Knape, converted to as3 by Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	10-4-2009 13:47 
* 
* Changelog:
* 		v 1.0 [10-4-2009 13:47] - Initial release
*/
package nl.matthijskamstra.utils {
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import flash.ui.Keyboard;

	public class FlashCookie {
	
		private var mCookieName : String = '_eat_more_cookies';
		private var _SharedObject : SharedObject;
		
		// SharedObject version num - useful if we need to change formats in future versions
		// upping this number will reset the shared object in all clients
		private var _version : Number = 1.0;
		
		private static var instance:FlashCookie;
		private static var allowInstantiation:Boolean;
		private var stage:Stage;
		
		public function FlashCookie ():void {
			if (!allowInstantiation) {
				throw new Error("Error: Instantiation failed: Use FlashCookie.getInstance() instead of new.");
			}
		}
		
		public static function getInstance():FlashCookie {
			if (instance == null) {
				allowInstantiation = true;
				instance = new FlashCookie ();
				allowInstantiation = false;
				
				FlashCookie.getInstance().init();
			}
			return instance;
		}
		
		
		/**
		* Initialize cookie
		*/
		private function init():void 
		{
			//trace( "FlashCookie.init" );
			
			_SharedObject = SharedObject.getLocal(mCookieName);
			// make sure we are not dealing with an older version of our flash cookie
			// if old version or not defined, set it up
			if(_SharedObject.data.version == undefined || _SharedObject.data.version < _version) {
				reset();
			}		
			
		}
		
		// secret shortcut key
		public function CONTROL_ALT_SHIFT (inStage:Stage) 
		{
			trace( "++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			trace( "+  FlashCookie.CONTROL_ALT_SHIFT > inStage : " + inStage );
			trace( "+  CONTROL/APPLE + ALT + SHIFT :: ARROW-LEFT  >> clear cookie" );
			trace( "+  CONTROL/APPLE + ALT + SHIFT :: ARROW-RIGHT >> set cookie" );
			trace( "++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			
			inStage.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
		}
		
		
		private function reportKeyDown(e:KeyboardEvent):void 
		{
			//trace( "FlashCookie.reportKeyDown > e : " + e );
			
			if ((e.keyCode == Keyboard.LEFT) && (e.altKey == true) && (e.shiftKey == true) && (e.ctrlKey == true)) {
				trace ('+  FlashCookie :: CLEAR sharedObject');
				reset();
				//traceData();
			}
			if ((e.keyCode == Keyboard.RIGHT) && (e.altKey == true) && (e.shiftKey == true) && (e.ctrlKey == true)) {
				trace ('+  FlashCookie :: SET sharedObject');
				FlashCookie.getInstance().saveValue(true, 'firstTime');
				traceData();
			}
			

		}
		
		
		public function saveValue (inValue:* , inNameValue:String = 'savedValue'):void 
		{
			// trace( "FlashCookie.saveValue > inNameValue : " + inNameValue + ", inValue : " + inValue );			
			
			_SharedObject.data[inNameValue] = inValue;
            
            var flushStatus:String = null;
            try {
                flushStatus = _SharedObject.flush(10000);
            } catch (error:Error) {
			    trace ("Error...Could not write SharedObject to disk");
            }
            if (flushStatus != null) {
                switch (flushStatus) {
                    case SharedObjectFlushStatus.PENDING:
                        trace("Requesting permission to save object...");
                        _SharedObject.addEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
                        break;
                    case SharedObjectFlushStatus.FLUSHED:
                        trace("Value flushed to disk.");
                        break;
                }
            }
		}
		
		/**
		* Reset cookie var 
		* 
		* Override this and add necessary default values here
		*/
		public function reset() 
		{
			//trace( "FlashCookie.reset" );
			_SharedObject.clear();
			_SharedObject.data.version = _version;
		}

		/**
		* Flush the cookies to disk
		* // writes changes to disk
		*/
		public function flush() 
		{
		    return _SharedObject.flush(10000);
		}
		
		/**
		* return cookie data
		* 
		* @return
		*/
		public function get data () : Object {
			return _SharedObject.data;
		}
		
		
		public function traceData ():void 
		{
			trace( " - FlashCookie.traceData // start" );
			for ( var i:String in _SharedObject.data ) {
				trace( "\tkey : " + i + ", value : " + _SharedObject.data[ i ] );
			}
			trace( " - FlashCookie.traceData // end" );
		}
		
		public function getSize ():void
		{
			trace( "FlashCookie.getSize: " + _SharedObject.size); 
		}
		
		//////////////////////////////////////// Listeners ////////////////////////////////////////
		
		private function onFlushStatus(event:NetStatusEvent):void {
            trace ("User closed permission dialog...");
            switch (event.info.code) {
                case "SharedObject.Flush.Success":
                    trace ("User granted permission -- value saved.");
                    break;
                case "SharedObject.Flush.Failed":
					trace ("User denied permission -- value not saved.");
                    break;
            }
            _SharedObject.removeEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
        }

		
	} // end class
	
} // end package