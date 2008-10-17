/**
* Scrollbar (AS3), version 1.1
*
* url:
* http://www.kirupa.com/forum/showthread.php?t=245468
* 
* usage:
* 
* 
* 
*
*
* @class  	: 	Scrollbar
* @author 	:  	MichaelxxOA (?) & Matthijs C. Kamstra [mck]
* @version 	:	1.1 - class creation (AS3)
* @since 	:	29-7-2008 11:12 
* 
* Changelog:
*
* 		v 1.1 [29-7-2008 11:12] - changes by [mck]
* 			# changed "e.target == up_arrow" and added "|| e.target.name == 'arrowUp_mc'"
* 		v 1.0 [?] 				- Initial release
*
*/
package com.kirupa {
	
    import flash.display.Sprite;
    import flash.events.MouseEvent;

    public class Scrollbar extends Sprite {
       
		// elements
        protected var slider:Slider;
        protected var up_arrow:Sprite;
        protected var down_arrow:Sprite;
       
        protected var scrollSpeed:Number = .1;
       
        /**
         * Constructor
         */
        public function Scrollbar($target = null) {
            createElements($target);
        }
		
		/**
		* Create and initialize the slider and arrow elements.
		*/
        protected function createElements($target):void {
			//trace( "Scrollbar.createElements > $target : " + $target );
			slider = new Slider($target);
			if ( $target == null ) {
				// generate the arrows
				up_arrow = new Sprite();
				up_arrow.graphics.beginFill( 0x666666, 1 );
				up_arrow.graphics.drawRect( 0, 0, 10, 10 );
				up_arrow.graphics.endFill();
			   
				down_arrow = new Sprite();
				down_arrow.graphics.beginFill( 0x666666, 1 );
				down_arrow.graphics.drawRect( 0, 0, 10, 10 );
				down_arrow.graphics.endFill(); 
				
				slider.y = up_arrow.height;
				down_arrow.y = slider.y + slider.height;
				
				addChild( slider );
				addChild( up_arrow );
				addChild( down_arrow );
				
			} else {
				// use the movieClips in the $target
				up_arrow 	= 	$target.arrowUp_mc;
				down_arrow 	= 	$target.arrowDown_mc;
				
				var slider = $target.slider_mc
				slider.y = up_arrow.height;
				down_arrow.y = slider.y + slider.height;
			}
			
            up_arrow.addEventListener( MouseEvent.MOUSE_DOWN, arrowPressed );
            down_arrow.addEventListener( MouseEvent.MOUSE_DOWN, arrowPressed );
           
        }
		
		
		//////////////////////////////////////// Handler ////////////////////////////////////////

		
        // executes when the up arrow is pressed
        protected function arrowPressed( e:MouseEvent ):void {
            var dir:int = (e.target.parent.name == 'arrowUp_mc') ? -1 : 1;
            slider.percent += dir * scrollSpeed;
        }
		
		//////////////////////////////////////// Listener ////////////////////////////////////////               
        
		/**
         * Override the add and remove event listeners, so that SliderEvent.CHANGE events will be
         * subscribed to the Slider directly.
         *
         * There is issues with this however, Event.CHANGE events will get subscribed directly too Slider as well.
         */
        public override function addEventListener( type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false ):void {
            if ( type === SliderEvent.CHANGE ){
                slider.addEventListener( SliderEvent.CHANGE, listener, useCapture, priority, useWeakReference );
                return;
            }
            super.addEventListener( type, listener, useCapture, priority, useWeakReference );
        }
        public override function removeEventListener( type:String, listener:Function, useCapture:Boolean=false ):void {
            if ( type === SliderEvent.CHANGE ) {
                slider.removeEventListener( SliderEvent.CHANGE, listener, useCapture );
                return;
            }
            super.removeEventListener( type, listener, useCapture );
        }
		

		//////////////////////////////////////// getter/setters ////////////////////////////////////////
		
        // read/write percentage value relates directly to the slider
        public function get percent():Number { return slider.percent; }
        public function set percent( p:Number ):void { slider.percent = p; }
		
		
	} // end class
	
} // end package
