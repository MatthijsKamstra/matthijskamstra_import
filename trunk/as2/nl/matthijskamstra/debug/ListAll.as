

/**
 * Enter description here
 *
 * @author  Matthijs C. Kamstra [mck]
 * @version 1.0
 * @since
 */
class nl.matthijskamstra.debug.ListAll {
	
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.debug.ListAll;
	public static var LINKAGE_ID:String = "nl.matthijskamstra.debug.ListAll";
	
	//
	private var myTabs:String;
	private var myType:Object;
	
	/**
	 * Enter description here
	 *
	 * @usage
	 * @param   target_mc
	 * @param   myTabs
	 * @return
	 */
	function ListAll(target_mc:MovieClip, myTabs:String){
		if(target_mc == null){
			return;
		}
		init(target_mc, myTabs);
	}
	
	
	//
	// ****************************************************************
	// traceDebuger by Matthijs C. Kamstra [mck]
	// still in experimental fase!
	// ****************************************************************
	/**
	 * It's a recursive function that will trace everything in the swf
	 *
	 * @usage
	 *
	 * @example 			var listall = new nl.matthijskamstra.debug.ListAll(_root);
	 *
	 * @param   target_mc  		Specifies a reference to the root movie clip Timeline.
	 * @param   myTabs	 		string that specifies what to use for tabs
	 * @return
	 */
	function init(target_mc:MovieClip, myTabs:String){
		var thisObj = this;
		if(target_mc == undefined){
			return;
		}
		if(myTabs == undefined){
			trace("------ :: ListAll :: ------");
			myTabs = "";
		}
		if(myType == null){
			if(target_mc._name.length == 0){
				//trace ("_root");
			} else {
				//trace (target_mc._name);
				myTabs += "\t|\t";
			}
		}
		for(var i in target_mc){
			var myType = typeof target_mc[i];
			switch(myType){
				case "string":
					trace(myTabs + i + ":" + myType + " = '" + target_mc[i] + "'");
					break;
				case "number":
				case "boolean":
					trace(myTabs + i + ":" + myType + " = " + target_mc[i]);
					break;
				case "function":
					trace(myTabs + "functionName: " + i + " - " + target_mc[i]);
					break;
				case "movieclip":
					trace(myTabs + i + ":" + myType + "\t( " + target_mc[i] + " )");
					break;
				case "object":
					// Button
					// Text field
					// Object
					trace(myTabs + i + ":" + myType + " - " + i + " - button/textfield/object");
					break;
				default:
					trace(myTabs + "__UNKNOWN__ " + myType + ": " + i);
					break;
			}
			//trace (myTabs + myType + ": " + i);
			thisObj.init(target_mc[i], myTabs);
		}
	}
	
}
