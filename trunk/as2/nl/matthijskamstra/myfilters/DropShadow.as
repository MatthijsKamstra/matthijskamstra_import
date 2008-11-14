import flash.filters.DropShadowFilter;
/* 
 * DropShadow, version 1.0
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
 * @class : 	DropShadow
 * @author :  	Matthijs C. Kamstra [mck]
 * @version:
 * 
 */

class nl.matthijskamstra.myfilters.DropShadow {
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.myfilters.DropShadow;
	public static var CLASS_NAME : String = "DropShadow";
	public static var LINKAGE_ID : String = "nl.matthijskamstra.myfilters.DropShadow";
	// vars
	
	/**
	* create blur based upon FlashIDE values
	* 
	* @usage   	import nl.matthijskamstra.myfilters.DropShadow;
	*			var _dropshadow:DropShadow = new DropShadow (this.dropshadow_mc, {distance:5,
	*																	angleInDegrees:45,
	*																	color:0x000000,
	*																	alpha:1,
	*																	blurX:10,
	*																	blurY:10,
	*																	strength:40,
	*																	quality:3,
	*																	inner:false,
	*																	knockout:false,
	*																	hideObject:false
	*												});
	* @param	$target_mc		a reference to a movie clip or object
	* @param	$obj			extra values for filters
	*/
	public function DropShadow( $target_mc : MovieClip, $obj:Object )  {
		//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		//trace( "DropShadow.DropShadow > $target_mc : " + $target_mc + ", $obj : " + $obj );
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
		
		
		/**/
		var distance:Number			= $obj.distance || 20;
		var angleInDegrees:Number 	= $obj.degree || 45;
		var color:Number 			= $obj.color || 0x000000 ;
		var alpha:Number 			= $obj.alpha || 1;
		var blurX:Number 			= $obj.blurX || 6; // Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
		var blurY:Number 			= $obj.blurY || 6; // Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
		var strength:Number 		= $obj.strength || 120; // The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the shadow and the background. Valid values are 0 to 255. The default is 1.
		var quality:Number 			= $obj.quality || 1; // The number of times to apply the filter. Valid values are 0 to 15. The default value is 1, which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high quality.
		var inner:Boolean 			= $obj.inner || false;
		var knockout:Boolean 		= $obj.knockout || false;
		var hideObject:Boolean 		= $obj.hideObject || false;
 
		
		

		
		var filter:DropShadowFilter = new DropShadowFilter(distance, 
															angleInDegrees, 
															color, 
															alpha, 
															blurX, 
															blurY, 
															strength, 
															quality, 
															inner, 
															knockout, 
															hideObject);
															
		
		//trace( "filter : " + filter );
		
		//trace ('-------------------------------------');
		for(var l in filter){
			//trace('>> key: ' + l + ', value: ' + filter[l]);
		}
		
		
		var filterArray:Array = new Array();
		filterArray.push(filter);
		$target_mc.filters = filterArray;
	}
	
	/**
	* static function to call 
	* 
	* @usage 	nl.matthijskamstra.myfilters.DropShadow.initDropShadow (this.dropshadow_mc, {distance:5,
	*																	angleInDegrees:45,
	*																	color:0x000000,
	*																	alpha:1,
	*																	blurX:10,
	*																	blurY:10,
	*																	strength:40,
	*																	quality:3,
	*																	inner:false,
	*																	knockout:false,
	*																	hideObject:false
	*												});
	* 	
	* @param   $target_mc 		a reference to a movie clip or object
	* @param	$obj			extra values for filters
	*/
	static public function initDropShadow ($target_mc : MovieClip, $obj:Object) : Void {
		var __initDropShadow:nl.matthijskamstra.myfilters.DropShadow = new nl.matthijskamstra.myfilters.DropShadow ( $target_mc, $obj );
	}

} // end class
