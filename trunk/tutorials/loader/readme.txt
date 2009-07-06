loader tutorial


-- Tutorial ImgLoader : Step 01 --
What is the simplest way to load an image.
Most of the time you only want to load an image in a (MovieClip) container. And nothing else.
So the Step 01 is only that.
Here some code to get it working:

// ImgLoader
new ImgLoader( 'foofolder/foobar.jpg' , this);

or
 
var _ImgLoader:ImgLoader = new ImgLoader('foofolder/foobar.jpg'); 
addChild (_ImgLoader);


-- Tutorial ImgLoader : Step 02 -- 
Although I have made project in the past that uses the way images are loaded in Step 01, I don't do that anymore.
Once you have the code I have written in Step 01, you should make it better.
And that is what will happen in Step 02: you can add listeners (COMPLETE, PROGRESS, IO_ERROR) so you create feedback.

Here some code to get it working:
var _ImgLoader:ImgLoader = new ImgLoader('img/foobar.jpg' , this); 

// Listeners
_ImgLoader.addEventListener(Event.COMPLETE, onCompleteHandler);  

function onCompleteHandler(e:Event):void { trace( "onCompleteHandler > e : " + e );}


-- Tutorial ImgLoader : Step 03 -- 
Now we have feedback from loading one image. The way Step 02 works is that the image will be loaded at the moment you ask
for it. Which means when you generate a gallery of images, all the images in that gallery will be loaded at the same time.
Usually not the best way to load the images of a photo gallery. In this case you want to load the first image first and then the next.
So now we are going to make a queue loader. The first image that is send to the loader, will be loaded first, when that one is done, 
the next image is loaded, and so on ....



-- step 06 --
custom events,
loading queue, 




-- misc --

test swf in html won't work because you can't get image of another server without "permission" (crossdomain.xml) of the server.
My test images come from flickr and I use them only for quick testing, and replace them later by image that are under my controle.
There is no crossdomain.xml for flickr, and so you don't have permission to get the images of the server.



Usually I use a different folder structure

+ step_01
	+ source
		+ classes
			+ nl
				+ matthijskamstra
					+ loader
	+ deploy

But because of the flickr-images that don't work outside Flash IDE, I decided to do it the way I did it.





Matthijs Kamstra aka [mck]