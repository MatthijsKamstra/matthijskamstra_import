/* 
 * HighLightButton, version 1.1
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
 * @class : 	HighLightButton
 * @author :  	Matthijs C. Kamstra [mck]
 * @version:
 *		r1.1 - onrelease will work like a radiobutton; it will jump to select and 
 *		r1.0 - class creation
 * @since :		13-3-2008 12:24 
 * 
 */

class nl.matthijskamstra.motiondesign.HighLightButton extends MovieClip{
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.motiondesign.HighLightButton;
	public static var CLASS_NAME:String = "HighLightButton";
	public static var LINKAGE_ID:String = "nl.matthijskamstra.motiondesign.HighLightButton";
	// vars
	private var target_mc:MovieClip;
	private var hitArea_mc:MovieClip
	private var isSelected:Boolean = false;
	/**
	* Constructor
	*/
	public function HighLightButton ()  {
		// trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		init (this);
	}
	
	/**
	* start this class 
	* 
	* @usage   var __HighLightButton : nl.matthijskamstra.motiondesign.HighLightButton = new nl.matthijskamstra.motiondesign.HighLightButton ();
	* 			__HighLightButton.init (_root.movie_mc);
	* @param   $target_mc 		a reference to a movie clip or object
	*/
	private function init ( $target_mc ):Void {
		target_mc = $target_mc ;
		
		if (target_mc.hitArea_mc == null) {
			hitArea_mc = createHitArea_mc ();
		} else {
			hitArea_mc = target_mc.hitArea_mc;
		}
		
		setupButton ();
		
		// ff checken of de hele movie all klaar is met laden en dan pas infaden
		target_mc.onEnterFrame = function () {
			if (target_mc.getBytesLoaded() == target_mc.getBytesTotal()) {
				// trace( target_mc.getBytesLoaded()+'/'+target_mc.getBytesTotal() );
				target_mc.onEnterFrame = null;
				fadeButtonIn ();
			}
		}
	}

	/**
	 * 
	 */
	private function fadeButtonIn ():Void {
		target_mc._alpha = 100;
		hitArea_mc._parent.gotoAndPlay ('_fadeIn');
	}
	
	/**
	 * create all actions that a button has: onRollOver, onRollOut, onRelease, onPress
	 */
	private function setupButton ():Void {
		var thisObj = this; // thisObj.
		hitArea_mc.onRollOver = function () { 
			if (isSelected) {
				thisObj.target_mc.gotoAndPlay ('_select');
			} else {
				thisObj.target_mc.gotoAndPlay ('_over');  
			}
			
		}
		hitArea_mc.onRollOut = function () { 
			if (isSelected) {
				thisObj.target_mc.gotoAndPlay ('_select');
			} else {
				thisObj.target_mc.gotoAndPlay ('_out'); 
			}
		}		
		hitArea_mc.onPress = function () { thisObj.target_mc.gotoAndPlay ('_down');}
		hitArea_mc.onRelease = hitArea_mc.onReleaseOutside = function () { 
			if (isSelected){
				thisObj.target_mc.gotoAndPlay ('_release');
				isSelected = false;
			} else {
				thisObj.target_mc.gotoAndPlay ('_select');
				isSelected = true;
			}
		}
	}
	
	/**
	 * if there is no hitArea_mc, this will be created here
	 * but the size of the movie (width and height) will be used 
	 * (masked movies will be treated asif there are no masks )
	 * 
	 * @return		movieclip created here
	 */
	private function createHitArea_mc ():MovieClip {
		var hit_mc:MovieClip = target_mc.createEmptyMovieClip ('hitArea_mc' , target_mc.getNextHighestDepth() );
		hit_mc.beginFill(0xFF00FF, 0);
		hit_mc.moveTo(0, 0);
		hit_mc.lineTo(target_mc._width, 0);
		hit_mc.lineTo(target_mc._width, target_mc._height);
		hit_mc.lineTo(0, target_mc._height);
		hit_mc.lineTo(0, 0);
		hit_mc.endFill();
		
		return hit_mc;
	}
	
} // end class
