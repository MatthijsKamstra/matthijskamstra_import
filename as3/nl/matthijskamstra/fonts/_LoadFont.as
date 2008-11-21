/*
http://www.mokisystems.com/blog/flash-as3-loading-fonts/





var t:TextField = new TextField();
 	 	var f = new TextFormat();
 	 	public function Main() {
 	 	 	var font = new LoadFont("font-Zapfino.swf",["EFont01"]);
 	 	 	font.addEventListener(LoadFont.COMPLETE, successLoadFont);
 	 	 	font.addEventListener(LoadFont.ERROR, failLoadFont);
 	  	}
 	 	private function failLoadFont(e:Event){
 	 	 	f.font="Arial"; //default font if load fails.
 	 	 	t.embedFonts = false;
 	 	 	post();
 	 	}
 	 	private function successLoadFont(e:Event){
 	 	 	var embeddedFonts:Array = Font.enumerateFonts(false);
 	 	 	f.font=embeddedFonts[0].fontName;
 	 	 	t.embedFonts = true;
 	 	 	post();
 	 	}
 	 	public function post(){
 	 	 	f.size = 36;
 	 	 	t.defaultTextFormat = f;
 	 	 	t.x = 100;
 	 	 	t.y = 100;
 	 	 	t.background = true;
 	 	 	t.autoSize = TextFieldAutoSize.LEFT;
 	 	 	t.text = "We are in loaded Font";
 	 	 	addChild(t);
 	 	}



*/

package {
 	import flash.display.*;
 	import flash.events.*;
 	import flash.text.*;
 	import flash.errors.*;
 	import flash.system.*;
 	import flash.net.*;
 	public class LoadFont extends EventDispatcher {
 	 	public static const COMPLETE:String = "complete";
 	 	public static const ERROR:String = "error loading font";
 	 	private var loader:Loader = new Loader();
 	 	private var _fontsDomain:ApplicationDomain;
 	 	private var _fontName:Array;
 	 	public function LoadFont(url:String,fontName:Array):void {
 	 	 	_fontName = fontName;
 	 	 	trace("loading");
 	 	 	loader.addEventListener(IOErrorEvent.IO_ERROR, font_ioErrorHandler);
 	 	 	loader.contentLoaderInfo.addEventListener(Event.COMPLETE,finished);
 	 	 	loadAsset(url);
 	 	}
 	 	private function loadAsset(url:String):void {
 	 	 	var request:URLRequest = new URLRequest(url);
 	 	 	loader.load(request);
 	 	 }
 	 	function finished(evt:Event):void {
 	 	 	_fontsDomain = loader.contentLoaderInfo.applicationDomain;
 	 	 	registerFonts(_fontName);
 	 	 	dispatchEvent(new Event(LoadFont.COMPLETE));
 	 	}
 	 	function font_ioErrorHandler(evt:Event):void {
 	 	 	dispatchEvent(new Event(LoadFont.ERROR));
 	 	 }
 	 	public function registerFonts(fontList:Array):void {
 	 	 	for (var i:uint = 0; i &lt; fontList.length; i++) {
 	 	 	 	Font.registerFont(getFontClass(fontList[i]));
 	 	 	}
 	 	}
 	 	public function getFontClass(id:String):Class {
 	 	 	return _fontsDomain.getDefinition(id)  as  Class;
 	 	 }
 	 	public function getFont(id:String):Font {
 	 	 	var fontClass:Class = getFontClass(id);
 	 	 	return new fontClass    as  Font;
 	 	}
 	}
}