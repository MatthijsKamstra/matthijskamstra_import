/**
* ScrollContent (AS3), version 1.0
*
* url:
* http://www.kirupa.com/forum/showthread.php?t=245468
* 
* usage:
*
* @class  	: 	ScrollContent
* @author 	:  	MichaelxxOA (?) & Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	29-7-2008 11:16 
* 
* Changelog:
*
* 		v 1.1 [29-7-2008 11:16] - changes
* 				# var target = content.parent;
* 		v 1.0 [?] - Initial release
*
*/
package com.kirupa {
	
	import flash.display.DisplayObjectContainer;
    import flash.display.Sprite;
    import flash.geom.Rectangle;

    public class ScrollContent extends Sprite {
        // elements
        protected var content:Sprite;
        protected var scrollbar:Scrollbar;
        protected var contentHeight:Number;
        
        /**
         * Constructor
		 * 		 
		 * @param	$content
		 * @param	$scroller
		 * @param	scrollRect
		 */
        public function ScrollContent( $content:Sprite, $scroller:Scrollbar, scrollRect:Rectangle = null ) { 
			//trace( "ScrollContent.ScrollContent > $content : " + $content + ", $scroller : " + $scroller + ", scrollRect : " + scrollRect );
            content = $content;
            contentHeight = $content.height; 
			
			scrollbar = $scroller;
			
			if (scrollRect == null) {
				// [mck] todo:: this is a hack but it works	
				// content and scroller need to be in the same timeline
				var target = content.parent;
				var _sliderContainer_mc = target.getChildByName('sliderContainer_mc');
				var scroll_rect:Rectangle = new Rectangle(0, 0, content.width, _sliderContainer_mc.height);
				scrollRect = scroll_rect;
			}
			
            content.scrollRect = scrollRect;
            scrollbar.addEventListener( SliderEvent.CHANGE, updateContent );
        }
        
		//////////////////////////////////////// Handler ////////////////////////////////////////
		
        public function updateContent( e:SliderEvent ):void {
            var scrollable:Number = contentHeight - content.scrollRect.height;
            var sr:Rectangle = content.scrollRect.clone();

            sr.y = scrollable * e.percent;
            
            content.scrollRect = sr;
        }
		
	} // end class
	
} // end package
