/*
FontControl (AS3), version 1.0

source: http://blog.sitedaniel.com/

Code example: 

		var _fontControl:FontControl;
		_fontControl = new FontControl();
		_fontControl.addEventListener(FontControl.COMPLETE, fontsLoadedListener);
		_fontControl.load("font_mercedes.swf",[{font:"Mercedes" , ClassName:"MercedesRegular"}] );
		
	or
		_fontControl.load("font_mercedes.swf",[{font:"Mercedes" , ClassName:"MercedesRegular"}, "MercedesBold"] );


		private function fontsLoadedListener(e:Event):void {

			var tf:TextField = new TextField();
			var fmt:TextFormat = new TextFormat('Mercedes', 30, 0xFF3333);
			tf.autoSize	 = TextFieldAutoSize.LEFT;
			tf.embedFonts = true; // very important
			tf.text = 'Lorem Ipsum...';
			tf.setTextFormat(fmt);
			this.addChild(tf);
			 
			 
		}
 
	
		var fmt:TextFormat = new TextFormat(FontControl.FONTS[1].font, 30, 0x000000);
 

<pre>
 ____                   _      ____ 
|  __| _ __ ___    ___ | | __ |__  |
| |   | '_ ` _ \  / __|| |/ /    | |
| |   | | | | | || (__ |   <     | |
| |__ |_| |_| |_| \___||_|\_\  __| |
|____|                        |____|

</pre> 
 
@class  	: 	FontManagerMain
@author 	:  	Matthijs C. Kamstra [mck]
@version 	:	1.0 - class creation (AS3)
@since 		:	21-11-2008 

Changelog:
		v 1.0 [21-11-2008] - Initial release

*/
package nl.matthijskamstra.fonts {
    
	//import com.sitedaniel.events.DynamicEvent;
    
	import flash.display.*;
    import flash.events.*;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.text.Font;
 
    public class FontControl extends EventDispatcher {
        
		public static const COMPLETE	:String = "fontLoadComplete";
        public static const ERROR		:String = "fontLoadError";
		public static  var fontList:Array;
        
		private var myLoader:Loader;
        private var _fontsDomain:ApplicationDomain;
		private var embeddedFonts:Array;
		
        // constructor
		public function FontControl() { }
		
		/**
		 * 
		 * @param	$path
		 * @param	$fontArr
		 */
        public function load($path:String, $fontArr:Array):void {
			
			for (var i:int = 0; i < $fontArr.length; i++) {
				if (typeof ($fontArr[i]) != "object") {
					$fontArr[i] = {font:$fontArr[i] , ClassName:$fontArr[i]}
				}
			}
            fontList = $fontArr;
			myLoader = new Loader();
            myLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onErrorListener);
            myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadCompleteListener);
            myLoader.load(new URLRequest($path));
        }
 
        private function onLoadCompleteListener(e:Event):void {
            _fontsDomain = myLoader.contentLoaderInfo.applicationDomain;
            registerFonts();
            embeddedFonts = Font.enumerateFonts(false);
        }
 
        private function registerFonts():void {
			for (var i:uint = 0; fontList[i]; i++) {
                Font.registerFont(_fontsDomain.getDefinition(fontList[i].ClassName) as Class);
				// Font.registerFont(getFontClass(fontList[i]));
            }
			dispatchEvent (new Event (FontControl.COMPLETE));
        }
 
		// nothing
		public function getFontClass(id:String):Class {
			//trace( "FontControl.getFontClass > id : " + id );
			return _fontsDomain.getDefinition(id) as Class;
		}
		
		// nothing
		public function getFont(id:String):Font {
			var fontClass:Class = getFontClass(id);
			return new fontClass as Font;
		}
		
		//////////////////////////////////////// Listeners ////////////////////////////////////////
		
        private function onErrorListener(e:IOErrorEvent):void {
			trace( "FontControl.onErrorListener > e : " + e );
			dispatchEvent (new Event (FontControl.ERROR));
        }
		
    } // end class
	
} // end package
