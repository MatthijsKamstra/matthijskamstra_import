/**
* AniText (AS3), version 1.0
*
* a textField with the correct content, fonts need to be embedded
* 
* 
* 			var ani:AniText = new AniText ();
* 			ani.useTextField ($useTextField);
* 
* 
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
* @class  	: 	AniText
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	7-5-2008 10:32 
* 
* Changelog:
*
* 		v1.0 [07-05-2008] - Initial release
*
*/
package nl.matthijskamstra.motion {
	
	import fl.motion.easing.Circular;
	import flash.display.*;
	import flash.events.*;	
	import flash.text.TextField;
	import flash.text.TextFormat;
	import fl.motion.easing.Quartic;
	import flash.utils.Timer;
	import gs.TweenFilterLite;
	import gs.TweenLite;

	public class AniText {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.motion.AniText;
		public static var CLASS_NAME : String = "AniText";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.motion.AniText";
		
		// vars
		private var myTimer:Timer;
		private var characterContainer:Sprite;
		private var storeTextFormat:TextFormat;
		private var lineCounter:uint;
		private var charCounter:uint = 0;
		private var _useTextField:TextField;
		private var _parent:Object;
		private var textFieldIsReady:Boolean = false;
		
		
		// public static var targetObj:DisplayObjectContainer;		
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.motion.AniText; // import
		*			var __AniText:nl.matthijskamstra.motion.AniText = new nl.matthijskamstra.motion.AniText ( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function AniText( $targetObj:DisplayObjectContainer = null ) {
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $targetObj == null ) { return; } ;
			//targetObj = $targetObj;
			//initAniText ( targetObj ) ;
		}
		
		
		public function useTextField( $targetObj:TextField ) {
			trace ( '+ ' + CLASS_NAME + ' useTextField ( ' + $targetObj.name + ' )');
			
			var useTextField:TextField = $targetObj;
			var targetObj:Object = $targetObj.parent;
			
			useTextField.alpha = 0; 				// hide original textField
			useTextField.border = true; 			// [mck] start debuggin
			useTextField.borderColor = 0xff3333; 	// [mck] end debuggin
			
			
			var storeTextFormat:TextFormat  = useTextField.getTextFormat();
			
			var characterContainer:Sprite = new Sprite();
			characterContainer.name = 'txtAniContainer_' + $targetObj.name.toString();
			// [mck] start debuggin
			/*var child:Shape = new Shape();
            child.graphics.beginFill(0x00FF00);
            child.graphics.lineStyle(1, 0x000000);
            child.graphics.drawRect(0, 0, 10, 10 );
            child.graphics.endFill();
            characterContainer.addChild(child);*/
			// [mck] end debuggin
			
			for (var i:int = 0; i < useTextField.text.length; i++) {
				
				//trace ('// -' + i + ' - [mck] start');
				
				if (useTextField.text.split('')[i].toString() != '\r') { // make sure that the character is not [Enter]
				
					// trace( "useTextField.getCharBoundaries ("+i+") : " + useTextField.getCharBoundaries (i) + " : " + useTextField.getCharBoundaries (i).x );
					var tempChar  = useTextField.text.split('')[i];
					//trace("'" + tempChar.charAt(0) + "' - " + tempChar.charCodeAt(0));
					
					// TextField
					var letter:TextField = new TextField();
					/*	
					letter.x = useTextField.x + useTextField.getCharBoundaries (i).x ;
					letter.y = useTextField.y + useTextField.getCharBoundaries (i).y;
					*/
					letter.x = useTextField.getCharBoundaries (i).x ;
					letter.y = useTextField.getCharBoundaries (i).y;
					letter.text = useTextField.text.split('')[i];
					letter.embedFonts = true;
					letter.selectable = false;
					letter.autoSize = 'left';
					
					// [mck] debuggin
					/*
					letter.border = true;
					letter.borderColor = 0xFF00FF;
					*/
					
					
					// TextFormat
					var format:TextFormat = storeTextFormat;
					format.align = 'left';
					format.color = 0xDE0000;
					letter.setTextFormat(format);
					
					
					//letter.mouseEnabled = false	;
					//letter.mouseChildren = false;	
					
					//TweenFilterLite.from(letter, 0.5, {blurFilter:{blurX:20, blurY:20}, delay:2+(i*.01), overwrite:false});
					
					var useThisDelay:Number = 0;
					if (useTextField.text.length <= 12) {
						useThisDelay = 0.15;
					} else {
						useThisDelay = 0.01;
					}
					
					/*
					t:Number — Specifies the current time, between 0 and duration inclusive.  
					b:Number — Specifies the initial value of the animation property.  
					c:Number — Specifies the total change in the animation property.  
					d:Number — Specifies the duration of the motion.  
					*/
					var q:Number = Circular.easeIn( i , 0 , 5, useTextField.text.length);
					//var q:Number = Quartic.easeInOut( i , 0 , 5, useTextField.text.length);
					trace( "q : " + q.toFixed(2) );
					
					//TweenLite.from(letter, 0.5, {alpha:0, delay:(i*useThisDelay)});
					TweenLite.from(letter, 0.5, {alpha:0, delay:q.toFixed(2)});
					
					characterContainer.addChild (letter);
				}
				
				characterContainer.rotation = useTextField.rotation;
				characterContainer.x = useTextField.x;
				characterContainer.y = useTextField.y;
				
				TweenFilterLite.to (characterContainer, 0 , { blurFilter: { blurX:2, blurY:2 }} );
				
				targetObj.addChild (characterContainer);
				
				
				
				//trace ('// ' + i + ' - [mck] end');
				
			}

		}
		
		public function buildTextField( $targetObj:TextField ) {
			trace ( '+ ' + CLASS_NAME + ' buildTextField ( ' + $targetObj.name + ' )');
			
			_useTextField = $targetObj;
			_parent = $targetObj.parent;
			
			_useTextField.alpha = 0; 				// hide original textField
			_useTextField.border = true; 			// [mck] start debuggin
			_useTextField.borderColor = 0xff3333; 	// [mck] end debuggin
			
			
			storeTextFormat  = _useTextField.getTextFormat();
			lineCounter = _useTextField.text.length;
			charCounter = 0;
			
			characterContainer = new Sprite();
			characterContainer.name = 'txtAniContainer_' + $targetObj.name.toString();
			//_parent.addChild (characterContainer);
			
			myTimer = new Timer(10);
			myTimer.start();
			myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			
		}
		
		// timer bouwt alle characters op, maar probeerd the druk op de movie laag te houden
		private function timerHandler(e:TimerEvent):void {
			//trace( "timerHandler :: e : " );
			//lineCounter--
			//trace( "\t\t -- lineCounter : " + lineCounter );
			
		
			//trace( "\t\t ++ charCounter : " + charCounter );
			//trace( "\t\t\t - _useTextField : " + _useTextField.text );
			
			for (var i:int = 0; i < 20; i++) {
				//trace ('// -' + i + ' - [mck] start');
				
				if (charCounter >= lineCounter ) {
					break;
				}
				// trace( "(charCounter >= lineCounter ) : " + (charCounter >= lineCounter ) );
				
				if (_useTextField.text.split('')[charCounter].toString() != '\r') { // make sure that the character is not [Enter]
				
					//trace( "_useTextField.getCharBoundaries ("+charCounter+") : " + _useTextField.getCharBoundaries (charCounter) + " : " + _useTextField.getCharBoundaries (charCounter).x );
					var tempChar  = _useTextField.text.split('')[charCounter];
					
					// TextField
					var letter:TextField = new TextField();
					letter.x = _useTextField.getCharBoundaries (charCounter).x ;
					letter.y = _useTextField.getCharBoundaries (charCounter).y;
					letter.text = _useTextField.text.split('')[charCounter];
					letter.embedFonts = true;
					letter.selectable = false;
					letter.autoSize = 'left';
					
					// [mck] debuggin
					/*
					letter.border = true;
					letter.borderColor = 0xFF00FF;
					*/
					
					// TextFormat
					var format:TextFormat = storeTextFormat;
					format.align = 'left';
					format.color = 0xDE0000;
					letter.setTextFormat(format);
					
					characterContainer.addChild (letter);
					
					charCounter++;
				} else {
					charCounter++;
				}
				
				characterContainer.rotation = _useTextField.rotation;
				characterContainer.x = _useTextField.x;
				characterContainer.y = _useTextField.y;
				
				// TweenFilterLite.to (characterContainer, 0 , { blurFilter: { blurX:2, blurY:2 }} );
				// _parent.addChild (characterContainer);

				// trace ('// ' + i + ' - [mck] end');
			}

			//trace( "charCounter : " + charCounter );
			//trace( "lineCounter : " + lineCounter );
			//trace( "(charCounter >= lineCounter-1 ) : " + (charCounter >= lineCounter-1 ) );
			if (charCounter >= lineCounter-1 ) {
				// trace ('_______________________________________________________________ _useTextField');
				myTimer.stop();
				myTimer.removeEventListener(TimerEvent.TIMER, timerHandler);
				_parent.addChild (characterContainer);
				textFieldIsReady = true;
			}
			
		}
		

		
		//////////////////////////////////////// static ////////////////////////////////////////		
		
		static public function start ($targetObj:TextField):AniText {
			var ani:AniText = new AniText ();
			return ani.useTextField($targetObj);
		}
		
		// 
		static public function build ($targetObj:TextField):AniText {
			var ani:AniText = new AniText ();
			return ani.buildTextField($targetObj);
		}
		
		//////////////////////////////////////// Listener ////////////////////////////////////////
		
		
	} // end class
	
} // end package
