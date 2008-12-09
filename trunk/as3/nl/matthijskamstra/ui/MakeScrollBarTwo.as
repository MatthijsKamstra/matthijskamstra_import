﻿/**
* MakeScrollBarTwo (AS3), version 1.0
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
* @class  	: 	MakeScrollBarTwo
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	5-12-2008 12:21 
* 
* Changelog:
* 		v 1.0 [5-12-2008 12:21] - Initial release
*/
package nl.matthijskamstra.ui {
	
	import flash.display.*;
	import flash.events.*;	
	import flash.geom.Rectangle;

	public class MakeScrollBarTwo {
		
		private var host_mc:MovieClip;
		private var call_back:Function;
		
		private var drag_mc:MovieClip;
		private var track_mc:MovieClip;
		
		private var scroll_rect:Rectangle;
		private var upper_limit:Number;
		private var range:Number;
		
		
		/**
		* Constructor
		*/
		public function MakeScrollBarTwo( _mc:MovieClip, cb:Function) {
			//trace( "MakeScrollBarTwo.MakeScrollBarTwo > _mc : " + _mc + ", cb : " + cb );
			host_mc = _mc;
			call_back = cb;
			
			//drag_mc = host_mc.drag_mc; // 
			drag_mc = host_mc.scroller; // 
			
			drag_mc.buttonMode = true;
			drag_mc.mouseChildren = false;
			
			drag_mc.addEventListener( MouseEvent.MOUSE_DOWN, press_drag );
			//track_mc = host_mc.track_mc;
			track_mc = host_mc.track;
			track_mc.buttonMode = true;
			track_mc.mouseChildren = false
			track_mc.addEventListener( MouseEvent.CLICK, click_track );
			
			set_limits();
		}
		
				private function press_drag( event:MouseEvent ):void {
			//trace( "MakeScrollBar.press_drag > event : " + event );
			/***************************************************/
			drag_mc.stage.addEventListener( MouseEvent.MOUSE_UP, release_drag, false, 0, true );
			/***************************************************/ 
			drag_mc.startDrag( false, scroll_rect );
			drag_mc.addEventListener( Event.ENTER_FRAME, drag );
		}
		
		private function release_drag( event:MouseEvent ):void {
			//trace( "MakeScrollBar.release_drag > event : " + event );
			drag_mc.removeEventListener( Event.ENTER_FRAME, drag );
			drag_mc.stage.removeEventListener( MouseEvent.MOUSE_UP, release_drag );
			drag_mc.stopDrag();
		}
		
		private function click_track( event:MouseEvent ):void {
			//trace( "MakeScrollBar.click_track > event : " + event );
			trace( "Click track" );
		}
		
		private function set_limits():void {
			//trace( "MakeScrollBar.set_limits" );
			scroll_rect = new Rectangle( track_mc.x, track_mc.y, 0, track_mc.height - drag_mc.height );
			upper_limit = track_mc.y;
			range = track_mc.height - drag_mc.height;
		}
		
		private function drag( event:Event ):void {
			//trace( "MakeScrollBar.drag > event : " + event );
			var p = ( drag_mc.y - track_mc.y ) / range;
			call_back( p );
		}
		
		public static function shoutOUT ():void {
			trace( "MakeScrollBarTwo.shoutOUT" );
			
		}
		
		
	} // end class
	
} // end package
