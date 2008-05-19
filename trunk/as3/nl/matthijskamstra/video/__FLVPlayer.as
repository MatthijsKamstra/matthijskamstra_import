/**
* FLVPlayer (AS3), version 1.0
*

	import nl.matthijskamstra.video.FLVPlayer; // import

			var __FLVPlayer:FLVPlayer = new FLVPlayer (targetObj);
			__FLVPlayer.isAutoPlay = true; // [mck] werkt bij mijn thuis nogal vertragend
			__FLVPlayer.initFLVPlayer (url1);
			__FLVPlayer.viewFLVPlayerFull();
			__FLVPlayer.myFLVPlayback.addEventListener (VideoProgressEvent.PROGRESS , progressListener);
			__FLVPlayer.myFLVPlayback.addEventListener (VideoEvent.COMPLETE  , onCompleteListener);
			
			

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
* @class  	: 	FLVPlayer
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	6-12-2007 15:05 
* 
*/
package nl.matthijskamstra.video {
	
	import fl.video.FLVPlayback;
	
	import fl.video.VideoScaleMode; 
	import nl.matthijskamstra.util.DisplayObjectList;
	
	public class FLVPlayer  {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.video.FLVPlayer;
		public static var CLASS_NAME : String = "FLVPlayer";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.video.FLVPlayer";
		// public vars
		//public static var $targetObj:MovieClip;
		private static var targetObj:Object
		public var myFLVPlayback:FLVPlayback;		
		public static var mySTATIC_FLVPlayback:FLVPlayback;		
		// private vars
		private static var videoPath:String;
		private static var autoPlay:Boolean = false;
		private static var previousURL:String = '';
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.video.FLVPlayer; // import
		*			var __FLVPlayer : nl.matthijskamstra.video.FLVPlayer = new nl.matthijskamstra.video.FLVPlayer ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function FLVPlayer( $targetObj:Object = null ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $targetObj == null ) { return; } ;
			targetObj = $targetObj;
			//initFLVPlayer ( $targetObj ) ;
		}
		
		/**
		* initFLVPlayer used to jumpstart everything
		* 
		* @usage   	import nl.matthijskamstra.video.FLVPlayer; // import
		*			var __FLVPlayer : nl.matthijskamstra.video.FLVPlayer = new nl.matthijskamstra.video.FLVPlayer ();
		*			__FLVPlayer.initFLVPlayer( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function initFLVPlayer( $url:String = null ) {
			trace( "\t|\t loadNewURL -------------------------- $url : " + $url );
			if ($url == null) { trace ('[[ warning ]] : define "videoPath" -----------------') ;  return; }
			previousURL = $url;
			videoPath = $url;
			myFLVPlayback = new FLVPlayback();
			mySTATIC_FLVPlayback = myFLVPlayback;
			myFLVPlayback.name = 'FLVPlayer'
			myFLVPlayback.load($url);
			
		}
		
		public function loadNewURL ($url:String = null , $isAutoPlay:Boolean = false) {
		
			//trace( "\t|\t loadNewURL -------------------------- $url : " + $url );
			if ($url == null) { trace ('[[ warning ]] : define "videoPath" -----------------') ;  return; }
			
			videoPath = $url; 
			myFLVPlayback = mySTATIC_FLVPlayback ;
			
			if ( $url == previousURL ) {
				//trace( "eerder geladen ----------------------- "  );
				mySTATIC_FLVPlayback.stop ();
				mySTATIC_FLVPlayback.seek (0);	
				if ($isAutoPlay) {
					mySTATIC_FLVPlayback.play();
				}
				return
			}
			
			previousURL = $url;

			//mySTATIC_FLVPlayback.closeVideoPlayer (0); // in poging twee proberen
			//myFLVPlayback = new FLVPlayback();
			//mySTATIC_FLVPlayback = new FLVPlayback();
			//mySTATIC_FLVPlayback = myFLVPlayback;
			//myFLVPlayback.name = 'FLVPlayer'
			mySTATIC_FLVPlayback.load($url);
			//myFLVPlayback.load($url);
			if ($isAutoPlay) {
				mySTATIC_FLVPlayback.play();
			}
		}
		/**
		 * 
		 */
		public function viewFLVPlayer () {
			targetObj.addChildAt(myFLVPlayback , 0);
			//targetObj.name = 'FLVPlayer';
			if (autoPlay) {
				myFLVPlayback.play();
			}
			myFLVPlayback.x = 0;
			myFLVPlayback.y = 0;
			myFLVPlayback.registrationX = 0;
			myFLVPlayback.registrationY = 0;
			myFLVPlayback.registrationWidth = targetObj.stage.stageWidth ;
			myFLVPlayback.registrationHeight = targetObj.stage.stageHeight ;
		}
		
		/**
		 * 
		 */
		public function viewFLVPlayerFull ():void {
			//trace( "\t|\t viewFLVPlayerFull --------------------------" );
			targetObj.addChildAt(myFLVPlayback , 0);
			//targetObj.name = 'FLVPlayer';
			if (autoPlay) {
				myFLVPlayback.play();
			}
			myFLVPlayback.x = 0;
			myFLVPlayback.y = 0;
			//myFLVPlayback.registrationX = 0;
			//myFLVPlayback.registrationY = 0;
			myFLVPlayback.registrationWidth = targetObj.stage.stageWidth ;
			myFLVPlayback.registrationHeight = targetObj.stage.stageHeight ;
			myFLVPlayback.scaleMode = VideoScaleMode.EXACT_FIT 
		}
		
		/**
		 * 
		 */
		static public function change2FullScreen ():void {
			// var temp = targetObj.getChildByName ('FLVPlayer');
			var __FLVPlayer:FLVPlayer = new FLVPlayer ();
			__FLVPlayer.myFLVPlayback.x = 0;
			__FLVPlayer.myFLVPlayback.y = 0;
			//__FLVPlayer.registrationX = 0;
			//__FLVPlayer.registrationY = 0;
			__FLVPlayer.myFLVPlayback.registrationWidth = targetObj.stage.stageWidth ;
			__FLVPlayer.myFLVPlayback.registrationHeight = targetObj.stage.stageHeight ;
			__FLVPlayer.myFLVPlayback.scaleMode = VideoScaleMode.EXACT_FIT ;
		}
		
		
		/**
		 * flvplayer is already on the stage, and only the videoPath has to be changed
		 */
		public static function changeVideoURL ($videoPath:String):void {
			//trace( "-- changeVideoURL -----------------------------" );
			var __FLVPlayer:FLVPlayer = new FLVPlayer ();
			__FLVPlayer.myFLVPlayback.load($videoPath);
			if (autoPlay) {
				__FLVPlayer.myFLVPlayback.play();
			}
		}
		
		
		public function startPlaying ($seek:Number = NaN):void {
			mySTATIC_FLVPlayback.play();
		}
		public function lastFrame():void {
			trace( "## lastFrame ()");
			mySTATIC_FLVPlayback.stop();
			mySTATIC_FLVPlayback.seekPercent(1)
		}
		
		public function stopPlaying ():void {
			//trace( "stopPlaying : " + stopPlaying );
			mySTATIC_FLVPlayback.stop();
		}
		public function rewind ():void {
			//trace( "## rewind ()");
			mySTATIC_FLVPlayback.stop();
			mySTATIC_FLVPlayback.playheadTime = 0;
			mySTATIC_FLVPlayback.seek(0);
		}
		public function getBytesLoaded ():void {
			//trace( "## getBytesLoaded () " );
			trace (myFLVPlayback.bytesLoaded +' / '+myFLVPlayback.bytesTotal)
		}
		
		///////////// getters and setters /////////////////////////
		/**
		 * 
		 * get:		var __FLVPlayer:FLVPlayer = new FLVPlayer  ();
		 *			trace( "__FLVPlayer.videoPathURL : " + __FLVPlayer.videoPathURL );
		 * set: 	__FLVPlayer.videoPathURL = "flv/HigherGround_v02.flv";
		 *			trace( "__FLVPlayer.videoPathURL : " + __FLVPlayer.videoPathURL );
		*/
		// videoPath url
		public function get videoPathURL ():String { return (videoPath); }
		public function set videoPathURL ($url:String):void { videoPath = $url; }
		// autoPlay true or false
		public function get isAutoPlay ():Boolean  { return (autoPlay); }
		public function set isAutoPlay ($autoplay:Boolean):void  { autoPlay = $autoplay; }
		
		

		
	} // end class
	
} // end package
