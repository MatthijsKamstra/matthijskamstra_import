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
			function onCompleteFunction ($xml:XML):Void {
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

Copyright 2006 Matthijs C. Kamstra [Matthijs C. Kamstra] - All Rights Reserved

</pre>

@author  	Matthijs C. Kamstra [mck]
@version 	1.2	(AS2)
@since   	Wed May 17 09:56:21 2006


Changelog:
 		v 1.2 [15-9-2008 12:17] - load xml in a queue
 		v 1.1 [9-9-2008 16:24] - syntax change (more like tweenlite) / AS3 variant
 		v 1.0 [2006-05-17] - Initial release
*/
class nl.matthijskamstra.loading.XmlLoader {
	
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.loading.XmlLoader ;
	public static var CLASS_NAME : String = "XmlLoader";
	public static var LINKAGE_ID : String = "nl.matthijskamstra.loading.XmlLoader";
	
	public static var version:Number = 1.2;
	
	public var fileURL				:String; 			// flv file that is to be played
	public var onComplete 			:Function;			// oncomplete function
	public var vars					:Object; 			// Variables (holds things like alpha or y or whatever we're tweening)
	private var queueArray			:Array = [];		// loading queue

	/**
	* Constructor
	*
	* load a XML file and after the XML is loaded trigger a function 
	* @usage   		see comments on the top of this class
	* @param   	$fileURL				path to xml file (example: "xml/default.xml")
	* @param   	$onComplete				onComplete function name
	* @param	$vars					extra vars (optional)

	 */
	public function XmlLoader($fileURL:String, $onComplete:Function, $vars:Object) {
		//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		//trace( "XmlLoader.SimpleXmlLoader > $fileURL : " + $fileURL + ", $onComplete : " + $onComplete + ", $vars : " + $vars );
		if ( $fileURL == null ) { return; }
		this.fileURL = $fileURL;
		this.onComplete = $onComplete;
		this.vars = $vars;
		// start loading xml
		startXmlLoad($fileURL);
	}
	
	
	/**
	 * Starts loading XML and returns a trace error if it doesn't work
	 * For more feedback use nl.matthijskamstra.load.Xml
	 *
	 * @param	$fileURL	path to xml file (example: "xml/test.xml")
	 */
	private function startXmlLoad($fileURL:String):Void{
		var thisObj = this;
		var format_xml:XML = new XML();
		format_xml.ignoreWhite = true;
		format_xml.onLoad = function(success:Boolean){
			if(success){
				thisObj.onXmlComplete(format_xml);
				//trace("SimpleXmlLoader :: status: " + format_xml.status + " (" + thisObj.errorMessage(format_xml.status) + ")");
			} else {
				// trace ("[[ ERROR ]]");
				trace("SimpleXmlLoader :: Unable to load/parse XML. (status: " + format_xml.status + ")");
			}
		};
		format_xml.load($fileURL);
	}
	
	/**
	 * the error message if necessary
	 *
	 * @param   statusNumber 	format_xml status
	 * @return  the error message
	 */
	private function errorMessage(statusNumber:Number):String{
		var errorMessage:String;
		switch(statusNumber){
			case 0:
				errorMessage = "No error; parse was completed successfully.";
				break;
			case -2:
				errorMessage = "A CDATA section was not properly terminated.";
				break;
			case -3:
				errorMessage = "The XML declaration was not properly terminated.";
				break;
			case -4:
				errorMessage = "The DOCTYPE declaration was not properly terminated.";
				break;
			case -5:
				errorMessage = "A comment was not properly terminated.";
				break;
			case -6:
				errorMessage = "An XML element was malformed.";
				break;
			case -7:
				errorMessage = "Out of memory.";
				break;
			case -8:
				errorMessage = "An attribute value was not properly terminated.";
				break;
			case -9:
				errorMessage = "A start-tag was not matched with an end-tag.";
				break;
			case -10:
				errorMessage = "An end-tag was encountered without a matching start-tag.";
				break;
			default:
				errorMessage = "An unknown error has occurred.";
				break;
		}
		return (errorMessage);
	}
	
	/**
	* load a XML file and after the XML is loaded trigger a function 
	* create a queue of files that need to loaded 
	* @param   	$fileURL				path to xml file (example: "xml/default.xml")
	* @param   	$onComplete				onComplete function name
	* @param	$vars					extra vars (optional)
	 */
	public function addQueue ($fileURL:String, $onComplete:Function, $vars:Object):Void {
		queueArray.push ([$fileURL, $onComplete, $vars]);
	}
	
	/**
	 * start loading the queue
	 */
	public function startQueue ():Void {
		new XmlLoader (queueArray[0][0], queueArray[0][1], queueArray[0][2]);
		queueArray.shift();
	}
	
	//////////////////////////////////////// static ////////////////////////////////////////
	
	/**
	* load a XML file and after the XML is loaded trigger a function 
	* @param   	$fileURL				path to xml file (example: "xml/default.xml")
	* @param   	$onComplete				onComplete function name
	* @param	$vars					extra vars (optional)
	*/ 
	public static function start ($fileURL:String, $onComplete:Function, $vars:Object):XmlLoader{
		return new XmlLoader ($fileURL, $onComplete, $vars);
	}
	
	//////////////////////////////////////// handlers/listeners ////////////////////////////////////////
	
	/**
	 * sends the xml back after it's loaded to the function specified  (handler)
	 * and extraArguments if necessary
	 *
	 * @param   	format_xml		xml thats loaded
	 */
	private function onXmlComplete(format_xml:XML):Void {
		if (this.vars == null){
			this.onComplete.apply(null, [format_xml]);
		} else {
			this.onComplete.apply(null, [format_xml, this.vars]);
		}
		// finish queue, if necessary 
		if (queueArray.length > 0){
			startQueue ();
		}
	}
	
} // end class
