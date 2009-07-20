/**
 * get the common european-paper series and USA-paper series in millimeter or inch 
 * 
 * sources:
 * http://en.wikipedia.org/wiki/Paper_size
 * http://www.hdri.at/dpirechner/dpirechner_en.htm (DPI - Pixel Converter)
 * 
 * Example: 
 * trace( "height of A5 paper : " + PaperSizeUtil.APaper_mm.A5.h + " in millimeters" );
 */
package nl.matthijskamstra.utils 
{

	/**
	 * ...
	 * @author Matthijs Kamstra aka [mck]
	 */
	public class PaperSizeUtil 
	{
		
		static public const A0:String = "A0";
		static public const A1:String = "A1";
		static public const A2:String = "A2";
		static public const A3:String = "A3";
		static public const A4:String = "A4";
		static public const A5:String = "A5";
		static public const A6:String = "A6";
		static public const A7:String = "A7";
		static public const A8:String = "A8";
		static public const A9:String = "A9";
		static public const A10:String = "A10";
		
		static private var paper_mm:Object = { };
							paper_mm.A0 = { w:841 , h:1189 };
							paper_mm.A1 = { w:594 , h:841 };
							paper_mm.A2 = { w:420 , h:594 };
							paper_mm.A3  = { w:297 , h:420 };
							paper_mm.A4  = { w:210 , h:297 };
							paper_mm.A5  = { w:148 , h:210 };
							paper_mm.A6  = { w:105 , h:148 };
							paper_mm.A7  = { w:74 , h:105 };
							paper_mm.A8  = { w:52 , h:74 };
							paper_mm.A9  = { w:37 , h:52 };
							paper_mm.A10  = { w:26 , h:37 };
			
		static private var paper_in:Object = { };
							paper_in.A0 = { w:33.1 , h:46.8 }; 	
							paper_in.A1 = { w:23.4 , h:33.1 }; 	
							paper_in.A2 = { w:16.5 , h:23.4 }; 	
							paper_in.A3 = { w:11.7 , h:16.5 }; 	
							paper_in.A4 = { w:8.3 , h:11.7 };
							paper_in.A5 = { w:5.8 , h:8.3 }; 	
							paper_in.A6 = { w:4.1 , h:5.8 }; 	
							paper_in.A7 = { w:2.9 , h:4.1 }; 	
							paper_in.A8 = { w:2.0 , h:2.9 }; 	
							paper_in.A9 = { w:1.5 , h:2.0 }; 	
							paper_in.A10 = { w:1.0 , h:1.5 }; 	
			
		static private var USA_paper_mm:Object =  { };
							USA_paper_mm.Letter = { w:216  , h:279 }; 	
							USA_paper_mm.Legal = { w:216  , h:356 }; 	
							USA_paper_mm.Junior_Legal = { w:203  , h:127 }; 	
							USA_paper_mm.Ledger = { w:432  , h:279 }; 	
							USA_paper_mm.Tabloid = { w:279  , h:432 }; 	
			
		static private var USA_paper_in:Object =  { };
							USA_paper_in.Letter = { w:8.5  , h:11 };
							USA_paper_in.Legal = { w:8.5  , h:14 };
							USA_paper_in.Junior_Legal = { w:8.0  , h:5.0 };
							USA_paper_in.Ledger = { w:17  , h:11 };
							USA_paper_in.Tabloid = { w:11  , h:17 };
		
		
		public function PaperSizeUtil() 
		{
		}
		
		/**
		 * get size of A-paper series in pixels
		 * 
		 * @example	trace( "PaperSizeUtil.APaper(PaperSizeUtil.A6).w : " + PaperSizeUtil.APaper(PaperSizeUtil.A6).w );
		 * 
		 * @param	inSize	string of A-paper series (example: 'a4')
		 * @return 			size object.w / object.h in pixels
		 */
		static public function APaper(inSize:String):Object
		{
			var tempOb:Object = paper_mm[inSize.toUpperCase()];
			var obj:Object = { w:Math.round(tempOb.w * 3.779527559) , h:Math.round(tempOb.h  *3.779527559)};
			return obj;
		}
		
		static public function get APaper_mm():Object { return paper_mm; }
		static public function get APaper_in():Object { return paper_in; }
		static public function get USAPaper_mm():Object { return USA_paper_mm; }
		static public function get USAPaper_in():Object { return USA_paper_in; }
		
		
		
		
		
	}
	
}