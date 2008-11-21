/**
FontExport (AS3), version 1.0

Created an external swf with font.
    * Created a new Fla and add a font to the library.
    * In the Library pane(F11), click the options dropdown, and choose "New Font"
    * Select a font, size and style–size is not important (arguably)–however, I believe you will have to create separate fonts for each style you require. The name is not important really either.
    * Right click the new font in the Library and select "Linkage…"
          o Check "Export for ActionScript" and "Export in first frame".
          o Give it a Class:–this name is important and you will need to remember it.
    * Publish the swf as "font-Fontname.swf".


<pre>
 ____                   _      ____ 
|  __| _ __ ___    ___ | | __ |__  |
| |   | '_ ` _ \  / __|| |/ /    | |
| |   | | | | | || (__ |   <     | |
| |__ |_| |_| |_| \___||_|\_\  __| |
|____|                        |____|

</pre>

@class  	: 	FontExport
@author 	:  	Matthijs C. Kamstra [mck]
@version 	:	1.0 - class creation (AS3)
@since 	:	21-11-2008 12:08 

Changelog:
		v 1.0 [21-11-2008 12:08] - Initial release

*/
package nl.matthijskamstra.fonts {
	
	import flash.display.*;
	import flash.events.*;	
	import flash.text.*;

	public class FontExport extends MovieClip {
		
		private var embeddedFonts:Array;
		
		// Constructor
		public function FontExport(  ) {
			//trace( "FontExport.FontExport class instantiated");
			embeddedFonts = Font.enumerateFonts(false);
			for(var i:int = 0; i < embeddedFonts.length; i++) {
				showExport (i); 
			}
		}
		
		private function showExport ($id:int = 0) {
			
			var exampleTF:TextField = new TextField();
			exampleTF.autoSize = TextFieldAutoSize.LEFT;
			exampleTF.embedFonts = true;
			exampleTF.y = $id * 25;
			
			var format:TextFormat = new TextFormat();
			format.font = embeddedFonts[$id].fontName;
			format.color = 0x393939;
			format.size = 25;
			format.bold = (embeddedFonts[$id].fontStyle == 'bold');
			format.italic = (embeddedFonts[$id].fontStyle == 'italic');
			
			exampleTF.defaultTextFormat = format;
			exampleTF.text = embeddedFonts[$id].fontName + ' ' + embeddedFonts[$id].fontStyle;
			
			addChild(exampleTF);
			
		}
		
		
	} // end class
	
} // end package
