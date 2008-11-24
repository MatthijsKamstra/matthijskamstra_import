/**
* Singleton class: FontController (AS3), version 1.0
*
* source: http://www.gskinner.com/blog/archives/2006/07/as3_singletons.html
* source: http://blog.sitedaniel.com/
* source: http://www.betriebsraum.de/blog/2007/06/22/runtime-font-loading-with-as3-flash-cs3-not-flex/
* 

Code example: 

		FontController.getInstance().load("font_mercedes.swf",[{font:"Mercedes" , ClassName:"MercedesRegular"}] );
		FontController.getInstance().addEventListener (FontController.COMPLETE, fontsLoadedListener);
		
	or
		
		FontController.getInstance().load("font_mercedes.swf",[{font:"Mercedes" , ClassName:"MercedesRegular"}, "MercedesBold"] );
		
		
Example to show loaded font:
	
		private function fontsLoadedListener(e:Event):void {
			var tf:TextField = new TextField();
			var fmt:TextFormat = new TextFormat('Mercedes', 30, 0xFF3333);
			tf.autoSize	 = TextFieldAutoSize.LEFT;
			tf.embedFonts = true; // very important
			tf.text = 'Lorem Ipsum...';
			tf.setTextFormat(fmt);
			this.addChild(tf);
		}
 
		// werkt niet meer....
		var fmt:TextFormat = new TextFormat(FontControl.FONTS[1].font, 30, 0x000000);

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
* @class  	: 	FontController
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	21-11-2008 16:04 
* 
* Changelog:
* 		v 1.0 [21-11-2008 16:04] - Initial release
*/
package nl.matthijskamstra.fonts  {
	
	import flash.display.*;
    import flash.events.*;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.text.Font;
	
	public class FontController extends EventDispatcher {
	
		private static var instance:FontController;
		private static var allowInstantiation:Boolean;
		
		public static const COMPLETE	:String = "fontLoadComplete";
        public static const ERROR		:String = "fontLoadError";
		
		public static var fontList		:Array = [];
		public static var embeddedFonts :Array = [];
        
		private var myLoader:Loader;
        private var _fontsDomain:ApplicationDomain;
		
		// constructor
		public function FontController ():void {
			if (!allowInstantiation) {
				throw new Error("Error: Instantiation failed: Use FontController.getInstance() instead of new.");
			}
		}
		
		public static function getInstance():FontController  {
			if (instance == null) {
				allowInstantiation = true;
				instance = new FontController ();
				allowInstantiation = false;
			}
			return instance;
		}
	
		/**
		 * start loading the swf and initialize the fonts
		 * 
		 * @param	$pathToSwf		url for the swf containing the embedded fonts
		 * @param	$fontArr		array containing a object (examle [{font:"Mercedes", ClassName:"MercedesRegular"}]):
		 * 							font: original font name (example: "Mercedes")
		 * 							ClassName: linkage class name (example: "MercedesRegular")
		 * 
		 */
        public function load($pathToSwf:String, $fontArr:Array):void {
			
			for (var i:int = 0; i < $fontArr.length; i++) {
				if (typeof ($fontArr[i]) != "object") {
					$fontArr[i] = {font:$fontArr[i] , ClassName:$fontArr[i]}
				}
			}
            fontList = $fontArr;
			myLoader = new Loader();
            myLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onErrorListener);
            myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadCompleteListener);
            myLoader.load(new URLRequest($pathToSwf));
        }
		
		private function registerFonts():void {
			for (var i:uint = 0; fontList[i]; i++) {
                Font.registerFont(_fontsDomain.getDefinition(fontList[i].ClassName) as Class);
				// Font.registerFont(getFontClass(fontList[i]));
            }
			dispatchEvent (new Event (FontController.COMPLETE));
        }
 
		// does nothing
		public function getFontClass(id:String):Class {
			//trace( "FontControl.getFontClass > id : " + id );
			return _fontsDomain.getDefinition(id) as Class;
		}
		
		// does nothing
		public function getFont(id:String):Font {
			var fontClass:Class = getFontClass(id);
			return new fontClass as Font;
		}
		
		public function getFontData():void {
			for (var i:int = 0; i < embeddedFonts.length; i++) {
				trace( "- font: "+ fontList[i].font +  ", ClassName: " + fontList[i].ClassName );				
				trace( "\t\tFont.fontName : " + embeddedFonts[i].fontName );
				trace( "\t\tFont.fontStyle : " + embeddedFonts[i].fontStyle );
				trace( "\t\tFont.fontType : " + embeddedFonts[i].fontType );
			}
		}
		
		
		//////////////////////////////////////// Listeners ////////////////////////////////////////
		
		
		private function onLoadCompleteListener(e:Event):void {
            _fontsDomain = myLoader.contentLoaderInfo.applicationDomain;
            registerFonts();
            embeddedFonts = Font.enumerateFonts(false);
			
        }
        
		private function onErrorListener(e:IOErrorEvent):void {
			trace( "FontControl.onErrorListener > e : " + e );
			dispatchEvent (new Event (FontController.ERROR));
        }
		
    } // end class
	
} // end package