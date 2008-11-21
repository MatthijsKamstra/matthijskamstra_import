package nl.matthijskamstra.fonts {

 
    public class FontUtil {
		
		public function FontUtil (){}
		
		public function setFont(fontName:String, field:TextField) {				
			//Use two methods to find the associated font. 
			//Step 1: Search through enumerated fonts, including system fonts for a match:			
			var realFontName:String=new String();
			var fontArray:Array=Font.enumerateFonts(true);
			for (var item in fontArray) {
				if (fontArray[item].fontName==fontName) {
					realFontName=fontArray[item].fontName;
					break;
				}//if
			}//for
			//Step 2: If not found, try getting it via a linkage through the class definition:
			if ((realFontName=='') || (realFontName==null)) {
				try {
					var fontClass:*=getDefinitionByName(fontName);
				} catch (err:ReferenceError) {
					//There was an error...no such font found!
					return;
				}//catch
				var tempInstance=new fontClass();
				realFontName=tempInstance.fontName;				
				tempInstance=null;
			}//if			
			var format:TextFormat = new TextFormat();
			format.font=realFontName;
			field.embedFonts=true;
		}//set font
	}

}