/**
 *  @class         FPS
 *  @author        Wissarut Pimanmassuriya (wissar)
 *  @description   Create FPS Monitor
 *  @link		   http://www.lifeztream.com
 *  @usage         import com.lifeztream.debug.FPS;
 *                 FPS.start();
 *                 output: FPS : Current frame per second of the movie, TE : Time elapsed, in milli-second, amoung a single frame.
 *  @language      Actionscript 2.0
*/
import flash.display.BitmapData;
import flash.geom.Matrix;
import mx.transitions.OnEnterFrameBeacon;
class com.lifeztream.debug.FPS
{
	/**
	* Get current FPS
	*/
	public static var currentFPS:Number;
	public static var VERSION:String = "1.2";
	/**
	* Get/Set box alignment on the screen, can be "left" or "right".
	*/
	public static var ALIGN:String = "left";
	/**
	* Enables copyright information to be retrieved at runtime or when reviewing a decompiled swf.
	*/
	public static var AUTHOR  :String = '(c) 2006-2007 Copyright by Wissarut Pimanmassuriya | lifeztream.com | wissar_p@hotmail.com';
	
	private static var _isExpand:Boolean = false;
	private static var intervaltimes:Number = 4;
	private static var isCreated:Boolean = false;
	private static var intervalID:Number;
	private static var CONTAINER:MovieClip;
	private static var TEXTFIELD:TextField;
	private static var count:Number;
	private static var log:Array;
	private static var WIDTH:Number = 100;
	private static var HEIGHT:Number = 60;
	private static var BORDER:Number = 2;
	private static var BITMAP:BitmapData;
	private static var movieFPS:Number;
	private static var median:Number;
	private static var timeElapsed:Number;
	private static var cTime:Number;
	
	/**
	* Start using FPS Class.
	* @param	setfps	FRAMERATES of the flash movie.
	* @param	align	Alignment of the box on the screen, can be "left" or "right", default value is left.
	*/
	public static function start (setfps:Number,align:String):Void {
			if(!isCreated){
				ALIGN = (align == undefined) ? "left" : align;
				movieFPS = setfps;
				reset();
				OnEnterFrameBeacon.init();
				MovieClip.addListener(FPS);
				CONTAINER = _level0.createEmptyMovieClip("FPSCONTAINER",9998788);
				CONTAINER.onUnload = function () {			FPS.stop()			};
				var b = CONTAINER.createEmptyMovieClip("bitmap",2);
				b.onRollOver = b.onDragOver = function () {	
					var mc:MovieClip = CONTAINER.createEmptyMovieClip("TOOLTIP",30);
					var tf:TextFormat = new TextFormat("Georgia",11,0x2e2e2e);
					var tField:TextField = mc.createTextField("TIP",25,0,0,100,10);
					tField.autoSize = true;
					tField.setNewTextFormat(tf);
					tField.text = "FPS Monitor by Lifeztream.com";
					tField.background = true;
					tField.backgroundColor = 0x9e9e9e;
					tField.border = true;
					tField.borderColor = 0x000000;
					tField.selectable = false;
					var ref = this;
					if(FPS.ALIGN == "left"){
						mc._x = this._xmouse;
					} else if (FPS.ALIGN == "right") {
						mc._x = this._xmouse-160;
					}
					mc._y = this._ymouse-20;
					mc.onEnterFrame = function () {
						if(FPS.ALIGN == "left"){
							this._x += (ref._xmouse-this._x)*0.2;
						} else if (FPS.ALIGN == "right") {
							this._x += (ref._xmouse-this._x-160)*0.2;
						}
						this._y += (ref._ymouse-20-this._y)*0.2;
					}
				};
				b.onRollOut = b.onDragOut = b.onReleaseOutside = function () {
					CONTAINER.TOOLTIP.onEnterFrame = null;
					CONTAINER.TOOLTIP.removeMovieClip();			
				};
				b.onRelease = function () {
						FPS.isExpand = !FPS.isExpand;
				}
				b.useHandCursor = false;
				TEXTFIELD = CONTAINER.createTextField("FPSFIELD",25,0,0,10,10);
				TEXTFIELD.autoSize = true;
				var tf:TextFormat = new TextFormat("Georgia",10,0x9e9e9e);
				TEXTFIELD._x = BORDER;
				TEXTFIELD._y = BORDER;
				TEXTFIELD.setNewTextFormat(tf);
				TEXTFIELD.selectable = false;
				intervalID = setInterval(FPS.update,1000/intervaltimes);
				isCreated = true;
			}
	}
	/**
	* Stop using FPS Class
	*/
	public static function stop ():Void {
			MovieClip.removeListener(FPS);
			BITMAP.dispose();
			clearInterval(intervalID);
	}
	public static function update ():Void {
			currentFPS = count*intervaltimes;
			count = 0;
			createLog();
			drawData();
	}
	public static function get isExpand ():Boolean {
			return _isExpand;
	}
	public static function set isExpand (b:Boolean) {
			_isExpand = b;
			if(b){
				WIDTH = 200;
				HEIGHT = 120;
			} else {
				WIDTH = 100;
				HEIGHT = 60;
			}
	}
	public static function tostring ():String {
			return "com.lifeztream.debug.FPS, version:"+VERSION;
	}
	/****************************************************
	* PRIVATE FUNCTION
	****************************************************/
	private static function reset ():Void {
			count = 0;
			currentFPS = 0;
			median = movieFPS;
			log = new Array();
			timeElapsed = 0;
			cTime = 0;
	}
	private static function onEnterFrame ():Void {
		timeElapsed = getTimer()-cTime;
		cTime = getTimer();
		count++;	
	}
	private static function drawData ():Void {
		BITMAP.dispose();
		var m:Matrix = new Matrix();
		m.translate(BORDER,20);
		BITMAP = new BitmapData(WIDTH,HEIGHT,false,0x3e3e3e);
		BITMAP.draw(new BitmapData(WIDTH-BORDER*2,HEIGHT-BORDER-20,false,0x121212),m);
		BITMAP.setPixel(BORDER-1,(HEIGHT-BORDER)-getPointerHeight(movieFPS),0x00FFFF);
		var c = 0;
		if(log.length>(WIDTH-BORDER*2)/2){
			i = log.length-((WIDTH-BORDER*2)/2);
		} else {
			var i = 0;
		}
		for(i;i<log.length;i++){
				var x = BORDER+(c*2);
				if(log[i]>movieFPS*0.7){
					var color = 0x007e00;
				} else if (log[i]>movieFPS*0.5){
					var color = 0xFFFF80
				} else {
					var color = 0xFF0000;
				}
				
				BITMAP.setPixel(x,(HEIGHT-BORDER)-getPointerHeight(log[i]),color);
				c++;
		}
		CONTAINER.bitmap.attachBitmap(BITMAP,10);
		
		TEXTFIELD.text = "FPS : "+currentFPS+", TE : "+timeElapsed+" ms.";
		if(ALIGN=="left"){
				CONTAINER._x = 0;
		} else if (ALIGN=="right") {
				CONTAINER._x = Stage.width-WIDTH;
		}
	}
	private static function getPointerHeight (n:Number):Number {
			var maxheight = HEIGHT-BORDER-20;
			var maxfps = movieFPS+10;
			return Math.round(maxheight*(n/maxfps));
	}
	private static function createLog ():Void {
		if (log.length >= Math.floor((WIDTH-BORDER*2))){	
				log.shift();
				log.push(currentFPS);
		} else {
				log.push(currentFPS);
		}
		
	}
}
