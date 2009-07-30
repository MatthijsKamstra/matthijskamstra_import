package nl.matthijskamstra.utils 
{
	// http://www.unitconversion.org/typography/pixels-x-to-millimeters-conversion.html
	
	
	/**
	 * ...
	 * @author Matthijs Kamstra aka [mck]
	 */
	public class ConvertUtil 
	{
		/*		
		1 inches => 
		0.0254 meters
		0.25 decimeters
		2.54 centimeters
		25.4 millimeters
		25400 micrometers
		25400000 nanometers
		253999998 angstroms
		0.000254 hectometers
		0.0000254 kilometers
		1 inches
		0.0833 feet
		0.0278 yards
		0.0000158 miles
		0.0000137 nautical_miles
		0.000137 cables
		*/
		
		
		/**
		1 millimeters => 
		0.001 meters
		0.01 decimeters
		0.1 centimeters
		1 millimeters
		1000 micrometers
		1000000 nanometers
		10000000 angstroms
		0.00001 hectometers
		0.000001 kilometers
		0.0394 inches
		0.00328 feet
		0.00109 yards
		6.2137119224e-7 miles
		5.4e-7 nautical_miles
		0.0000054 cables

		 */

		 
		 

		
		public function ConvertUtil() 
		{
			
		}
		
		/**
		 * http://www.unitconversion.org/unit_converter/typography.html
		 * 
		 * convert px to mm
		 * 1 pixel (X) = 0.264583333 millimeter
		 * convert mm to px
		 * 1 millimeter = 3.779527559 pixel (X)
		*/
		// 
		static public function px2mm (inPx:Number, inRoundedPosition:Boolean = true):Number
		{
			var mm:Number = inPx * 0.264583333;
			if (inRoundedPosition) mm = Math.round(mm);
			return mm;
		}
		static public function mm2px (inMm:Number, inRoundedPosition:Boolean = true):Number
		{
			var px:Number = inMm * 3.779527559;
			if (inRoundedPosition) px = Math.round(px);
			return px;
		}	
		
		
		/*
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
		*/
		/**
		* 
		* 
		* @usage   	import nl.matthijskamstra.convert.Bytes; // import
		*			var __Bytes__ : nl.matthijskamstra.convert.Bytes = new nl.matthijskamstra.convert.Bytes ();
		*			__Bytes__.initBytes( this );
		* @param	$targetObj		a reference to a movie clip or object
		*/
		
		/**
		 * initBytes used to jumpstart everything
		 * 
		 * @param	inBytes
		 * @return
		 */
		static public function bytes( inBytes:Number ) :Number
		{
			return (inBytes / 1024);
		}
		
		/**
		* staticBytes function to jumpstart
		* 
		* @ex   	
		* @param	$targetObj		a reference to a movie clip or object
		*/
		/**
		 * @example	ConvertUtil.bytes2MB( 5584931 );
		 * @param	inBytes
		 * @return
		 */
		static public function bytes2MB( inBytes:uint ):Number{
			var __staticBytes:Bytes = new Bytes( );
			return (__staticBytes.initBytes( inBytes ));
		}
		
		
	}
	
}