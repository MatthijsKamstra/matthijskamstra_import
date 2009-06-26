package nl.matthijskamstra.create 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;


	/**
	var _quickButton:QuickButton = new QuickButton('Minimize');
	addChild(_quickButton);
	_quickButton.addEventListener(MouseEvent.CLICK, onMinimize);
	
	function onMinimize(event:MouseEvent):void { trace ('minimize');} 
	*/

	public class QuickButton extends MovieClip implements IEventDispatcher
	{
		private var _txt:TextField;
		private static var _xPos:int = 10;
		private static var _yPos:int = 10;

		public  function QuickButton (inText:String) 
		{
			configureLabel();
			setLabel(inText);
		}

		public function setLabel(str:String):void 
		{
			_txt.text = str;
		}

		private function configureLabel():void 
		{

			_txt = new TextField();
			_txt.x = _xPos;
			_txt.y = _yPos;
			_txt.autoSize = TextFieldAutoSize.LEFT;
			_txt.background = true;
			_txt.backgroundColor = 0xC0C0C0
			_txt.border = true;
			_txt.borderColor = 0x808080;
			_txt.selectable = false; 

			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.color = 0x303030;
			format.size = 10;
			format.bold= true;
			format.leftMargin = 5;
			format.rightMargin = 5;

			_txt.defaultTextFormat = format;
			addChild(_txt);

			// first check stage
			if (stage) { 
				updateXpos();
			} else { 
				addEventListener(Event.ADDED_TO_STAGE, updateXpos);
			}


		}

		private function updateXpos(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, updateXpos);
			// update 
			_xPos += _txt.width + 10;
		}

		static public function get xPos():int { return _xPos; }
		static public function set xPos(value:int):void { _xPos = value; }

		static public function get yPos():int { return _yPos; }		
		static public function set yPos(value:int):void { _yPos = value; }
		
		static public function set reset(value:int):void 
		{
			_xPos = 10;
			_yPos = 10;
		}






	} // end class

} // end package