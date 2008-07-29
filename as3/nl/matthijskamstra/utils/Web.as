/**
 * http://www.stevensacks.net/2008/02/06/as3-geturl-solved/
 */
package nl.matthijskamstra.utils {
    
	import flash.net.navigateToURL;
    import flash.net.URLRequest;
	import flash.system.Capabilities; 
	import flash.external.ExternalInterface;

    public class Web {
        /**
         * the oldskool getURL from AS2 converted to AS3 class
		 * @usage	nl.matthijskamstra.utils.Web.getURL ('http://www.foobar.com/' , '_blank');
         * @param	$url		the url to navigate to
         * @param	$window		You can enter the name of a specific window or use one of the following values: 
         * 								"_self" specifies the current frame in the current window. 
         * 								"_blank" specifies a new window. 
         * 								"_parent" specifies the parent of the current frame. 
         * 								"_top" specifies the top-level frame in the current window. 
         */
		public static function getURL($url:String, $window:String = null):void {
            trace(":: getURL" + $url);
            var req:URLRequest = new URLRequest($url);
            try {
                navigateToURL(req, $window);
            } catch (e:Error) {
                trace("Navigate to URL failed", e.message);
            }
        }
		
		/**
		 * 
		 * <param name="allowScriptAccess" value="always" />
		 * 
		 * @param	$javascript
		 * @param	$param
		 */
		public static function  javascript ($jsFunc:String , $param:String = null):void {
			if (Capabilities.playerType == "External"){
				trace( ":: javascript ($jsFunc: " + $jsFunc + " , $param: " + $param + ")" );
			} else {
				ExternalInterface.call($jsFunc , $param);
				
				/*if (ExternalInterface.available) {
					try {
						output.appendText("Adding callback...\n");
						ExternalInterface.addCallback("sendToActionScript", receivedFromJavaScript);
						if (checkJavaScriptReady()) {
							output.appendText("JavaScript is ready.\n");
						} else {
							output.appendText("JavaScript is not ready, creating timer.\n");
							var readyTimer:Timer = new Timer(100, 0);
							readyTimer.addEventListener(TimerEvent.TIMER, timerHandler);
							readyTimer.start();
						}
					} catch (error:SecurityError) {
						trace ("A SecurityError occurred: " + error.message + "\n");
					} catch (error:Error) {
						trace ("An Error occurred: " + error.message + "\n");
					}
				} else {
					trace ("External interface is not available for this container.");
				}*/
				
				
			}
		}
    
	} // end class
	
} // end package