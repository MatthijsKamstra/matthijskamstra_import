/**
* ScrollBarMain (AS3), version 1.0
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
* @class  	: 	ScrollBarMain
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	5-12-2008 11:36 
*
* Changelog:
* 		v 1.0 [5-12-2008 11:36] - Initial release
*/
package nl.matthijskamstra.ui {
	
	import flash.display.*;
	import flash.events.*;	
	import nl.matthijskamstra.ui.MakeScrollBar;
	
	public class ScrollBarMain extends MovieClip {
		
		// vars
		public static var targetObj:DisplayObjectContainer;	
		private var scrollbarMC:Scrollbar_mc;
		
		/**
		* Constructor
		*/
		public function ScrollBarMain( $targetObj:DisplayObjectContainer = null ) {
			trace( "ScrollBarMain.ScrollBarMain > $targetObj : " + $targetObj );
			
			


			scrollbarMC = new Scrollbar_mc ();
			scrollbarMC.name = 'sb_mc'
			scrollbarMC.x = 200
			scrollbarMC.y = 16
			addChild (scrollbarMC);


			var my_scrollbar:MakeScrollBar = new MakeScrollBar( scrollbarMC, scroll_text );






			this.txt_mc.y = scrollbarMC.y;
			this.txt_mc.mask = this.mask_mc;
			
		}

		function scroll_text( n:Number ) {
			// trace(n)
			var scrollHeightMovie : Number = this.txt_mc.height - scrollbarMC.height + 50 ;
			this.txt_mc.y = scrollbarMC.y  - (scrollHeightMovie * n );
		}		
		
		
	} // end class
	
} // end package
