 /**
* Basic idea: the XML needs to be loaded before a function can do something with the XML
* so you send the location of the XML and which function will be called when the XML is loaded.
*
* Simple way to load xml, if the xml loads (no errors) then it will send the xml to a function
* if the xml can't be loaded, there will happen nothing except a trace "[[ ERROR ]]"
*
* #1 example: 	var loadXml0 = new nl.matthijskamstra.xml.SimpleXmlLoader ("_xml/_page.xml" , this, afterLoadingFunction);
* will send the xml to a function named afterLoadingFunction with no extra param
*
* #2 example: 	var loadXml1 = new nl.matthijskamstra.xml.SimpleXmlLoader ("_xml/_page.xml" , this, afterLoadingFunction, "tweede xml" , "param 1", "param 2", "param 3");
* will send the xml to a function named afterLoadingFunction AND extra param ("tweede xml" , "param 1", "param 2", "param 3")
*
* #3 example:	var cs = new nl.ajaxGallery.CreateSlide();
*				var loadXml4 = new nl.matthijskamstra.xml.SimpleXmlLoader ("_xml/test.xml", cs, cs.tempinit);
* will send the xml to a function named tempinit in another class named nl.ajaxGallery.CreateSlide()
*
* <pre>
*  ____                   _      ____
* |  __| _ __ ___    ___ | | __ |__  |
* | |   | '_ ` _ \  / __|| |/ /    | |
* | |   | | | | | || (__ |   <     | |
* | |__ |_| |_| |_| \___||_|\_\  __| |
* |____|                        |____|
*
* Copyright 2006 Matthijs C. Kamstra [Matthijs C. Kamstra] - All Rights Reserved
*
* </pre>
*
*
* @author  	Matthijs C. Kamstra [mck]
* @version 	1.0
* @since   	Wed May 17 09:56:21 2006
*/
class nl.matthijskamstra.xml.SimpleXmlLoader
{
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.xml.SimpleXmlLoader;
	public static var LINKAGE_ID : String = "nl.matthijskamstra.xml.SimpleXmlLoader";
	//
	private var extraArgs : Array ;
	private var target_obj : Object;
	private var handler : Function;
	/**
	* Constructor
	* checks if a xmlSourcePath is given
	* and extracts the arguments
	*
	* @usage   		var loadXml0 = new nl.matthijskamstra.xml.SimpleXmlLoader ("_xml/_page.xml" , this, afterLoadingFunction);
	*				var loadXml1 = new nl.matthijskamstra.xml.SimpleXmlLoader ("_xml/_page.xml" , this, afterLoadingFunction, "tweede xml" , "param 1", "param 2", "param 3");
	*				var loadXml2 = new nl.matthijskamstra.xml.SimpleXmlLoader ("_xml/klerenmakendeartiest.xml" , this, afterLoadingFunction, "derde xml" , 1, 2, 3, 4, 5);
	*				var loadXml3 = new nl.matthijskamstra.xml.SimpleXmlLoader ("_xml/napoleon_nl.xml" , this, afterLoadingFunction, "vierde xml");
	*				var cs = new nl.ajaxGallery.CreateSlide();
	*				var loadXml4 = new nl.matthijskamstra.xml.SimpleXmlLoader ("_xml/test.xml", cs, cs.tempinit);
	*
	* @param   	xmlSourcePath		path to xml file (example: "xml/test.xml")
	* @param   	_target_obj			specifies the value of thisObject within the function body
	* @param   	_handler			function name
	*/
	public function SimpleXmlLoader (xmlSourcePath : String, _target_obj : Object, _handler : Function)
	{
		if (xmlSourcePath == null){	return;}
		target_obj = _target_obj
		handler = _handler
		// Get any extra arguments for handler
		extraArgs = arguments.slice (3);
		// start loading xml
		startXmlLoad (xmlSourcePath);
	}
	/**
	* Starts loading XML and returns a trace error if it doesn't work
	* For more feedback use nl.matthijskamstra.load.Xml
	*
	* @param	xmlSourcePath	path to xml file (example: "xml/test.xml")
	*/
	private function startXmlLoad (xmlSourcePath : String) : Void
	{
		var thisObj = this;
		var format_xml : XML = new XML ();
		format_xml.ignoreWhite = true; 
		format_xml.onLoad = function (success : Boolean)
		{
			if (success)
			{
				thisObj.onXmlComplete (format_xml);
				trace ("SimpleXmlLoader :: status: " + format_xml.status + " (" + thisObj.errorMessage (format_xml.status) + ")");
			} else
			{
				// trace ("[[ ERROR ]]");
				trace ("SimpleXmlLoader :: Unable to load/parse XML. (status: " + format_xml.status + ")");
			}
		};
		format_xml.load (xmlSourcePath); 
	}
	/**
	* the error message if necessary
	*
	* @param   statusNumber 	format_xml status
	* @return  the error message
	*/
	private function errorMessage (statusNumber : Number) : String
	{
		var errorMessage : String;
		switch (statusNumber)
		{
			case 0 		: 	errorMessage = "No error; parse was completed successfully.";break;
			case - 2 	:	errorMessage = "A CDATA section was not properly terminated.";break;
			case - 3 	:	errorMessage = "The XML declaration was not properly terminated.";break;
			case - 4 	:	errorMessage = "The DOCTYPE declaration was not properly terminated.";break;
			case - 5 	:	errorMessage = "A comment was not properly terminated.";break;
			case - 6 	:	errorMessage = "An XML element was malformed.";	break;
			case - 7 	:	errorMessage = "Out of memory."; break;
			case - 8 	:	errorMessage = "An attribute value was not properly terminated.";	break;
			case - 9 	:	errorMessage = "A start-tag was not matched with an end-tag.";	break;
			case - 10 	:	errorMessage = "An end-tag was encountered without a matching start-tag.";break;
			default 	:	errorMessage = "An unknown error has occurred.";break;
		}
		return (errorMessage)
	}
	/**
	* sends the xml back after it's loaded to the function specified  (handler)
	* and extraArguments if necessary
	*
	* @param   	format_xml		xml thats loaded
	*/
	private function onXmlComplete (format_xml : XML) : Void
	{
		var fullArgs : Array = [format_xml , extraArgs];
		handler.call (target_obj, format_xml, extraArgs);
	}
	/**
	* [[ example code ]]
	* this is a example function you can use to extract the extraArguments
	*
	* @param   	format_xml		xml thats loaded
	* @param   	param_obj		extra arguments
	*/
	/*
	public function afterLoadingFunction (format_xml : XML , param_obj : Object) : Void
	{
		trace ("------ " + getTimer () + " ms");
		trace ('format_xml.getBytesTotal(): ' + format_xml.getBytesTotal () + " bytes");
		for (var i in param_obj){
			trace ('\tparam_obj :: key: ' + i + ', value: ' + param_obj [i] + "(" + typeof (param_obj [i]) + ")");
		}
	}
	*/
}
