package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import nl.matthijskamstra.loader.AssetLoader;
	import nl.matthijskamstra.loader.AssetLoaderEvent;
	import nl.matthijskamstra.loader.ImgLoader;
	import nl.matthijskamstra.utils.CacheBuster;
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
			trace( "ImgLoaderMain.ImgLoaderMain :: Step 6" );
			
			CacheBuster.isOnline = true; // set cachbuster on
			
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
				_mc.name = "test_"+i.toString();
				_mc.alpha = .5;
				addChild(_mc);
				
				//AssetLoader.getInstance().add(CacheBuster.create(imgArray[i]), i.toString(), _mc);
				AssetLoader.getInstance().add(imgArray[i], i.toString(), _mc);
				
				AssetLoader.getInstance().addEventListener(AssetLoaderEvent._EVENT, onAssetHandler);
				
				//_AssetLoader.addEventListener(Event.COMPLETE , onCompleteHandler);
				
				/*
				var _ImgLoader:ImgLoader = new ImgLoader (imgArray[i] , _mc);
				_ImgLoader.addEventListener(Event.COMPLETE , onCompleteHandler);
				*/
			}
			
		}
		
		private function onAssetHandler(e:AssetLoaderEvent):void 
		{
			//trace( "ImgLoaderMain.onAssetHandler > e : " + e );
			switch (e.subtype) {
				case AssetLoaderEvent.START:
					trace( "AssetLoaderEvent.START : " + AssetLoaderEvent.START + " - "  + e.name );
					break;
				case AssetLoaderEvent.COMPLETE:
					trace( "AssetLoaderEvent.COMPLETE : " + AssetLoaderEvent.COMPLETE + " - "  + e.name);
					trace( "e.imgContainer.name : " + e.imgContainer.name );
					var container:MovieClip = e.imgContainer;
					container.addChild(e.asset);
					container.width = stage.stageWidth;
					container.scaleY = container.scaleX;
					break;
				case AssetLoaderEvent.ALL_LOADED:
					trace( "AssetLoaderEvent.ALL_LOADED : " + AssetLoaderEvent.ALL_LOADED  );
					break;
				case AssetLoaderEvent.PROGRESS:
					trace (Math.round((e.loadedBytesCount / e.totalBytesCount)*100) + "%")
					break
				default:
					//trace("case '"+e.subtype+"':\r\ttrace ('--- "+e.subtype+"');\r\tbreak;" );
			}
			
			
			
		}

		
		
		
		
		

		
		
	}
	
}