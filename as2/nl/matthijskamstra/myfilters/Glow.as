import flash.filters.GlowFilter;
/* 
 * Glow, version 1.0
 *
 * Convert values from FlashIDE to AS2
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
 * @class : 	Glow
 * @author :  	Matthijs C. Kamstra [mck]
 * @version:
 *		v01.1 - quality not given use 2
 *		v01.0 - class creation
 * @since :		17-10-2008 11:33 
 * 
 */

class nl.matthijskamstra.myfilters.Glow {
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.myfilters.Glow;
	public static var CLASS_NAME : String = "Glow";
	public static var LINKAGE_ID : String = "nl.matthijskamstra.myfilters.Glow";
	// vars
	
	/**
	* create blur based upon FlashIDE values
	* 
	* @usage   	import nl.matthijskamstra.myfilters.Glow;
	* 			var __Glow:Glow = new Glow (this.foobar_mc, {	color: 0xFFFFFF, 
	*															alpha: 50, 
	*															blurX: 50, 
	*															blurY: 50, 
	*															strength: 50, 
	*															quality: "High", 
	*															inner: false, 
	*															knockout: false
	* 														});
	* @param	$target_mc		a reference to a movie clip or object
	* @param	$obj			extra values for filters
	*/
	public function Glow( $target_mc : MovieClip, $obj:Object )  {
		//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		//trace( "Glow.Glow > $target_mc : " + $target_mc + ", $obj : " + $obj );
		if ( $target_mc == null ) { return; }
		
		//trace ('-------------------------------------');
		for(var l in $obj){
		   //trace('key: ' + l + ', value: ' + $obj[l]);
		}
		
		
		if ($obj.alpha > 1 ) { $obj.alpha  /= 100; }
		/*		
 		$obj.blurX = Math.floor((($obj.blurX / 100) * 255) / 2 ) * 2;
		$obj.blurY = Math.floor((($obj.blurY / 100) * 255) / 2 ) * 2;
		$obj.strength = Math.floor (($obj.strength / 100) * 255);
		*/
		$obj.strength =  ( $obj.strength * 0.01 ) ; // strange 
		
		
		// Low Medium High
		if (isNaN ($obj.quality)) {
			// string
			var temp = $obj.quality.toString().toLowerCase()
			switch (temp) {
				case "low":
					$obj.quality = 1;
					break;	
				case "medium":
					$obj.quality = 2;
					break;
				case "high":
					$obj.quality = 3;
					break;
				default:
					$obj.quality = 2;
					// trace("case '"+temp+"':\r\ttrace ('--- "+temp+"');\r\tbreak;" );
			}
		} else {
			// number
			if ($obj.quality > 3) { $obj.quality = 3; }
		}
		
		var color:Number 		= $obj.color || 0x000000 ;
		var alpha:Number 		= $obj.alpha || 1;
		var blurX:Number 		= $obj.blurX || 6; // Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
		var blurY:Number 		= $obj.blurY || 6; // Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
		var strength:Number 	= $obj.strength || 2; 
		var quality:Number 		= $obj.quality || 1; // The default value is 1, which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high quality.
		var inner:Boolean 		= $obj.inner || false;
		var knockout:Boolean 	= $obj.knockout || false;

		var filter:GlowFilter = new GlowFilter(color, 
												alpha, 
												blurX, 
												blurY, 
												strength, 
												quality, 
												inner, 
												knockout);
		//trace( "filter : " + filter );
		
		//trace ('-------------------------------------');
		for(var l in filter){
		   //trace('key: ' + l + ', value: ' + filter[l]);
		}
		
		
		var filterArray:Array = new Array();
		filterArray.push(filter);
		$target_mc.filters = filterArray;
	}
	
	/**
	* static function to call 
	* 
	* @usage 	nl.matthijskamstra.myfilters.Glow.initGlow (this.foobar_mc, {	color: 0x000000, 
	*																				alpha: 100, 
	* 																				blurX: 5, 
	* 																				blurY: 5, 
	* 																				strength: 50, 
	* 																				quality: "High", 
	* 																				inner: false, 
	* 																				knockout: false
	* 																				});
	* 	
	* @param   $target_mc 		a reference to a movie clip or object
	* @param	$obj			extra values for filters
	*/
	static public function initGlow ($target_mc : MovieClip, $obj:Object) : Void {
		var __initGlow:nl.matthijskamstra.myfilters.Glow = new nl.matthijskamstra.myfilters.Glow ( $target_mc, $obj );
	}

} // end class
