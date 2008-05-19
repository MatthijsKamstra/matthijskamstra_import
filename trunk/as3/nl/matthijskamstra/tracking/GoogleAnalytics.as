/**
* GoogleAnalytics (AS3), version 1.0
*
* Adobe recommends using ExternalInterface for all JavaScript-ActionScript communication. 
*
* <pre>
*  ____                   _      ____ 
* |  __| _ __ ___    ___ | | __ |__  |
* | |   | '_ ` _ \  / __|| |/ /    | |
* | |   | | | | | || (__ |   <     | |
* | |__ |_| |_| |_| \___||_|\_\  __| |
* |____|                        |____|
* 
* </pre>
*
* @class  	: 	GoogleAnalytics
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	11-2-2008 13:17 
* 
*/
package nl.matthijskamstra.tracking {
	
	import com.hexagonstar.util.debug.Debug;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.Capabilities;
	import flash.external.ExternalInterface;
	
	public class GoogleAnalytics {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.tracking.GoogleAnalytics;
		public static var CLASS_NAME : String = "GoogleAnalytics";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.tracking.GoogleAnalytics";
		// vars
		
		/**
		* Constructor
		* 
		* @usage   	import nl.matthijskamstra.tracking.GoogleAnalytics; // import
		*			var __GoogleAnalytics:GoogleAnalytics = new GoogleAnalytics ( );
		*/
		public function GoogleAnalytics(  ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		}
		
		/**
		 * Bezoeker gaat naar "Extra Info -> Openingstijden"
		 * getURL("javascript:pageTracker._trackPageview('/extra_info/openingstijden.html');");
		 * 
		 * This methode has it's limitations: read here:
		 * http://livedocs.adobe.com/flex/2/langref/flash/external/ExternalInterface.html
		 * 
		 * But: "Adobe recommends using ExternalInterface for all JavaScript-ActionScript communication."
		 * 
		 * 
		 * @usage	 nl.matthijskamstra.tracking.GoogleAnalytics.tracking ('/test dit maar eens')
		 * @param	$path	starting with '/' and indicates the path you want trace
		 */
		public static function tracking	($path:String = ''):void{
			if ($path == '') { return; }
			$path = GoogleAnalytics.convertPath ($path);
			// tracking code
			var playerType:String = Capabilities.playerType;
			if (playerType == "External" || playerType == "StandAlone") {
				trace (':::: tracking: ' + LINKAGE_ID + ' :: ' + $path );
			} else {
				// navigateToURL(ExternalInterface.call("pageTracker._trackPageview", "/schaapje"));
				
				//ExternalInterface.call("pageTracker._trackPageview", $path );
				GoogleAnalytics.newTracking	( $path );
				
				Debug.trace (':::: tracking: ' + LINKAGE_ID + ' :: ' + $path);
				
				if (ExternalInterface.available) {
					trace ('isExternalInterfaceAvailable: ' + ExternalInterface.available);
				} else {
					trace ('NO GOOGLE ANALYTICS');
					// [mck] could use newTracking but because of the popup I won't
					GoogleAnalytics.newTracking	($path);
				}
			}
		}

		/**
		 * works like a charm for some people... but I get a new window (_blank) in Firefox
		 * and therefor a popupblokker...
		 * IE doesn't have this problem but gives a "_gat" is undefined javascript....
		 * 
		 * forgot the allowScript=always param...
		 * 
		 * @param	$path
		 */
		public static function newTracking	($path:String = ''):void{
			if ($path == '') { return; }
			$path = GoogleAnalytics.convertPath ($path);
			// new tracking code
			var playerType:String = Capabilities.playerType;
			if (playerType == "External" || playerType == "StandAlone") {
				trace (':::: newTracking: ' + LINKAGE_ID + ' :: ' + $path );
			} else {
				// var jsURLCall:URLRequest = new URLRequest("javascript:pageTracker._trackPageview('/iets/ietsanders/file.html');" )
				// navigateToURL(jsURLCall);
				
				Debug.trace (':::: newTracking: ' + LINKAGE_ID + ' :: ' + $path);
				
				var newURL:String = "javascript:pageTracker._trackPageview('" + $path + "');";
				navigateToURL(new URLRequest(newURL), "_self");
				/*
				try {
					var host:String = "www.[yourDomain].com";
					var socket:Socket = new Socket();
					socket.connect(host, 65536);
				} catch(e:SecurityError) {
					trace(e);
				}
				*/
				
				// sendToURL()
			}
		}
		
		/**
		 * 
		 * @param	$path
		 */
		public static function legacyTracking ($path:String = ''):void{
			if ($path == '') { return; }
			$path = GoogleAnalytics.convertPath ($path);
			// legacy tracking code
			var playerType:String = Capabilities.playerType;
			if (playerType == "External" || playerType == "StandAlone") {
				trace (':::: legacyTracking: ' + LINKAGE_ID + ' :: ' + $path );
			} else {
				var legacyURL:String = "javascript:urchinTracker('" + $path + "');";
				navigateToURL(new URLRequest(legacyURL));
			}
		}
		
 		/**
		 * 
		 * @param	$path
		 * @return
		 */
		private static function convertPath ($path:String):String {
			if ($path.charAt(0) != '/') {
				$path = '/' + $path  ;
			}
			$path = $path.split (' ').join ('_');
			$path = $path.split ('http://').join ('');
			$path = $path.split ('https://').join ('');
			//  . - + * / \
			return $path;
		}
		
	} // end class
	
} // end package
