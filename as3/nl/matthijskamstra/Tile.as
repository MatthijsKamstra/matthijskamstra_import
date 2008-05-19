	/**
* Tile (AS3), version 1.0
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
* @class  	: 	Tile
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	5-12-2007 12:09
* 
*/
package nl.matthijskamstra {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.utils.Timer;

	public class Tile extends Sprite {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.Tile ;
		public static var CLASS_NAME : String = "Tile";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.Tile";
		// vars
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.Tile; // import
		*			var __Tile__ : nl.matthijskamstra.Tile = new nl.matthijskamstra.Tile ( this );
		* @param	$target_mc		a reference to a movie clip or object
		*/
		public function Tile ( $target_mc:MovieClip = null ) {
			
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ($target_mc == null) { return; }
			
			var backGroundSprite:Sprite = new Sprite();
			backGroundSprite.name = 'background_mc';
			backGroundSprite.graphics.beginBitmapFill(new pixel3grid_png(0, 0));
			backGroundSprite.graphics.drawRect(0, 0, $target_mc.stage.stageWidth, $target_mc.stage.stageHeight);
			backGroundSprite.graphics.endFill();
			$target_mc.addChild(backGroundSprite);
			
		}
		/**
		 * send a bitmap from the library (linkage) to create a pattern.		  
		 * 
		 * @usage
		 * 			// create instance of RomeImage bitmap data (linkage from the library)
		 *			var patternImg:pattern2 = new pattern2 (0, 0);
		 * 			// create a bitmap instance that references the patternImg instance
		 *			var patternBitmap:Bitmap = new Bitmap(patternImg);
		 *			// create a bitmapData 
		 *			var bitmapData:BitmapData = patternBitmap.bitmapData;
		 * 		or
		 * 			import nl.matthijskamstra.Tile; //import
		 * 			import flash.display.*;
		 * 			var bitmapData:BitmapData = new Bitmap ( new pattern2 (0,0) ).bitmapData;
		 * 			var __useTile:nl.matthijskamstra.Tile = new nl.matthijskamstra.Tile ();
		 * 			__useTile.useTile (this, bitmapData);
		 * 
		 * @param	$target_mc		a reference to a movie clip or object
		 * @param	$bitmapData		bitmap data used for a pattern
		 */
		public function useTile ( $target_mc:MovieClip, $bitmapData:BitmapData  ):void{
			if ($target_mc == null) { return; }
			if ($bitmapData == null) { return; }
			
			var backGroundSprite:Sprite = new Sprite();
			backGroundSprite.name = 'background_mc';
			backGroundSprite.graphics.beginBitmapFill($bitmapData);
			backGroundSprite.graphics.drawRect(0, 0, $target_mc.stage.stageWidth, $target_mc.stage.stageHeight);
			backGroundSprite.graphics.endFill();
			$target_mc.addChild(backGroundSprite);
			
		}
		/**
		 * @usage	nl.matthijskamstra.Tile.useTileClass (this, new imgInLibrary (0,0));
		 * @param	$target_mc
		 * @param	$class
		 */
		static public function useTileClass ($target_mc:MovieClip, $class:*):void {
			var _bitmapData:BitmapData = new Bitmap ( $class ).bitmapData;
			var _tile:Tile = new Tile ();
			_tile.useTile ( $target_mc, _bitmapData );
		}
		
		/**
		 * @usage	nl.matthijskamstra.Tile.useTileClassCustom (this, new imgInLibrary (0,0) , NaN , 20 , 100 , 500 , 'test');
		 * 
		 * @param	$target_mc		a reference to a movie clip or object
		 * @param	$class			custom bitmap class (linkage from the library)
		 * @param	$xPos			x in pixels; default 0
		 * @param	$yPos			y in pixels; default 0
		 * @param	$width			width of the tile; default stageWidht
		 * @param	$height			height of the tile; default stageHeight
		 * @param	$name			name of sprite
		 */
		static public function useTileClassCustom ( $target_mc:MovieClip, $class:* , $xPos:Number = 0, $yPos:Number = 0, $width:Number = NaN, $height:Number = NaN ,  $name:String = null):void {
			if ($target_mc == null) { return; }
			if ($class == null) { return; }
			
			if (isNaN ($width)) { $width = $target_mc.stage.stageWidth; }
			if (isNaN ($height)) { $height = $target_mc.stage.stageHeight; }
			
			var _bitmapData:BitmapData = new Bitmap ( $class ).bitmapData;
			
			var backGroundSprite:Sprite = new Sprite();
			if ($name != null) {
				backGroundSprite.name = $name;
			} else {
				backGroundSprite.name = 'background_mc';
			}
			backGroundSprite.graphics.beginBitmapFill(_bitmapData);
			backGroundSprite.graphics.drawRect($xPos, $yPos, $width,  $height);
			backGroundSprite.graphics.endFill();
			$target_mc.addChild(backGroundSprite);
		}
		/**
		 * create a tile image 
		 * 
		 * @usage	nl.matthijskamstra.Tile.createTile (this, new imgInLibrary (0,0) ,{y:20 , width:100 , height:500 , name:'test'});
		 *
		 * @param	$target_mc		a reference to a movie clip or object
		 * @param	$class			custom bitmap class (linkage from the library)		
		 * @param	$object			x, y, width, height, name in a object for tile image
		 */
		static public function createTile ( $target_mc:MovieClip, $class:* , $object:Object ):void {
			//trace( "$target_mc : " + $target_mc );
			//for( var i:String in $object ) trace( "key : " + i + ", value : " + $object[ i ] );
			if ($target_mc == null) { return; }
			if ($class == null) { return; }
			
			if (isNaN ($object.width)) { $object.width = $target_mc.stage.stageWidth; }
			if (isNaN ($object.height)) { $object.height = $target_mc.stage.stageHeight; }
			if (isNaN ($object.x)) { $object.x = 0; }
			if (isNaN ($object.y)) { $object.y = 0; }
			//if (isNaN ($Object.posX) ) { $Object.posX = 0; }
			//if (isNaN ($Object.posY) ) { $Object.posY = 0; }
			
			
			var _bitmapData:BitmapData = new Bitmap ( $class ).bitmapData;
			
			var backGroundSprite:Sprite = new Sprite();
			if ($object.name != null) { backGroundSprite.name = $object.name; } 
			backGroundSprite.graphics.beginBitmapFill(_bitmapData);
			backGroundSprite.graphics.drawRect($object.x, $object.y, $object.width,  $object.height);
			backGroundSprite.graphics.endFill();
			
			//backGroundSprite.x = $Object.posX;
			//backGroundSprite.y = $Object.posY;
			
			$target_mc.addChild(backGroundSprite);
		}
		
		/**
		 * @usage	nl.matthijskamstra.Tile.useTileClassCustom3 (this, new imgInLibrary (0,0) ,{y:20 , width:100 , height:500 , name:'test'});
		*/
		static public function useTileClassCustom3 ( $target_mc:* , $class:* , $object:Object):void {
			//trace( "$target_mc : " + $target_mc );
			//for( var i:String in $object ) trace( "key : " + i + ", value : " + $object[ i ] );
			if ($target_mc == null) { return; }
			if ($class == null) { return; }
			
			if (isNaN ($object.width)) { $object.width = $target_mc.stage.stageWidth; }
			if (isNaN ($object.height)) { $object.height = $target_mc.stage.stageHeight; }
			if (isNaN ($object.x)) { $object.x = 0; }
			if (isNaN ($object.y)) { $object.y = 0; }
			
			var _bitmapData:BitmapData = new Bitmap ( $class ).bitmapData;
			
			var backGroundSprite:Sprite = new Sprite();
			if ($object.name != null) { backGroundSprite.name = $object.name; } 
			backGroundSprite.graphics.beginBitmapFill(_bitmapData);
			backGroundSprite.graphics.drawRect($object.x, $object.y, $object.width,  $object.height);
			backGroundSprite.graphics.endFill();
			$target_mc.addChild(backGroundSprite);
		}

		
	} // end class
	
} // end package
