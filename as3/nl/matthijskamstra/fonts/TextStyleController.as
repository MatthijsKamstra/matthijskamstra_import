/**
* Singleton class: TextStyleController (AS3), version 1.0
*
* source: http://www.gskinner.com/blog/archives/2006/07/as3_singletons.html
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
* @class  	: 	TextStyleController
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	8-12-2008 15:36 
* 
* Changelog:
* 		v 1.0 [8-12-2008 15:36] - Initial release
*/
package nl.matthijskamstra.fonts  {
	
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class TextStyleController  {
	
		private static var instance				:TextStyleController;
		private static var allowInstantiation	:Boolean;
		
		private var _titleFormat 		 		:TextFormat;
		private var _newsFormat 		 		:TextFormat;
		private var _dateFormat 		 		:TextFormat;
		private var _bodyFormat 				:TextFormat;
		private var _leesverderFormat 			:TextFormat;
		
		
		public function TextStyleController ():void {
			if (!allowInstantiation) {
				trace ("Error: Instantiation failed: Use TextStyleController.getInstance() instead of new.");
			}
		}
		
		public static function getInstance():TextStyleController  {
			if (instance == null) {
				allowInstantiation = true;
				instance = new TextStyleController ();
				allowInstantiation = false;
				TextStyleController.getInstance().initTextStyle (); // init once
			}
			return instance;
		}
		
		
		//////////////////////////////////////// getters / setters ////////////////////////////////////////
		
		
		public function get titleFormat ()		:TextFormat { return _titleFormat; };
		public function get newsFormat ()		:TextFormat { return _newsFormat; };
		public function get dateFormat ()		:TextFormat { return _dateFormat; };
		public function get bodyFormat ()		:TextFormat { return _bodyFormat; };
		public function get leesverderFormat ()	:TextFormat { return _leesverderFormat; };
		
		
		//////////////////////////////////////// init styles ////////////////////////////////////////
		
		
		public function initTextStyle ():void {
			//trace( "TextStyleController.initTextStyle" );
			
			var mercedesBold		:String = FontController.getInstance().getFont("MercedesBold").fontName;
			var mercedesRegular		:String = FontController.getInstance().getFont("MercedesRegular").fontName;
			var mercedesItalic		:String = FontController.getInstance().getFont("MercedesItalic").fontName;
			var mercedesBoldItalic	:String = FontController.getInstance().getFont("MercedesBoldItalic").fontName;
			
			
			/*
			TextFormat(	font:String = null, size:Object = null, color:Object = null, bold:Object = null, 
						italic:Object = null, underline:Object = null, url:String = null, 
						target:String = null, align:String = null, leftMargin:Object = null, 
						rightMargin:Object = null, indent:Object = null, leading:Object = null)
			*/
			// titleFormat
			_titleFormat = new TextFormat();
				_titleFormat.font = mercedesBold;
				_titleFormat.color = 0x393939;
				_titleFormat.size = 25;
				_titleFormat.bold = true;
				_titleFormat.letterSpacing = 0;
			_newsFormat = new TextFormat();
				_newsFormat.font = mercedesBold;
				_newsFormat.color = 0x393939;
				_newsFormat.size = 16;
				_newsFormat.bold = true;
				_newsFormat.letterSpacing = 0;	
			_dateFormat = new TextFormat();
				_dateFormat.font = mercedesRegular;
				_dateFormat.color = 0x0343b5;
				_dateFormat.size = 12;
				_dateFormat.letterSpacing = 0;
			_leesverderFormat = new TextFormat();
				_leesverderFormat.font = mercedesRegular;
				_leesverderFormat.color = 0xFFFFFF;
				_leesverderFormat.size = 14;
				_leesverderFormat.leading = 0;
				_dateFormat.letterSpacing = 0;
			// bodyFormat
			_bodyFormat = new TextFormat();
				_bodyFormat.font = "Arial";
				_bodyFormat.color = 0x393939;
				_bodyFormat.size = 12;
			
		}
		
		
		public function styleTextField($txt:TextField):void {
			$txt.embedFonts = true;			
			$txt.antiAliasType = AntiAliasType.ADVANCED;
			//txt.thickness = -50;
			//txt.sharpness = 50;
		}
		
		
	} // end class
	
} // end package