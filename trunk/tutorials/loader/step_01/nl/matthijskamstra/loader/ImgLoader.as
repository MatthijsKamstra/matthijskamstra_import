/**
 * 
 * 
 * The simplest way to make a image loader
 * 
 * 
 * Example:
 * import nl.matthijskamstra.loader.ImgLoader;
 * // ImgLoader
 * new ImgLoader(this, 'foofolder/foobar.jpg');
*/
package nl.matthijskamstra.loader {
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	
	
	public class ImgLoader
	{
		private var _url:String;
		private var loader:Loader;
		
		/**
		 * The simplest way to load an image 
		 * 
		 * @param	inTarget	image container (a MovieClip or the stage) to place the image in
		 * @param	inURL		path to the image
		 */
		public function ImgLoader(inTarget:MovieClip, inURL:String) 
		{
			_url = inURL;
			loadImg();
			inTarget.addChild(loader);
		}
		
		
		private function loadImg():void 
		{
			loader = new Loader();
			var request:URLRequest = new URLRequest(_url);
			loader.load(request);
		}
		
		
	} // end class

} // end package
