/**
 *  @class         FPS
 *  @author        Wissarut Pimanmassuriya (wissar)
 *  @description   Create FPS Monitor
 *  @link		   http://www.lifeztream.com
 *  @usage         import com.lifeztream.debug.FPS;
 *                 FPS.start();
 * 
					import com.lifeztream.debug.FPS;
					var fps:FPS = new FPS();
					addChild(fps);
					//you must addChild before start, to get current framerate from stage obejct.
					//fps.start ([alignment:String="left"]);
					fps.start ();
  
 * 
 *                 output: FPS : Current frame per second of the movie, TE : Time elapsed, in milli-second, amoung a single frame.
 *  @language      Actionscript 3.0
*/
package com.lifeztream.debug {
	import flash.system.System;
//	import com.lifeztream.utils.BitmapContainer;
	import flash.display.*;
	import flash.geom.Matrix;
	import flash.events.*;
	import flash.utils.*;
	import flash.text.*;
	public class FPS extends Sprite	{
		
		/**
		* Enables copyright information to be retrieved at runtime or when reviewing a decompiled swf.
		*/
		public static var AUTHOR  :String = '(c) 2006-2007 Copyright by Wissarut Pimanmassuriya | lifeztream.com | wissar_p@hotmail.com';
		public static var VERSION:String = "1.2";	
		
		/**
		* Get current FPS
		*/
		public var currentFPS:Number;
		public var currentMemory:Number;
		/**
		* Get/Set box alignment on the screen, can be "left" or "right".
		*/
		public var ALIGN:String = "left";
		private var _isExpand:Boolean = false;
		
		private var log:Array;
		private var intervalID:uint;
		private var IMAGE:Sprite;
		private var TEXTFIELD:TextField;
		private var count:uint;
		private var WIDTH:uint = 100;
		private var HEIGHT:uint = 60;
		private const BORDER:uint = 2;
		private var median:uint;
		private var timeElapsed:uint;
		private var cTime:uint;
		private const intervaltimes:uint = 4;
		private var BITMAP:BitmapData;
	
		
		/**
		* Start using FPS Class. !You must addChild before run this.
		* @param	align	Alignment of the box on the screen, can be "left" or "right", default value is left.
		*/
		public function start (align:String="left"):void {
				try{
					if(stage == null){
						throw(new Error("You must addChild before call start function"));
					}
					addEventListener(Event.ENTER_FRAME,onEnterFrame);
					ALIGN = align;
					reset();
					IMAGE = new Sprite();
					addChildAt(IMAGE,0);
					var mcEnterFrame = function (e:Event) {
							if(ALIGN == "left"){
								e.target.x += (mouseX-e.target.x)*0.2;
							} else if (ALIGN == "right") {
								e.target.x += (mouseX-e.target.x-160)*0.2;
							}
							e.target.y += (mouseY-20-e.target.y)*0.2;
					}
					var bOver = function (e:MouseEvent) {	
						var mc:Sprite = new Sprite();
						
						var tf:TextFormat = new TextFormat("Georgia",11,0x2e2e2e);
						var tField:TextField = new TextField();
						tField.autoSize = TextFieldAutoSize.LEFT;
						tField.defaultTextFormat = tf;
						tField.background = true;
						tField.backgroundColor = 0x9e9e9e;
						tField.border = true;
						tField.borderColor = 0x000000;
						tField.selectable = false;
						tField.text = "FPS Monitor by Lifeztream.com";
						
						mc.addChild(tField);
						mc.addEventListener(Event.ENTER_FRAME,mcEnterFrame);	
						
						if(ALIGN == "left"){
							mc.x = mouseX;
						} else if (ALIGN == "right") {
							mc.x = mouseX-160;
						}
						mc.y = IMAGE.mouseY-20;
						
						addChild(mc).name = "rollover";
					};
					
					var bOut = function (e:Event) {
						getChildByName("rollover").removeEventListener(Event.ENTER_FRAME,mcEnterFrame);
						removeChild(getChildByName("rollover"));			
					};
					var bClick = function (e:Event) {
							isExpand = !isExpand;
					}
					
					addEventListener(MouseEvent.MOUSE_OVER,bOver);
					addEventListener(MouseEvent.MOUSE_OUT,bOut);
					addEventListener(MouseEvent.CLICK,bClick);
					
					TEXTFIELD = new TextField();
					TEXTFIELD.autoSize = TextFieldAutoSize.LEFT;
					var tf:TextFormat = new TextFormat("Georgia",10,0x9e9e9e);
					TEXTFIELD.x = BORDER;
					TEXTFIELD.y = BORDER;
					TEXTFIELD.defaultTextFormat =tf;
					TEXTFIELD.selectable = false;
					
					intervalID = setInterval(update,1000/intervaltimes);
					
					addChildAt(TEXTFIELD,1)
				} catch (e:Error){
					trace("ERROR : "+e.message)
				}
		}
		/**
		* Stop using FPS Class
		*/
		public function stop ():void {
				removeEventListener(Event.ENTER_FRAME,onEnterFrame);
				BITMAP.dispose();
				clearInterval(intervalID);
		}
		
			
		/****************************************************
		* PRIVATE FUNCTION
		****************************************************/
		private function update ():void {
				currentFPS = count*intervaltimes;
				currentMemory = System.totalMemory;
				count = 0;
				createLog();
				drawData();
		}
		private function get isExpand ():Boolean {
				return _isExpand;
		}
		private function set isExpand (b:Boolean) {
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
		private function reset ():void {
				count = 0;
				currentFPS = 0;
				currentMemory = System.totalMemory;
				median = stage.frameRate;
				log = new Array();
				timeElapsed = 0;
				cTime = 0;
		}
		private function onEnterFrame (e:Event):void {
			timeElapsed = getTimer()-cTime;
			cTime = getTimer();
			count++;	
		}
		private function drawData ():void {
			if(BITMAP!=null){
				BITMAP.dispose();
			}
			var m:Matrix = new Matrix();
			m.translate(BORDER,20);
			BITMAP = new BitmapData(WIDTH,HEIGHT,false,0x3e3e3e);
			BITMAP.draw(new Bitmap(new BitmapData(WIDTH-BORDER*2,HEIGHT-BORDER-20,false,0x121212)),m);
			BITMAP.setPixel(BORDER-1,(HEIGHT-BORDER)-getPointerHeight(stage.frameRate),0x00FFFF);
			var c = 0;
			if(log.length>(WIDTH-BORDER*2)/2){
				i = log.length-((WIDTH-BORDER*2)/2);
			} else {
				var i = 0;
			}
			for(i;i<log.length;i++,c++){
					var color:Number;
					if(log[i][0]>stage.frameRate*0.7){
						color = 0x007e00;
					} else if (log[i][0]>stage.frameRate*0.5){
						color = 0xFFFF80
					} else {
						color = 0xFF0000;
					}
					BITMAP.setPixel(BORDER+(c*2),(HEIGHT-BORDER)-getPointerHeight(log[i][0]),color);		
					BITMAP.setPixel(BORDER+(c*2)+1,(HEIGHT-BORDER)-getPointerMemoryHeight(log[i][1]),0x4E4E4E);	
			}
			IMAGE.addChildAt(new Bitmap(BITMAP),0);
			if(isExpand){
				TEXTFIELD.text = "FPS : "+currentFPS+"/ TE : "+timeElapsed+" ms./ MemUse : "+Math.round(currentMemory*0.00001)+" mb.";
			} else {
				TEXTFIELD.text = "F.T.M   "+currentFPS+"/ "+timeElapsed+"/ "+Math.round(currentMemory*0.00001) ;
			}
			if(ALIGN=="left"){
					x = 0;
			} else if (ALIGN=="right") {
					x = stage.stageWidth-WIDTH;
			}
		}
		private function getPointerHeight (n:Number):uint {
				var maxheight = HEIGHT-BORDER-20;
				var maxfps = stage.frameRate+10;
				return Math.round(maxheight*(n/maxfps));
		}
		private function getPointerMemoryHeight (n:Number):uint {
				var mem = Math.round(n*0.00001);
				var maxheight = HEIGHT-BORDER-20;
				var maxfps = 800;
				return Math.round(maxheight*(mem/maxfps));
		}
		private function createLog ():void {
			if (log.length >= Math.floor((WIDTH-BORDER*2)*0.5)){	
					log.shift();
					log.push([currentFPS,currentMemory]);
			} else {
					log.push([currentFPS,currentMemory]);
			}
			
		}
	}
}