/**
* MP3PlayerLite (AS3), version 1.0
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
* @class  	: 	MP3PlayerLite
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	17-4-2008 23:15 
* 
*/
package nl.matthijskamstra.music {
	
	import flash.display.*;
    import flash.events.*;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.net.URLRequest;

	public class MP3PlayerLite {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.music.MP3PlayerLite;
		public static var CLASS_NAME : String = "MP3PlayerLite";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.music.MP3PlayerLite";
		// vars
		public static var targetObj:DisplayObjectContainer;		
		
		private var song:SoundChannel;

		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.music.MP3PlayerLite; // import
		*			var __MP3PlayerLite__ : nl.matthijskamstra.music.MP3PlayerLite = new nl.matthijskamstra.music.MP3PlayerLite ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function MP3PlayerLite( $url:String = null, $obj:Object = null){
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $url == null ) { return; } ;
			
			var request:URLRequest = new URLRequest($url);
            var soundFactory:Sound = new Sound();
            soundFactory.addEventListener(Event.COMPLETE, completeHandler);
            soundFactory.addEventListener(Event.ID3, id3Handler);
            soundFactory.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            soundFactory.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            soundFactory.load(request);
            song = soundFactory.play (0,100);
		}
		
		/**
		* initMP3PlayerLite used to jumpstart everything
		* 
		* @usage   	import nl.matthijskamstra.music.MP3PlayerLite; // import
		*			var __MP3PlayerLite__ : nl.matthijskamstra.music.MP3PlayerLite = new nl.matthijskamstra.music.MP3PlayerLite ();
		*			__MP3PlayerLite__.initMP3PlayerLite( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function initMP3PlayerLite( $targetObj:DisplayObjectContainer ) {
			trace( "\t|\t $targetObj : " + $targetObj );
			
		}
		
		public static function create ( $url:String, $obj:Object = null):SoundChannel {
			var temp = new MP3PlayerLite ($url, $obj);
			return (temp.song)
		}


		public function stopSound() {
			var _MP3PlayerLite:MP3PlayerLite = new MP3PlayerLite ();
			//temp.song
			trace( "_MP3PlayerLite.song : " + _MP3PlayerLite.song );
			_MP3PlayerLite.song.stop();
		}
		
		
		
		
        private function completeHandler(event:Event):void {
            trace("completeHandler: " + event);
        }

        private function id3Handler(event:Event):void {
            trace("id3Handler: " + event);
        }

        private function ioErrorHandler(event:Event):void {
            trace("ioErrorHandler: " + event);
        }

        private function progressHandler(event:ProgressEvent):void {
            trace("progressHandler: " + event);
        }

		
	} // end class
	
} // end package
