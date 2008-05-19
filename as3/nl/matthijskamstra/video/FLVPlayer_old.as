/**
* ...
* use from the library
* 
* 
* @author Default
* @version 0.1
*/

package nl.matthijskamstra.video {

	import fl.video.FLVPlayback;
	import fl.video.MetadataEvent;
	import fl.video.VideoProgressEvent ;
	import fl.video.VideoScaleMode;
	import nl.split.TimeConverter;
	
	import fl.video.VideoEvent; 
	
	import flash.display.MovieClip;
    import flash.display.Sprite;
 
	  /**/
	import flash.events.*;
	
	import flash.display.*;



	public class FLVPlayer_old extends Sprite {
			
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.video.FLVPlayer_old;
		public static var CLASS_NAME : String = "FLVPlayer_old";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.video.FLVPlayer_old";
		
		private var videoPath:String = "flv/HigherGround_v02.flv";
		
		//public static var _FLVPlayer_old:FLVPlayback;
		public static var _FLVPlayer_old:FLVPlayback;

		
		/**
		 * 
		 */
		public function FLVPlayer_old ($target_mc:MovieClip = null){
			trace ('\t|\t '+ LINKAGE_ID + ' class instantiated');
			if ($target_mc == null){return;}
		}
		
		
		public function useVideoPath ( $url:String = null ){
			if ($url == null){ return; }
			videoPath = $url;
		}
		
		/**
		 * @usage	var $FLVPlaybackExample : nl.matthijskamstra.video.FLVPlayer_old = new nl.matthijskamstra.video.FLVPlayer_old()
		 * 			$FLVPlaybackExample.FLVPlaybackExample( )
		 * @param	$target_mc
		 */
		public function FLVPlaybackExample($target_mc:MovieClip ) {
			
			_FLVPlayer_old = new FLVPlayback();
			$target_mc.addChild(_FLVPlayer_old);
			_FLVPlayer_old.load(videoPath);
			
			_FLVPlayer_old.x = 0;
			_FLVPlayer_old.y = 0;
			//_FLVPlayer_old.width = stage.stageWidth;
			//_FLVPlayer_old.height = stage.stageHeight;
			
			
			_FLVPlayer_old.play();
			
			_FLVPlayer_old.addEventListener(MetadataEvent.METADATA_RECEIVED, metadataHandler);
			_FLVPlayer_old.addEventListener(VideoProgressEvent.PROGRESS , progressHandler);
			//_FLVPlayer_old.addEventListener(VideoEvent.PLAYHEAD_UPDATE , playheadHandler);
			
			
			//_FLVPlayer_old.addEventListener(VideoEvent.READY , testHandler);
			
			


			
			
			
		}
		
		
		function playheadHandler (progressObj:Object){
			//trace( "progressObj : " + progressObj );
			//progressObj.state
			//trace( "progressObj.state : " + progressObj.state );
			//progressObj.playheadTime 
			trace( "\t|\t progressObj.playheadTime : " + progressObj.playheadTime );
			//progressObj.vp 
			//trace( "progressObj.vp : " + progressObj.vp );
			
			
			//trace( "playheadHandler : " + playheadHandler );
			
			
		}

		

		
		function testHandler (progressObj:Object){
			trace( "progressObj : " + progressObj );
			trace( "testHandler : " + testHandler );
			
			}
		
		/**
		 * 
		 * @param	progressObj
		 */
		private function progressHandler(progressObj:Object):void {
			/*
			bytesLoaded		The number of items or bytes loaded at the time the listener processes the event. 
			bytesTotal 		The total number of items or bytes that will be loaded if the loading process succeeds. 
			vp 				The index of the VideoPlayer object. 
			*/
			//progressObj.bytesLoaded 
			//trace( "progressObj.bytesLoaded : " + progressObj.bytesLoaded );
			//progressObj.bytesTotal 
			//trace( "progressObj.bytesTotal : " + progressObj.bytesTotal );
			//progressObj.vp 
			//trace( "progressObj.vp : " + progressObj.vp );
			
		}
		
		/**
		canSeekToEnd 	A Boolean value that is true if the FLV file is encoded with a keyframe on the last frame that allows seeking to the end of a progressive download movie clip. It is false if the FLV file is not encoded with a keyframe on the last frame. 
		cuePoints 		
		audiocodecid 	A number that indicates the audio codec (code/decode technique) that was used. 
		audiodelay
		audiodatarate 	A number that is the kilobytes per second of audio. 
		videocodecid 	A number that is the codec version that was used to encode the video. 
		framerate 		A number that is the frame rate of the FLV file. 
		videodatarate 	A number that is the video data rate of the FLV file. 
		height 			A number that is the height of the FLV file. 
		width 			A number that is the width of the FLV file. 
		duration		A number that specifies the duration of the FLV file in seconds. 

		 * 
		 * 
		 * 
		 * @param	metadataObj
		 */
		private function metadataHandler(metadataObj:Object):void {

			
			//for( var i:String in metadataObj.info ) trace( "key : " + i + ", value : " + metadataObj.info[ i ] );
			
			//_FLVPlayer_old.width = metadataObj.info.width
			_FLVPlayer_old.scaleMode = VideoScaleMode.MAINTAIN_ASPECT_RATIO ;
			_FLVPlayer_old.registrationWidth = _FLVPlayer_old.stage.stageWidth ;
			//trace( "_FLVPlayer_old.stage.stageWidth : " + _FLVPlayer_old.stage.stageWidth );
			_FLVPlayer_old.registrationHeight = _FLVPlayer_old.stage.stageHeight ;
			_FLVPlayer_old.registrationX = 0 
			_FLVPlayer_old.registrationY = 0 
			//_FLVPlayer_old.height = metadataObj.info.height
			
			
			var temp = new TimeConverter ();
			var usedNumber:Array = temp.timeNotation (metadataObj.info.duration)
			trace( "metadataObj.info.duration : " + metadataObj.info.duration );
			trace( "usedNumber: " + usedNumber);
			
			
        }
		/**
		 * getter / setter
		 * @return		
		 */
		public function getVideoWidth ():Number { return _FLVPlayer_old.width; }
		public function getVideoHeight ():Number { return _FLVPlayer_old.height; }
		public function getVideoXpos ():Number { return _FLVPlayer_old.x; }
		public function getVideoYpos ():Number { return _FLVPlayer_old.y; }
	
		public function setVideoWidth (w:Number){
			trace( "w : " + w );
			_FLVPlayer_old.width = w;
		}
		
	} // end class
	
} // end package
