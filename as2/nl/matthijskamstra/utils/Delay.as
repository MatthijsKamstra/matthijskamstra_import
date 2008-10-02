import nl.advance.GlobalVisual;
/* 
 * Delay, version 1.0
 *
 * Waits a given number of frames and executes the defined $onComplete. Supports any number of simultaneous instances. 
 * 
 * * @example:
*		s = new nl.matthijskamstra.wait.WaitXframes(_root,2,"test",_root);
*		function test(){
*			trace("test");
*		}
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
 * @class : 	Delay
 * @author :  	Matthijs C. Kamstra [mck]
 * @version:
 *		r1.0 - class creation (rewrite from a couple of delay classes)
 * @since :		10-9-2008 11:22 
 * 
 */
class nl.matthijskamstra.utils.Delay {
	// Constants:
	public static var CLASS_REF = nl.matthijskamstra.utils.Delay;
	public static var CLASS_NAME : String = "Delay";
	public static var LINKAGE_ID : String = "nl.matthijskamstra.utils.Delay";
	// vars
	
	private var onComplete			:Function;	//The function that should be triggered when this tween has completed
	private var onCompleteParams	:Array;		//An array containing the parameters that should be passed to the this.onComplete when this tween has finished.
	private var xFrames				:Number;
	/**
	* Constructor
	*/
	public function Delay( )  {
		trace ( '+ ' + LINKAGE_ID + ' class instantiated');
	}
	
	/**
	* checks if a xmlSourcePath is given
	* and extracts the arguments
	*
	* @usage   		var __WaitXframes0 = new nl.matthijskamstra.wait.WaitXframes ( _root , 2 , "afterWaitingXFramesFunction" , _root );
	*				var __WaitXframes1 = new nl.matthijskamstra.wait.WaitXframes ( _root , 10 , "afterWaitingXFramesFunction" , this , "param 1", "param 2", "param 3");
	*				var __WaitXframes2 = new nl.matthijskamstra.wait.WaitXframes ( this , 20 , "afterWaitingXFramesFunction" , this , "derde xml" , 1, 2, 3, 4, 5);
	*				var __WaitXframes3 = new nl.matthijskamstra.wait.WaitXframes ( this , 20 , "afterWaitingXFramesFunction" , this , "vierde xml");
	*				var cs = new nl.ajaxGallery.CreateSlide();
	*				var __WaitXframes4 = new nl.matthijskamstra.wait.WaitXframes (cs, 20 , "afterWaitingXFramesFunction"  );
	* 
	* @param	_root
	* @param	$xFrames
	* @param	$onComplete
	* @param	scope
	*/
	public function waitXframes($onComplete:Function, $xFrames:Number, $param:Array) {
		
		if ($onComplete == null) { return; }
		
		this.onComplete = $onComplete;
		this.onCompleteParams = $param || [];// Get any extra arguments for $onComplete
		this.xFrames = $xFrames || 1;
		
		if(!_global.xFramesCounter){ _global.xFramesCounter = 0; }
		_global.xFramesCounter++;
		_root.createEmptyMovieClip("xFrames"+_global.xFramesCounter,_root.getNextHighestDepth() );
		// Make shorthand and fill with required variables
		var delayContainerMC:MovieClip = _root["xFrames"+_global.xFramesCounter];
		delayContainerMC.waitCount = 0;
		delayContainerMC.xFrames = $xFrames;
		delayContainerMC.onComplete = this.onComplete;
		delayContainerMC.onCompleteParams = this.onCompleteParams;
		delayContainerMC.onEnterFrame = function(){
			this.waitCount++;
			if(this.waitCount > this.xFrames){
				//trace('this.onCompleteParams : ' + this.onCompleteParams);
				this.onComplete.apply (null, this.onCompleteParams); // Execute routine
				this.onEnterFrame = undefined; // Kill event
				this.removeMovieClip(); // Remove instance
			}
		}
	}
	
	//////////////////////////////////////// static ////////////////////////////////////////	
	
	/**
	 * wait in seconds
	 * 
	 * @usage   	nl.matthijskamstra.utils.Delay.waitSeconds(3, my_function, true);
	 * @param	$delayInSec		in seconds
	 * @param	$obj				scope
	 * @param	$func			on complete function executed
	 */
	public static function waitSeconds ($delayInSec:Number, $func, $obj) {
		//trace( "Delay.waitSeconds > $delayInSec : " + $delayInSec + ", $func : " + $func + ", $obj : " + $obj );
		var delay = $delayInSec * 1000;
		var args = arguments.splice (2);
		//trace( "args : " + args );
		
		var timeOutInterval = setInterval (function () {
			//trace ('execute');
			clearInterval (timeOutInterval);
			$func.apply($obj, args);
			updateAfterEvent ();
		}, delay);
	}

	
	/**
	 * @usage	nl.matthijskamstra.utils.Delay.frames (foobar, 1, [1])
	 * @param	$onComplete
	 * @param	$xFrames
	 * @param	$param
	 */
	static public function frames ($onComplete:Function, $xFrames:Number, $param:Array) {
		trace( "Delay.shortxFrames > $onComplete : " + $onComplete + ", $xFrames : " + $xFrames + ", $param : " + $param );
		var _delay:Delay = new Delay();
		_delay.waitXframes ($onComplete, $xFrames, $param);
		
	}
	/**
	* [[ example code ]]
	* this is a example function you can use to extract the extraArguments
	*
	* @param   	param_obj		extra arguments
	*/
	/*
	public function afterWaitingXFramesFunction (param_obj : Object) : Void
	{
		trace ("------ " + getTimer () + " ms");
		trace ('format_xml.getBytesTotal(): ' + format_xml.getBytesTotal () + " bytes");
		for (var i in param_obj)
		{
			trace ('\tparam_obj :: key: ' + i + ', value: ' + param_obj [i] + "(" + typeof (param_obj [i]) + ")");
		}
	}
	*/



	

} // end class
