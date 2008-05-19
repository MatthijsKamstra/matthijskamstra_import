/**
* Bytes (AS3), version 1.0
*

	
	1 kilobyte = 1 024 bytes
	
	//
	http://www.romulus2.com/articles/guides/misc/bitsbytes.shtml
	//
	
	bit  				b  	0 or 1
	byte 				B 	8 bits
	kilobit 			kb 	1000 bits
	Kilobyte (binary) 	KB 	1024 bytes
	Kilobyte (decimal) 	KB 	1000 bytes
	Megabit 			Mb 	1000 kilobits
	Megabyte (binary) 	MB 	1024 Kilobytes
	Megabyte (decimal) 	MB 	1000 Kilobytes
	Gigabit 			Gb 	1000 Megabits
	Gigabyte (binary) 	GB 	1024 Megabytes
	Gigabyte (decimal) 	GB 	1000 Megabytes
	Terabit 			Tb 	1000 Gigabits
	Terabyte (binary) 	TB 	1024 Gigabytes
	Terabyte (decimal) 	TB 	1000 Gigabytes
	Petabit 			Pb 	1000 Terabits
	Petabyte (binary) 	PB 	1024 Terabytes
	Petabyte (decimal) 	PB 	1000 Terabytes
	Exabit 				Eb 	1000 Petabits
	Exabyte (binary) 	EB 	1024 Petabytes
	Exabyte (decimal) 	EB 	1000 Petabytes
	

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
* @class  	: 	Bytes
* @author 	:  	Matthijs C. Kamstra [mck]
* @version 	:	r1.0 - class creation (AS3)
* @since 	:	12-2-2008 16:35 
* 
*/
package nl.matthijskamstra.convert {

	public class Bytes {
		
		// Constants:
		public static var CLASS_REF = nl.matthijskamstra.convert.Bytes;
		public static var CLASS_NAME : String = "Bytes";
		public static var LINKAGE_ID : String = "nl.matthijskamstra.convert.Bytes";
		// vars
		
		/**
		* Constructor
		*/
		public function Bytes( $targetObj:DisplayObjectContainer = null ) {
			trace ( '+ ' + LINKAGE_ID + ' class instantiated');

		}
		
		/**
		* initBytes used to jumpstart everything
		* 
		* @usage   	import nl.matthijskamstra.convert.Bytes; // import
		*			var __Bytes__ : nl.matthijskamstra.convert.Bytes = new nl.matthijskamstra.convert.Bytes ();
		*			__Bytes__.initBytes( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		public function initBytes( $bytes:Number ) :Number{
			trace( "\t|\t $bytes : " + $bytes );	
			return ($bytes / 1024);
		}
		
		/**
		* staticBytes function to jumpstart
		* 
		* @usage   	import nl.matthijskamstra.convert.Bytes; // import
		*			Bytes.staticBytes2MB( 5584931 );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		static public function staticBytes2MB( $bytes:uint ):Number{
			var __staticBytes:Bytes = new Bytes( );
			return (__staticBytes.initBytes( $bytes ));
		}
		
	} // end class
	
} // end package
