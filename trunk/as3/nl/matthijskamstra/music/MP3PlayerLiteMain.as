/**
* MP3PlayerLiteMain (AS3), version 1.0
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
* @class  	: 	MP3PlayerLiteMain
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	17-4-2008 23:15 
* 
*/
package nl.matthijskamstra.music {
	
	import flash.display.*;	
	import flash.events.*;
	import nl.matthijskamstra.music.MP3PlayerLite;
    import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class MP3PlayerLiteMain extends MovieClip {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.music.MP3PlayerLiteMain;
		public static var CLASS_NAME : String = "MP3PlayerLiteMain";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.music.MP3PlayerLiteMain";
		// vars
		public static var targetObj:DisplayObjectContainer;		
		public var soundChannel_1:SoundChannel;
		public var soundChannel_2:SoundChannel;
		public var soundChannel_3:SoundChannel;
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.music.MP3PlayerLiteMain; // import
		*			var __MP3PlayerLiteMain__ : nl.matthijskamstra.music.MP3PlayerLiteMain = new nl.matthijskamstra.music.MP3PlayerLiteMain ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function MP3PlayerLiteMain( $targetObj:DisplayObjectContainer = null ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $targetObj == null ) { 
				targetObj = this;
			} else {
				targetObj = $targetObj;
			}
			initMP3PlayerLiteMain ( targetObj ) ;
		}
		
		/**
		* initMP3PlayerLiteMain used to jumpstart everything
		* 
		* @usage   	import nl.matthijskamstra.music.MP3PlayerLiteMain; // import
		*			var __MP3PlayerLiteMain__ : nl.matthijskamstra.music.MP3PlayerLiteMain = new nl.matthijskamstra.music.MP3PlayerLiteMain ();
		*			__MP3PlayerLiteMain__.initMP3PlayerLiteMain( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function initMP3PlayerLiteMain( $targetObj:DisplayObjectContainer ) {
			trace( "\t|\t $targetObj : " + $targetObj );
			
			// dummyBtn_mc button 
			var __dummyBtn_mc:Object = $targetObj.getChildByName('dummyBtn_mc');
			__dummyBtn_mc.buttonMode = true;
			__dummyBtn_mc.addEventListener (MouseEvent.CLICK, onClick_dummyBtn_mcListener);
			
			
			// dummyBtn2_mc button 
			var __dummyBtn2_mc:Object = $targetObj.getChildByName('dummyBtn2_mc');
			__dummyBtn2_mc.buttonMode = true;
			__dummyBtn2_mc.addEventListener (MouseEvent.CLICK, onClick_dummyBtn2_mcListener);
			
			
			// dummyBtn3_mc button 
			var __dummyBtn3_mc:Object = $targetObj.getChildByName('dummyBtn3_mc');
			__dummyBtn3_mc.buttonMode = true;
			__dummyBtn3_mc.addEventListener (MouseEvent.CLICK, onClick_dummyBtn3_mcListener);
			
			soundChannel_1 = MP3PlayerLite.create('mp3/coldsprint_medium.mp3');
			soundChannel_2 = MP3PlayerLite.create('mp3/coldsprint_high.mp3');
			soundChannel_3 = MP3PlayerLite.create('mp3/coldsprint_highest.mp3');

			
		}

		
		
		private function onClick_dummyBtn_mcListener (e:MouseEvent){
			//soundChannel_1.soundTransform 
			//trace( "soundChannel_1.soundTransform : " + soundChannel_1.soundTransform );
			var transform:SoundTransform = soundChannel_1.soundTransform;
            if (transform.volume  == 0) {
				transform.volume = 1;
			} else {
				transform.volume = 0;
			}
            soundChannel_1.soundTransform = transform;
			//soundChannel_1
			//soundChannel_1.stop ();
		}
		private function onClick_dummyBtn2_mcListener (e:MouseEvent){
			//soundChannel_2 
			var transform:SoundTransform = soundChannel_2.soundTransform;
			if (transform.volume  == 0) {
				transform.volume = 1;
			} else {
				transform.volume = 0;
			}
            soundChannel_2.soundTransform = transform;
			//soundChannel_2.stop ();
		}		
		private function onClick_dummyBtn3_mcListener (e:MouseEvent){
			//soundChannel_3
			var transform:SoundTransform = soundChannel_3.soundTransform;
            if (transform.volume  == 0) {
				transform.volume = 1;
			} else {
				transform.volume = 0;
			}
            soundChannel_3.soundTransform = transform;
			//soundChannel_3.stop ();
		}
	} // end class
	
} // end package
