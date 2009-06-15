loader tutorial




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