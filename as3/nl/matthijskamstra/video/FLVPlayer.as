/**
* FLVPlayer (AS3), version 1.0
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
* @class  	: 	FLVPlayer
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	28-3-2008 16:48 
* 
*/
package nl.matthijskamstra.video {
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;	
	import fl.video.*;
	import nl.matthijskamstra.util.DisplayObjectList;


	public class FLVPlayer extends MovieClip {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.video.FLVPlayer;
		public static var CLASS_NAME : String = "FLVPlayer";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.video.FLVPlayer";
		// vars
		public static var targetObj:DisplayObjectContainer;	
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.video.FLVPlayer; // import
		*			var __FLVPlayer__ : nl.matthijskamstra.video.FLVPlayer = new nl.matthijskamstra.video.FLVPlayer ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function FLVPlayer( $targetObj:DisplayObjectContainer = null ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $targetObj == null ) { 
				targetObj = this;
			} else {
				targetObj = $targetObj;
			}
			initFLVPlayer ( targetObj ) ;
		}
		
		/**
		* initFLVPlayer used to jumpstart everything
		* 
		* @usage   	import nl.matthijskamstra.video.FLVPlayer; // import
		*			var __FLVPlayer__ : nl.matthijskamstra.video.FLVPlayer = new nl.matthijskamstra.video.FLVPlayer ();
		*			__FLVPlayer__.initFLVPlayer( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function initFLVPlayer( $targetObj:DisplayObjectContainer ) {
			trace( "\t|\t $targetObj : " + $targetObj );
			
		}
		
		/**
		 * 
		 * @param	$targetObj	
		 * @param	$url		
		 * @param	$obj		object with extra param
		 * 							name: name of player
		 * 							autoPlay: start automatic play (default true)
		 * 							x
		 * 							y
		 * 							depth
		 */
		static public function createFLVPlayer ($targetObj:DisplayObjectContainer , $url:String, $obj:Object) {
			
			var myFLVPlayback:FLVPlayback = new FLVPlayback();
			myFLVPlayback.name = 'FLVPlayer';
			// myFLVPlayback.bufferTime = 10;
			if ($obj.autoPlay != null){
				myFLVPlayback.autoPlay = $obj.autoPlay;
			} else {
				myFLVPlayback.autoPlay = true; // default
			}
			if ($obj.x != null) {
				myFLVPlayback.x = $obj.x;
				//myFLVPlayback.registrationX = $obj.x;
			} else {
				myFLVPlayback.x = 0;
				//myFLVPlayback.registrationX = 0;
			}
			if ($obj.y != null) {
				myFLVPlayback.y = $obj.y;
				//myFLVPlayback.registrationY = $obj.y;
			} else {
				myFLVPlayback.y = 0;
				//myFLVPlayback.registrationY = 0;
			}
			myFLVPlayback.registrationWidth = $targetObj.stage.stageWidth ;
			myFLVPlayback.registrationHeight = $targetObj.stage.stageHeight ;			
			/*var depth = $targetObj.getChildIndex ($targetObj.getChildByName ('contactBtn_mc'));
			trace( "depth : " + depth );*/
			if ($obj.depth != null) {
				$targetObj.addChildAt(myFLVPlayback, $obj.depth );
			} else {
				$targetObj.addChildAt(myFLVPlayback,0 );
			}
			
			myFLVPlayback.source = $url;
			
			// see changes in STATE
			 myFLVPlayback.addEventListener (VideoEvent.STATE_CHANGE , onStateChangeListner );
			
		}
		
	
		static public function stopFLVPlayer ($targetObj:DisplayObjectContainer ) {
			if ($targetObj.getChildByName ('FLVPlayer') != null) {
				var flvPlayer = $targetObj.getChildByName ('FLVPlayer')
				flvPlayer.stop ();
			} else {
				trace( ":: stopFLVPlayer :: there is no FLYPlayer ...");
			}
		}
		
		static public function playFLVPlayer ($targetObj:DisplayObjectContainer ) {
			if ($targetObj.getChildByName ('FLVPlayer') != null) {
				var flvPlayer = $targetObj.getChildByName ('FLVPlayer')
				flvPlayer.play();
			} else {
				trace( ":: playFLVPlayer  :: there is no FLYPlayer ...")
			}
		}		
		
		static public function getFLVPlayer ($targetObj:DisplayObjectContainer ) {
			//DisplayObjectList.getCurrentLevelList ($targetObj)
			return ($targetObj.getChildByName ('FLVPlayer'));
		}
		
		/////////////////////////////////////////// Listner ////////////////////////////////////////
		static private function onStateChangeListner(e:VideoEvent):void {
			// trace( "e : " + e.target.parent.name);
			var myFLVPlayback = e.target;
			trace (":: video ("+e.target.parent.name+") is: " + myFLVPlayback.state);
		}
		
		
	} // end class
	
} // end package
