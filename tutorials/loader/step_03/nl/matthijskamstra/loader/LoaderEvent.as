package step_03.nl.matthijskamstra.loader 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Matthijs Kamstra aka [mck]
	 */
	public class LoaderEvent extends Event 
	{
		
		public function LoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new LoaderEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("LoaderEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}