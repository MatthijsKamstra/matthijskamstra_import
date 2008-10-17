/**
* Slider (AS3), version 1.1
*
* url:
* http://www.kirupa.com/forum/showthread.php?t=245468
* 
* usage:
*
*
* @class  	: 	Slider
* @author 	:  	MichaelxxOA (?) & Matthijs C. Kamstra [mck]
* @version 	:	1.1 - class creation (AS3)
* @since 	:	29-7-2008 11:08 
* 
* Changelog:
*
* 		v 1.1 [29-7-2008 11:08] - improvement by [mck]
* 				# movieClip instead of generated slider
* 				# changed 'e.target.stage' ipv 'stage'
* 		v 1.0 [?] - Initial release
*
*/
package com.kirupa {
	
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;

    /**
     * Represents the base functionality for Sliders.
     *
     * Broadcasts 1 event:
     * -SliderEvent.CHANGE
     */
    public class Slider extends Sprite {
		
		// Constants:
		public static var CLASS_REF = com.kirupa.Slider;
		public static var CLASS_NAME : String = "Slider";
		public static var LINKAGE_ID : String = "com.kirupa.Slider";
		// vars
        // elements
        protected var track:Sprite;
        protected var marker:Sprite;
       
        // percentage
        protected var percentage:Number = 0;
       
        /**
         * Constructor
         */
        public function Slider($target = null) {
            createElements($target);
        }
       
		/**
		* Creates and initializes the marker/track elements.
		*/
        protected function createElements($target):void {
			//trace( "Slider.createElements > $target : " + $target );
            track = new Sprite();
            marker = new Sprite();
           
			if ($target == null){
				track.graphics.beginFill( 0xCCCCCC, 1 );
				track.graphics.drawRect(0, 0, 10, 100);
				track.graphics.endFill();
			   
				marker.graphics.beginFill( 0x333333, 1 );
				marker.graphics.drawRect(0, 0, 10, 15);
				marker.graphics.endFill();
				
				addChild( track );
				addChild( marker );
			} else {
				track = ($target.slider_mc.sliderTrack_mc as Sprite);
				marker = ($target.slider_mc.sliderMarker_mc as Sprite);
			}
            
			marker.addEventListener( MouseEvent.MOUSE_DOWN, markerPress );
           
        }
		
        // ends the sliding session
        protected function stopSliding( e:MouseEvent ):void {
            marker.stopDrag();
            e.target.stage.removeEventListener( MouseEvent.MOUSE_MOVE, updatePercent );
			e.target.stage.removeEventListener( MouseEvent.MOUSE_UP, stopSliding );
        }   
		
		//////////////////////////////////////// Handlers ////////////////////////////////////////
		
		
        // updates the data to reflect the visuals
        protected function updatePercent( e:MouseEvent ):void {
            e.updateAfterEvent();
            percentage = marker.y / (track.height - marker.height);  
            dispatchEvent( new SliderEvent( SliderEvent.CHANGE, percentage ) );
        }
               
        //  Executed when the marker is pressed by the user.
        protected function markerPress( e:MouseEvent ):void {
			marker.startDrag( false, new Rectangle( 0, 0, 0, track.height - marker.height ) );
			e.target.stage.addEventListener( MouseEvent.MOUSE_MOVE, updatePercent );
            e.target.stage.addEventListener( MouseEvent.MOUSE_UP, stopSliding );
        }
       
		
		//////////////////////////////////////// getter / setters ////////////////////////////////////////
		
		/**
		* The percent is represented as a value between 0 and 1.
		*/
        public function get percent():Number { return percentage; }
		/**
		* The percent is represented as a value between 0 and 1.
		*/
        public function set percent( p:Number ):void {
            percentage = Math.min( 1, Math.max( 0, p ) );
            marker.y = percentage * (track.height - marker.height);
            dispatchEvent( new SliderEvent( SliderEvent.CHANGE, percentage ) );
        }
		
		
	} // end class
	
} // end package
