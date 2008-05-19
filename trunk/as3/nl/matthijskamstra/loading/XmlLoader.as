/**

Loading XML in flash is asynchronous, which means that when the XML is called it isn't available in the next line of code.
To make sure that the xmldata is loaded, and function that depend on XML information can be triggered after it is loaded

that is what this class does: send the xmlurl and the function which you want to trigger onComplete and go!

if the XML can't be loaded, there will happen nothing except a 'error' trace

EXAMPLE

	load a XML and onComplete send it to a function:
			import nl.matthijskamstra.loading.XmlLoader;
			var loadXml0:XmlLoader = new XmlLoader ("xml/default.xml" , onCompleteFunction);
			
			// example onCompleteFunction
			function onCompleteFunction ($xml:XML):void {
				trace ('$xml.length(): ' + $xml.length() + " (Always returns 1 for any XML object.)");
				trace ('$xml: ' + $xml);
			}
		
	using a static function:
			import nl.matthijskamstra.loading.XmlLoader;
			XmlLoader.start ("xml/default.xml" , onCompleteFunction);
			function onCompleteFunction ($xml:XML):void { trace ('$xml: ' + $xml);}


<pre>

  ____                   _      ____
|  __| _ __ ___    ___ | | __ |__  |
| |   | '_ ` _ \  / __|| |/ /    | |
| |   | | | | | || (__ |   <     | |
| |__ |_| |_| |_| \___||_|\_\  __| |
|____|                        |____|

Copyright 2007 [Matthijs C. Kamstra] - All Rights Reserved

</pre>


@author  	Matthijs C. Kamstra [mck]
@version 	1.1	(AS3)
@since   	26-10-2007 14:23

Changelog:
 		v 1.1 [2008-05-06] - syntax change (more like tweenlite)
 		v 1.0 [2007-10-26] - Initial release

*/
package nl.matthijskamstra.loading {

	import flash.errors.*;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class XmlLoader{
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.loading.XmlLoader ;
		public static var CLASS_NAME : String = "XmlLoader";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.loading.XmlLoader";
		
		public static var version:Number = 1.1;
		
		public var fileURL				:String; 			// flv file that is to be played
		public var onComplete 			:Function;			// oncomplete function
		public var vars					:Object; 			// Variables (holds things like alpha or y or whatever we're tweening)
		
		/**
		* Constructor
		*
		* @usage   		see comments on the top of this class
		*
		* @param   	$fileURL				path to xml file (example: "xml/default.xml")
		* @param   	$onComplete				onComplete function name
		* @param	$vars					extra vars (doesn't work yet)
		*/ 
        public function XmlLoader($fileURL:String, $onComplete:Function, $vars:Object = null) {
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
			if ( $fileURL == null ) { return; }
			this.fileURL = $fileURL;
			this.onComplete = $onComplete;
			this.vars = $vars;
            var request:URLRequest = new URLRequest($fileURL);
            var loader:URLLoader = new URLLoader();
            loader.addEventListener(Event.COMPLETE, completeListener);
            try {
                loader.load(request);
            } catch (error:ArgumentError){
                trace(":: An ArgumentError has occurred.");
            } catch (error:SecurityError){
                trace(":: A SecurityError has occurred.");
            }
        }
		
		//////////////////////////////////////// static ////////////////////////////////////////
		
		public static function start ($fileURL:String, $onComplete:Function, $vars:Object=null):XmlLoader{
			return new XmlLoader ($fileURL, $onComplete, $vars);
		}
		
		//////////////////////////////////////// Listener ////////////////////////////////////////
		
		//sends the XML back after it's loaded to the function specified  (onComplete)
		private function completeListener(event:Event):void {
			try {
				var dataXML:XML = XML(event.target.data);
				if (this.onComplete != null) {
					this.onComplete.apply(null, [dataXML]);
				}
			} catch(e:Error){
				trace(":: Error: " + e.message);
				return;
			}
        }
		
	} // end class

} // end package
