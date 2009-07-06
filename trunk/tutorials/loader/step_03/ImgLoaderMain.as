package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
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
			trace( "ImgLoaderMain.ImgLoaderMain :: Step 3" );
			
			imgArray = LoremIpsum.MECHA_IMAGES; // decide your own image array, I'm using a set of flickr
			
			generateImgContainer ();
		}
		
		
		private function generateImgContainer ():void
		{
			var _total:int = 10
			for (var i:int = 0; i < _total; i++) 
			{
				var _mc:MovieClip = new MovieClip();
				_mc.y = i * 20;
				_mc.name = i.toString();
				_mc.alpha = .5;
				addChild(_mc);
				
				var _ImgLoader:ImgLoader = new ImgLoader (imgArray[i] , _mc);
				_ImgLoader.addEventListener(Event.COMPLETE , onCompleteHandler);
				
			}
			
		}

		
		
		private function onErrorHandler(e:IOErrorEvent):void 
		{
			trace( "ImgLoaderMain.onErrorHandler > e : " + e.text );
			
		}
		
		private function onProgressHandler(e:ProgressEvent):void 
		{
			trace( "ImgLoaderMain.onProgressHandler > : bytesLoaded=" + e.bytesLoaded + " bytesTotal=" + e.bytesTotal);
        
		}
		
		private function onCompleteHandler(e:Event):void 
		{
			trace( "ImgLoaderMain.onCompleteHandler > e : " + e );

			
		}
		
		
		

		
		
	}
	
}