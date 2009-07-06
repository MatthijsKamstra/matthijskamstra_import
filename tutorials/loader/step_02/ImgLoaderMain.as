package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.text.TextField; 		// need this import for example code in handlers
	import flash.text.TextFormat;		// need this import for example code in handlers
	import nl.matthijskamstra.loader.ImgLoader;
	import nl.matthijskamstra.utils.LoremIpsum;
	
	/**
	 * ...
	 * @author Matthijs Kamstra aka [mck]
	 */
	public class ImgLoaderMain extends MovieClip
	{
		private var imgArray:Array;
		
		public function ImgLoaderMain() 
		{
			trace( "ImgLoaderMain.ImgLoaderMain :: Step 2" );
			
			imgArray = LoremIpsum.MECHA_IMAGES; // decide your own image array, I'm using a set of flickr
			
			loadOneImage();
		}
		
		
		private function loadOneImage():void
		{
			// choose a random img from imgArray
			var _randomImg:Number = Math.round (Math.random() * imgArray.length); 
			
			// ImgLoader
			var _ImgLoader:ImgLoader = new ImgLoader(imgArray[_randomImg]); // use a random image of the imgArray  
			//var _ImgLoader:ImgLoader = new ImgLoader(LoremIpsum.ERROR_IMG);  // test the error handler
			
			// Listeners
			_ImgLoader.addEventListener(Event.COMPLETE, onCompleteHandler);  
			_ImgLoader.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);  
			_ImgLoader.addEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);  
			
			addChild(_ImgLoader);
			
		}
		
		
		private function onErrorHandler(e:IOErrorEvent):void 
		{
			trace( "ImgLoaderMain.onErrorHandler > e : " + e.text );
			/*
			// example code for error-visualization 
			var _txt:TextField = new TextField();
			_txt.autoSize = "left";
			addChild(_txt);
			var fmt:TextFormat = new TextFormat();
			fmt.font = "Arial";
			_txt.defaultTextFormat = fmt;
			_txt.text = "ERROR :: can't find the image"
			*/
		}
		
		private function onProgressHandler(e:ProgressEvent):void 
		{
			trace( "ImgLoaderMain.onProgressHandler > : bytesLoaded=" + e.bytesLoaded + " bytesTotal=" + e.bytesTotal);
			/*
			// example code for progress-visualization 
			if (getChildByName('progress') == null) {
				_txt = new TextField();
				_txt.autoSize = "left";
				_txt.name = "progress";
				addChild(_txt);
				var fmt:TextFormat = new TextFormat();
				fmt.font = "Arial";
				_txt.defaultTextFormat = fmt;
			}
			var _txt:TextField = getChildByName('progress') as TextField;
			var _percentage:int = Math.round((e.bytesLoaded / e.bytesTotal) * 100);
			_txt.text = String(_percentage) + " %";
			if (_percentage == 100) {
				removeChild(_txt);
			}
			*/
		}
		
		private function onCompleteHandler(e:Event):void 
		{
			trace( "ImgLoaderMain.onCompleteHandler > e : " + e );
			/*
			// example code for resize the image to the stage size, and move it to the center of the screen
			if (e.currentTarget.height >= stage.stageHeight) 
			{
				e.currentTarget.height = stage.stageHeight;
				e.currentTarget.scaleX = e.currentTarget.scaleY
				if (e.currentTarget.width >= stage.stageWidth) 
				{
					e.currentTarget.width = stage.stageWidth;
					e.currentTarget.scaleY = e.currentTarget.scaleX;
					
				}
			}
			e.currentTarget.x = (stage.stageWidth - e.currentTarget.width) / 2;
			e.currentTarget.y = (stage.stageHeight - e.currentTarget.height) / 2;
			*/
		}
		
		
	}
	
}