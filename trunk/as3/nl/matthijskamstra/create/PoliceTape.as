/**
* PoliceTape (AS3), version 1.0
*
			var policeTape = PoliceTape.createPoliceTape (myExamObj, 18 , 20, myExamObj.bg_mc.width , false ,0xffffff );
			policeTape.y = PixelGrid.setOnGrid (20);
			policeTape.x = 26;
			var policeTape2 = PoliceTape.createPoliceTape (myExamObj, 18 , 20, 10000  , true, 0xff3333); // it doesn't work with number.maxvalue ????
			policeTape2.x = -1000; // [mck] always on the grid
			policeTape2.y = PixelGrid.setOnGrid (20);
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
* @class  	: 	PoliceTape
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	25-1-2008 16:31 
* 
*/
package nl.matthijskamstra.create {
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.events.Event;
	import flash.display.Stage;

	public class PoliceTape {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.create.PoliceTape;
		public static var CLASS_NAME : String = "PoliceTape";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.create.PoliceTape";
		// vars
		private var targetObj:Object;
		private var startingX:Number;
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.create.PoliceTape; // import
		*			var __PoliceTape : nl.matthijskamstra.create.PoliceTape = new nl.matthijskamstra.create.PoliceTape ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function PoliceTape( $targetObj:Object = null ) {
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $targetObj == null ) { return; } ;
			targetObj = $targetObj;
		}
		
		/**
		 * 
		 * @param	$targetObj			where to create the policeTape
		 * @param	$width				with of the stripes
		 * @param	$height				height of the stripes
		 * @param	$totalWidth			with of the policTape
		 * @param	$isAniAutostart		use animition (default false)
		 * @param	$color				color of the stripe (default 0xff3333)
		 * @param	$name				name of the policeTape (default PoliceTape)
		 * @param	$angle				angle for the stripes (default 0.6 ??? degrees ???)
		 * @return
		 */
		public static function createPoliceTape ($targetObj:Object , $width:Number, $height:Number, $totalWidth:Number = Number.MAX_VALUE, $isAniAutostart:Boolean = false,  $color:Number = 0xff3333, $name:String = '', $angle:Number = -.6 ):Object {
			if ( $targetObj == null ) { return null; } ;
			if ( isNaN ($width) ) { return null; } ;
			if ( isNaN ($height)) { return null; } ;
			
			var offset:Number =  16;
			
			if ($totalWidth == Number.MAX_VALUE || $totalWidth == 0) {
				$totalWidth = $targetObj.stage.stageWidth * 3;
			}
			
			var _PoliceTape:PoliceTape = new PoliceTape();
			_PoliceTape.targetObj = $targetObj;
			_PoliceTape.startingX = -1000;
			var containerShape:Sprite = new Sprite();
			if ($name == '') {
				containerShape.name = 'PoliceTape';
			} else {
				containerShape.name = $name;
			}
			
				var totalShapes:uint = Math.floor($totalWidth / (offset * 2));
			//var totalShapes:uint = Math.floor($totalWidth / ($width * 2));
			for (var i:int = 0; i < totalShapes; i++) {
				var x:Number = i * (offset * 2);
				//var x:Number = i * ($width * 2);
				_PoliceTape.doDrawRect(containerShape, x, 0, $width, $height, $color)
			}
			$targetObj.addChild (containerShape);
			
			var my_mc = containerShape;
			var skewX:Number = $angle;
			my_mc.transform.matrix = new Matrix( 1, 0, skewX, 1);
			if ($isAniAutostart){
				_PoliceTape.startAnimation (containerShape);
			}
			
			return (containerShape);
		}
		
		/**
		 * 
		 * @param	$targetObj
		 * @param	$x
		 * @param	$y
		 * @param	$width
		 * @param	$height
		 * @param	$color
		 */
		private function doDrawRect($targetObj:Object, $x:Number , $y:Number , $width:Number, $height:Number, $color:Number):void {
            var child:Shape = new Shape();
            child.graphics.beginFill($color);
            //child.graphics.lineStyle(borderSize, borderColor);
            child.graphics.drawRect($x, $y, $width, $height);
            child.graphics.endFill();
            $targetObj.addChild(child);
        }
		
		/**
		 * add listener to policeTape
		 */
		private function startAnimation ($targetObj) {
			// trace( "\t|\t\ startAnimation ---------------- " );
			// $targetObj.addEventListener(Event.RESIZE, resizeHandler);
			$targetObj.addEventListener(Event.ENTER_FRAME, onEnterFrameHandler);			
		}
		
		/**
		 * onenterframe move
		 */
		private function onEnterFrameHandler(e:Event):void {
			//trace( "onEnterFrameHandler -------------- e : " + e.target );
			var policeLine = e.target;
			// trace( "startingX : " + startingX );
			if (policeLine.x < startingX - 1000) {
				//trace( "policeLine.x : " + policeLine.x   );
				policeLine.x = startingX;
			}
			policeLine.x -= 1;
		}
		
		
	} // end class
	
} // end package
