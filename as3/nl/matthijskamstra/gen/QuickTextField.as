package nl.matthijskamstra.create 
{
	import flash.display.MovieClip;
	import flash.events.IEventDispatcher;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Matthijs Kamstra aka [mck]
	 */
	public class QuickTextField  extends TextField implements IEventDispatcher
	{
		private var _txt:TextField;
		private static var _xPos:int = 50;
		private static var _yPos:int = 50;
		
		public function QuickTextField() 
		{
			configureLabel();
		}

		private function configureLabel():void 
		{
			_txt = new TextField();
			_txt.x = _xPos;
			_txt.y = _yPos;
			_txt.autoSize = TextFieldAutoSize.LEFT;
			_txt.background = true;
			_txt.backgroundColor = 0xC0C0C0;
			_txt.border = true;
			_txt.borderColor = 0x808080;
			_txt.selectable = false; 

			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.color = 0x303030;
			format.size = 10;
			format.leftMargin = 5;
			format.rightMargin = 5;
			
			_txt.defaultTextFormat = format;
			//addChild(_txt);
		}

		static public function get xPos():int { return _xPos; }
		static public function set xPos(value:int):void { _xPos = value; }

		static public function get yPos():int { return _yPos; }		
		static public function set yPos(value:int):void { _yPos = value; }
		
		static public function set reset(value:int):void 
		{
			_xPos = 50;
			_yPos = 50;
		}



	}
	
}