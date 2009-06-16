package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import nl.matthijskamstra.loader.ImgLoader;
	import nl.matthijskamstra.utils.LoremIpsum;
	
	/**
	 * Step 1 in creating a imgLoader
	 * @author Matthijs Kamstra aka [mck]
	 */
	public class ImgLoaderMain extends MovieClip
	{
		private var imgArray:Array;
		
		public function ImgLoaderMain() 
		{
			trace( "ImgLoaderMain.ImgLoaderMain" );
			
			imgArray = LoremIpsum.MECHA_IMAGES; // decide your own image array, I'm using a set of flickr
			
			loadOneImage();
		}
		
		private function loadOneImage():void
		{
			// choose a random img from imgArray
			var _randomImg:Number = Math.round (Math.random() * imgArray.length); 
			
			// ImgLoader
			new ImgLoader(this, imgArray[_randomImg]); // use a random image of the imgArray  
			
		}
		
		
	}
	
}