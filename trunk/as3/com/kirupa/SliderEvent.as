/**
* SliderEvent (AS3), version 1.0
*
* url:
* http://www.kirupa.com/forum/showthread.php?t=245468
* 
* usage:
*
*
* @class  	: 	SliderEvent
* @author 	:  	MichaelxxOA (?) & Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	29-7-2008 11:10 
* 
* Changelog:
*
* 		v 1.0 [29-7-2008 11:10] - Initial release
*
*/
package com.kirupa {
	
    import flash.events.Event;

    public class SliderEvent extends Event
    {
        // events
        public static const CHANGE:String = "change";
       
        protected var percentage:Number;
        /**
         * Read-Only
         */
        public function get percent():Number { return percentage; }
        
		/**
         * Constructor
         */
        public function SliderEvent( type:String, percent:Number ) {
            super( type );
            percentage = percent;
        }
		
	} // end class
	
} // end package
