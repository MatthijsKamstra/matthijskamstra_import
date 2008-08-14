/*
* Copyright the original author or authors.
*
* Licensed under the MOZILLA PUBLIC LICENSE, Version 1.1 (the "License"); 
* you may not use this file except in compliance with the License. 
* You may obtain a copy of the License at 
* 
* http://www.mozilla.org/MPL/MPL-1.1.html 
* 
* Unless required by applicable law or agreed to in writing, software 
* distributed under the License is distributed on an "AS IS" BASIS, 
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
* See the License for the specific language governing permissions and 
* limitations under the License.
* 
* /**
* {@code SharedObjectUtils} gives tools to load/save 
* data in a {@code SharedObject} structure. 
* 
* <p>2 static methods are available : {@link #loadLocal} and 
* {@link saveLocal}. 
* 
* @author Francis Bourre 
* @version 1.0 
*/
/**
* The original <code>SharedObjectUtils</code> class provide simple methods 
* to save data on the local machine.
* 
* <p>The AS3 version don't handle remote SharedObject. It's not in its main goal.</p>
* 
* @author	Francis Bourre
* @author	Cédric Néhémie
* @version 1.0
* @see		http://livedocs.macromedia.com/flex/2/langref/flash/net/SharedObject.html
*/
/**
* SharedObjectUtils (AS3), version 1.0
*
* Enter description here
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
* @class  	: 	SharedObjectUtils
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	1.0 - class creation (AS3)
* @since 	:	14-8-2008 11:00 
* 
* Changelog:
*
* 		v 1.0 [14-8-2008 11:00] - Initial release
*
*/
package nl.matthijskamstra.utils {
	
	import flash.display.*;
	import flash.events.*;	
	
	import flash.net.SharedObject;
	
	public class SharedObjectUtils {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.utils.SharedObjectUtils;
		public static var CLASS_NAME : String = "SharedObjectUtils";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.SharedObjectUtils";
		// vars
		
		/**
		* Constructor
		*/
		public function SharedObjectUtils( ) {
			//trace ( '+ ' + LINKAGE_ID + ' class instantiated');
		}
		
		/**
		 * Get a value stored in a local SharedObject.
		 * 
		 * <p>If an error occurs the function return a null value.</p>
		 * 
		 * @param	 sCookieName	Name of the cookie.
		 * @param	 sObjectName	Field to retreive.
		 * @return	 The value stored in the field or <code>null</code>.
		 */
		public static function loadLocal( sCookieName : String, sObjectName : String ) : * {	
			//trace( "SharedObjectUtils.loadLocal > sCookieName : " + sCookieName + ", sObjectName : " + sObjectName );
			try {
				//var save:SharedObject = SharedObject.getLocal(sCookieName, "/");
				var save:SharedObject = SharedObject.getLocal(sCookieName);
				return save.data[sObjectName];
			} catch(e:Error) {
				trace  ('SharedObjectUtils.loadLocal > e:' + e );
				return null;
			}
		}
		
		/**
		 * Save a data in a local SharedObject.
		 * 
		 * <p>If an error occurs the function die silently and no value is saved.</p>
		 * 
		 * @usage		SharedObjectUtils.saveLocal ('foobarCookie', 'foo' , 123);
		 * 
		 * @param	sCookieName	Name of the cookie.
		 * @param	sObjectName	Field to retreive.
		 * @param	refValue	Value to save.
		 * @return	<code>true</code> if the data have been saved.
		 */
		public static function saveLocal( 	sCookieName : String, sObjectName : String, refValue : * ) : Boolean {
			//trace( "SharedObjectUtils.saveLocal > sCookieName : " + sCookieName + ", sObjectName : " + sObjectName + ", refValue : " + refValue );
			try {
				var save:SharedObject = SharedObject.getLocal( sCookieName );
				save.data[sObjectName] = refValue;
				save.flush();
				return true;
			} catch(e:Error) {
				trace ('SharedObjectUtils.saveLocal > error: ' + e );
			}
			return false;
		}
		
		/**
		 * Clear all values stored in a local SharedObject.
		 * 
		 * <p>If an error occurs the function die silently and return false.</p>
		 * 
		 * @param	sCookieName Name of the cookie.
		 * @return	<code>true</code> if the data have been cleared.
		 */
		public static function clearLocal( sCookieName : String ) : Boolean	{
			trace( "SharedObjectUtils.clearLocal > sCookieName : " + sCookieName );
			try	{
				var save:SharedObject = SharedObject.getLocal( sCookieName );
				save.clear();
				return true;
			}catch ( e : Error ) {
				trace ( e );
			}
			return false;
		}
		
	} // end class
	
} // end package
