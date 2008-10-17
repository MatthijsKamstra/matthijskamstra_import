/**
* ScrollbarExample (AS3), version 1.0
*
* url:
* http://www.kirupa.com/forum/showthread.php?t=245468
* 
* usage:
*
*
* @class  	: 	ScrollbarExample
* @author 	:  	MichaelxxOA (?) & Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	29-7-2008 11:38 
* 
* Changelog:
*
* 		v 1.0 [29-7-2008 11:38] - Initial release
*
*/
package com.kirupa {
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Rectangle;

	// com.kirupa.ScrollbarExample
	
    public class ScrollbarExample extends MovieClip {
		
		// Constants:
		public static var CLASS_REF = com.kirupa.ScrollbarExample;
		public static var CLASS_NAME : String = "ScrollbarExample";
		public static var LINKAGE_ID : String = "com.kirupa.ScrollbarExample";
		// vars
		public static var targetObj:DisplayObjectContainer;		
		
		/**
		 * constructor
		 */
        public function ScrollbarExample( $targetObj:DisplayObjectContainer = null ) {
			trace( "ScrollbarExample.ScrollbarExample" );
			targetObj = ($targetObj == null) ? this : $targetObj;
			//trace( "targetObj : " + targetObj );
			initScrollbarExample (targetObj)
		}
		
		public function initScrollbarExample ( $targetObj:DisplayObjectContainer = null){
			
			
			var sliderContainerMc = $targetObj.getChildByName ('sliderContainer_mc') ;
			var spelvoorwaardenTextMC = $targetObj.getChildByName ('SpelvoorwaardenText_mc') ;
            
			// scrollbars
            var scrollbar:Scrollbar = new Scrollbar();
			var scrollbar2:Scrollbar = new Scrollbar(sliderContainerMc);
			
			// content
			var content:Sprite = new Sprite();

            content.graphics.beginFill	( 0xFF0000, 1 );
            content.graphics.drawRect	( 0, 0, 100, 50 );
            content.graphics.beginFill	( 0x00FF00, 1 );
            content.graphics.drawRect	( 0, 50, 100, 50 );
            content.graphics.beginFill	( 0x0000FF, 1 );
            content.graphics.beginFill	( 0x0000FF, 1 );
            content.graphics.drawRect	( 0, 100, 100, 50 );
            content.graphics.endFill	();
		
            //var scroll_rect:Rectangle = new Rectangle( 0, 0, 100, 200 );
           
			// mask
            var mask:Rectangle = new Rectangle( 0, 0, 100, 100 );	
            // var mask2:Rectangle = new Rectangle( 0, 0, 100, 100 );
			
			// content
			var sc:ScrollContent = new ScrollContent( content, scrollbar, mask);
			var sc2:ScrollContent = new ScrollContent( spelvoorwaardenTextMC, scrollbar2, null);
		
			
			scrollbar.x = content.width;
           
            addChild( content );
            addChild( scrollbar ); 
			
        }
		
	} // end class
	
} // end package
