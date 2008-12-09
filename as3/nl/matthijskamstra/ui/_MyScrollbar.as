/**
* MyScrollbar (AS3), version 1.0
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
* @class  	: 	MyScrollbar
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	4-12-2008 17:03 
*
* Changelog:
* 		v 1.0 [4-12-2008 17:03] - Initial release
*/
package nl.matthijskamstra.ui {
	
	import flash.display.*;
	import flash.events.*;	
	import flash.geom.Rectangle;

	public class MyScrollbar extends MovieClip {
		
		// vars
		private static var containerMC:MovieClip;
		private static var trackMC:MovieClip;
		private static var scrollerMC:MovieClip;
		private static var upArrowMC:MovieClip;
		private static var downArrowMC:MovieClip;

		private var target:MovieClip;
		private var top:Number;
		private var bottom:Number;
		private var dragBot:Number;
		private var range:Number;
		private var ratio:Number;
		private var sPos:Number;
		private var sRect:Rectangle;
		private var ctrl:Number;//This is to adapt to the target's position
		private var trans:String;
		private var timing:Number;
		private var isUp:Boolean;
		private var isDown:Boolean;
		private var isArrow:Boolean;
		private var arrowMove:Number;
		private var upArrowMCHt:Number;
		private var downArrowMCHt:Number;
		private var sBuffer:Number;
		private static var isFirstRun:Boolean = false;

		
		
		/**
		* Constructor
		*/
		public function MyScrollbar( ) {
			containerMC = this;
			trackMC = containerMC.track;
			scrollerMC = containerMC.scroller;
			upArrowMC = containerMC.upArrow;
			downArrowMC = containerMC.downArrow;
			
			if (!isFirstRun) { 
				containerMC.stage.addEventListener(MouseEvent.MOUSE_UP, stopScroll);			
				containerMC.stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				isFirstRun = true;
			}
			//initMyScrollbar ( ) ;
		}
		
		
		public function init(t:MovieClip, sa:Boolean = true, b:Number = 2):void {
			//trace( "MyScrollbar.init > t : " + t + ", sa : " + sa + ", b : " + b );
			target = t;
			//trans = tr;
			//timing = tt;
			isArrow = sa;
			sBuffer = b;
			
			
			if (target.height <= trackMC.height) {
				this.visible = false;
			}			
			//
			upArrowMCHt = upArrowMC.height;
			downArrowMCHt = downArrowMC.height;
			

			if (isArrow) {
				top = scrollerMC.y;
				dragBot = (scrollerMC.y + trackMC.height) - scrollerMC.height;
				bottom = trackMC.height - (scrollerMC.height/sBuffer);

			} else {
				top = scrollerMC.y;
				dragBot = (scrollerMC.y + trackMC.height) - scrollerMC.height;
				bottom = trackMC.height - (scrollerMC.height/sBuffer);

				upArrowMCHt = 0;
				downArrowMCHt = 0;
				removeChild(upArrowMC);
				removeChild(downArrowMC);
			}

			
			range = bottom - top;
			sRect = new Rectangle(0,top,0,dragBot);
			ctrl = target.y;
			//set Mask
			isUp = false;
			isDown = false;
			arrowMove = 10;
		
			if (isArrow) {
				upArrowMC.addEventListener(Event.ENTER_FRAME, upArrowMCHandler);
				upArrowMC.addEventListener(MouseEvent.MOUSE_DOWN, upScroll);
				upArrowMC.addEventListener(MouseEvent.MOUSE_UP, stopScroll);
				//
				downArrowMC.addEventListener(Event.ENTER_FRAME, downArrowMCHandler);
				downArrowMC.addEventListener(MouseEvent.MOUSE_DOWN, downScroll);
				downArrowMC.addEventListener(MouseEvent.MOUSE_UP, stopScroll);
			}
			var square:Sprite = new Sprite();
			square.graphics.beginFill(0xFF0000);
			square.graphics.drawRect(target.x, target.y, target.width+5, (trackMC.height+upArrowMCHt+downArrowMCHt));
			containerMC.addChild(square);			
			target.mask = square;	
			
			scrollerMC.addEventListener(MouseEvent.MOUSE_DOWN, dragScroll);
		}
		
		public function upScroll(event:MouseEvent):void {
			isUp = true;
		}
		public function downScroll(event:MouseEvent):void {
			isDown = true;
		}
		public function upArrowMCHandler(event:Event):void {
			if (isUp) {
				if (scrollerMC.y > top) {
					scrollerMC.y-=arrowMove;
					if (scrollerMC.y < top) {
						scrollerMC.y = top;
					}
					startScroll();
				}
			}
		}
		//
		public function downArrowMCHandler(event:Event):void {
			if (isDown) {
				if (scrollerMC.y < dragBot) {
					scrollerMC.y+=arrowMove;
					if (scrollerMC.y > dragBot) {
						scrollerMC.y = dragBot;
					}
					startScroll();
				}
			}
		}
		//
		public function dragScroll(event:MouseEvent):void {			
			trace( "MyScrollbar.dragScroll > event : " + event );
			scrollerMC.startDrag(false, sRect);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveScroll);
		}
		//
		public function mouseWheelHandler(event:MouseEvent):void {
			if (event.delta < 0) {
				if (scrollerMC.y < dragBot) {
					scrollerMC.y-=(event.delta*2);
					if (scrollerMC.y > dragBot) {
						scrollerMC.y = dragBot;
					}
					startScroll();
				}
			} else {
				if (scrollerMC.y > top) {
					scrollerMC.y-=(event.delta*2);
					if (scrollerMC.y < top) {
						scrollerMC.y = top;
					}
					startScroll();
				}
			}
		}
		//
		public function stopScroll(event:MouseEvent):void {
			isUp = false;
			isDown = false;
			scrollerMC.stopDrag();

			stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveScroll);
		}
		//
		public function moveScroll(event:MouseEvent):void {
			startScroll();

		}
		public function startScroll():void {
			trace( "target : " + target );
			ratio = (target.height - range) / range;
			sPos = (scrollerMC.y * ratio)-ctrl;
			
			//Tweener.addTween(target, {y:-sPos, time:timing, transition:trans});
		}

		
		
	} // end class
	
} // end package
