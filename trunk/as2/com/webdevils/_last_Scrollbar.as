import mx.utils.Delegate;

class Scrollbar {
	private var target_mc:MovieClip;
	private var track_mc:MovieClip;
	private var drag_mc:MovieClip;
	private var call_back:Function;
	
	private var range:Number;
	private var t_limit:Number;
	private var b_limit:Number;
	private var l_limit:Number;
	private var r_limit:Number;
	private var min_limit:Number;
	private var max_limit:Number;
	
	private var my_enabled:Boolean;
	private var horizontal_scroll:Boolean = false;
	
	public var percent:Number;
	

	public function Scrollbar( host_mc:MovieClip, call_back_func:Function ) {
		target_mc = host_mc;
		track_mc = host_mc.track_mc;
		drag_mc  = host_mc.drag_mc;
		call_back = call_back_func;
		
		get_limits();
		
		drag_mc.onPress = Delegate.create( this, drag );
		drag_mc.onRelease = drag_mc.onReleaseOutside = Delegate.create( this, endDrag );
	}
	
	private function get_limits():Void {
		var track_bounds = track_mc.getBounds( target_mc );
		if ( horizontal_scroll ) {
			l_limit = track_bounds.xMin;
			r_limit = track_bounds.xMax - track_bounds.xMin - drag_mc._width;
			t_limit = 0;
			b_limit = 0;
			range = r_limit - l_limit;
		} else {
			t_limit = track_bounds.yMin;
			b_limit = track_bounds.yMax - track_bounds.yMin - drag_mc._height;
			l_limit = 0;
			r_limit = 0
			range = b_limit - t_limit;
		}
	}
	
	
	public function scroll_horizontal( b:Boolean ):Void {
		horizontal_scroll = b;
		get_limits();
	}
	
	
	
	private function drag():Void {
		drag_mc.startDrag( false, l_limit, t_limit, r_limit, b_limit );
		drag_mc.onMouseMove = Delegate.create( this, calculate_percent );
	}
	
	private function endDrag():Void {
		drag_mc.stopDrag();
		delete drag_mc.onMouseMove;
	}
		
	private function calculate_percent():Void {
		if ( horizontal_scroll ) {
			percent = ( drag_mc._x - l_limit ) / range;
		} else {
			percent = ( drag_mc._y - t_limit ) / range;
		}
		call_back( percent );
	}
	
	public function getValue():Number {
		return percent;
	}
	
	public function setValue( n:Number ):Void {
		percent = n / 100;
		if ( horizontal_scroll ) {
			drag_mc._x = l_limit + ( percent * range );
		} else {
			drag_mc._y = t_limit + ( percent * range );
		}
		call_back( percent );
 	}
	
	
	public function set enabled( b:Boolean ):Void {
		my_enabled = b;
		drag_mc.enabled = b;
		track_mc.enabled = b;
	}
	
	public function get enabled():Boolean {
		return my_enabled;
	}
	
}