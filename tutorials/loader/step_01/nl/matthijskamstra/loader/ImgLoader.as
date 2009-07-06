/**
 * 
 * 
 * The simplest way to make a image loader
 * 
 * 
 * Code example:
 * import nl.matthijskamstra.loader.ImgLoader;
 * 
 * // ImgLoader
 * new ImgLoader( 'foofolder/foobar.jpg' , this);
 * 
 * or
 * 
 * var _ImgLoader:ImgLoader = new ImgLoader('foofolder/foobar.jpg' ); 
 * addChild (_ImgLoader);
 * 
 * 
*/
package nl.matthijskamstra.loader 
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	
	public class ImgLoader extends MovieClip
	{
		private var _url:String;
		private var loader:Loader;
		
		/**
		 * The simplest way to load an image 
		 * 
		 * @param	inURL		path to the image
		 * @param	inTarget	image container (a MovieClip or the stage) to place the image in
		 */
		public function ImgLoader( inURL:String , inTarget:MovieClip = null)
		{
			//trace( "ImgLoader.ImgLoader > inURL : " + inURL + ", inTarget : " + inTarget );
			
			_url = inURL;
			loadImg();
			if (inTarget == null) {
				addChild(loader);
			} else {
				inTarget.addChild(loader);
			}
			
		}
		
		
		private function loadImg():void 
		{
			loader = new Loader();
			var request:URLRequest = new URLRequest(_url);
			loader.load(request);
		}
		
		
	} // end class

} // end package
