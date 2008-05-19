/**
* Builder (AS3), version 1.0
*
* returns a value which you can use in a grid
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
* @class  	: 	Builder
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3) >> converted from AS2
* 				r2.0 - extra functions for reading object ipv array and getters/setters
* 				r2.1 - $MaxVertical:uint = uint.MAX_VALUE added
* 				r2.2 - static are changed to private
* @since 	:	4-12-2007 17:33 
* 
*/
package nl.matthijskamstra.grid { 
	
	// import
	
	public class Builder {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.grid.Builder;
		public static var CLASS_NAME : String = "Builder";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.grid.Builder";
		// default values
		private var startXpos:uint;
		private var startYpos:uint;
		private var OffsetX:uint;
		private var OffsetY:uint;
		private var MaxHorizontal:uint;
		private var MaxVertical:uint;
		// controler x/y positions
		private var gridcounterX:uint;
		private var gridcounterY:uint;
		//
		/**
		 * Constructor
		 * 
  		 * @usage		import nl.matthijskamstra.grid.Builder; // import
		 * 				var _builder:Builder = new Builder (0,0,squareWidth,squareHeight,maxXNumber,maxYNumber);
		 * @param	$startXpos			starting x-position of the grid
		 * @param	$startYpos			starting y-position of the grid
		 * @param	$OffsetX			offset in x-direction. This value is without width image. (Default 20pixels)
		 * @param	$OffsetY			offset in y-direction. Tthis value is without width image. (Default 20pixels)
		 * @param	$MaxHorizontal		maximum images horizontal. (Default 10)
		 * @param	$MaxVertical		maximum images vertical. (Default 10)
		 */
		public function Builder ($startXpos:Number=NaN, $startYpos:Number=NaN , $OffsetX:uint=20, $OffsetY:uint=20, $MaxHorizontal:uint=10, $MaxVertical:uint=uint.MAX_VALUE) {
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if (isNaN ($startXpos )) { return; }
			setDefaultValues ($startXpos, $startYpos, $OffsetX, $OffsetY, $MaxHorizontal, $MaxVertical);
		}
		/**
 		 * @usage		import nl.matthijskamstra.grid.Builder; // import
		 * 				var _builder:Builder = new Builder();
		 * 				var _builder.setDefaultValues (0,0,squareWidth,squareHeight,maxXNumber,maxYNumber);
		 * @param	$startXpos			starting x-position of the grid
		 * @param	$startYpos			starting y-position of the grid
		 * @param	$OffsetX			offset in x-direction. This value is without width image. (Default 20pixels)
		 * @param	$OffsetY			offset in y-direction. Tthis value is without width image. (Default 20pixels)
		 * @param	$MaxHorizontal		maximum images horizontal. (Default 10)
		 * @param	$MaxVertical		maximum images vertical. (Default 10)
		 */
		public function setDefaultValues ($startXpos:Number=NaN, $startYpos:Number=NaN , $OffsetX:uint=20, $OffsetY:uint=20, $MaxHorizontal:uint=10, $MaxVertical:uint=uint.MAX_VALUE){
			//trace( "\t|\t setDefaultValues");
			startXpos = $startXpos ;
			startYpos = $startYpos ;
			OffsetX = $OffsetX ;
			OffsetY = $OffsetY ;
			MaxHorizontal = $MaxHorizontal ;
			MaxVertical = $MaxVertical ;
			//trace ("default settings are changed !!")
		}
		
		/**
		 * @usage		import  nl.matthijskamstra.grid
		 * 				var _builder:Builder = new Builder();
		 *				var _gridArray:Array = _builder.getGridPosition ();
		 * @return		Array with xPos and yPos in pixels
		 */
		public function getGridPosition ():Array{
			if (gridcounterX >= MaxHorizontal){
				gridcounterX = 0;
				gridcounterY ++;
				if (gridcounterY >= MaxVertical) {
					gridcounterX = 0;
					gridcounterY = 0;
				}
			}
			var xPos:uint = startXpos + (gridcounterX * OffsetX);
			var yPos:uint = startYpos + (gridcounterY * OffsetY);
			gridcounterX ++;
			return ([xPos, yPos]);
		}
		
		/**
		 * @usage		import  nl.matthijskamstra.grid
		 * 				var _builder:Builder = new Builder();
		 *				var _gridObject:Object = _builder.getGridPositionObject ();
		 * 				// trace (_gridObject.x);
		 * @return		Object with x and y in pixels 
		 */		
		public function getGridPositionObject ():Object {
			var _gridArray:Array = getGridPosition ();
			return ({x:_gridArray[0], y:_gridArray[1]});
		}
		
		
		///////////////////////// getters and setters /////////////////////////
		/**
		 * 
		 * get:		var __values:Builder = new Builder ();
		 *			trace( "__values.values : " + __values.values );
		 * set: 	__values.values = $value ;
		 *			trace( "__values.values : " + __values.values);
		*/
		public function set values( $valueObject:Object)  {
			// 
			startXpos = $valueObject.startXpos ;
			startYpos = $valueObject.startYpos ;
			OffsetX = $valueObject.OffsetX ;
			OffsetY = $valueObject.OffsetY ;
			MaxHorizontal = $valueObject.MaxHorizontal ;
			MaxVertical = $valueObject.MaxVertical ;
		}
		public function get values() {
			return ({startXpos:startXpos, startYpos:startYpos, OffsetX:OffsetX, OffsetY:OffsetY, MaxHorizontal:MaxHorizontal, MaxVertical:MaxVertical});
		}
		
		/**
		 * same as above, but with static function
		 * 
		 * @usage  		nl.matthijskamstra.grid.Builder.getGridPos();
		 * 
		 * 				import nl.matthijskamstra.grid.Builder;
		 * 				var _gridArray:Array = Builder.getGridPos ();
		 * 				trace ('\t|\t xpos: ' + _gridArray[0] + '\t ypos: ' + _gridArray[1])
		 * @return		Array with xPos and yPos in pixels
		 */
		public static function getGridPos ():Array {
			var myGridBuilder:Builder = new Builder();
			var _gridArray:Array = myGridBuilder.getGridPosition ();
			return (_gridArray);
		}
	}
	
}