 /**
*
* @author
* @version
**/
class nl.matthijskamstra.grid.Builder
{
	static var startXpos : Number = 0;
	static var startYpos : Number = 0;
	static var OffsetX : Number = 20;
	static var OffsetY : Number = 20;
	static var MaxHorizontal : Number = 10;
	static var MaxVertical : Number = 10;
	//
	static var gridcounterX : Number = 0;
	static var gridcounterY : Number = 0;
	//
	/**
	* Enter description here
	*
	* @usage
	* @param   target_mc
	* @param   startXpos
	* @param   startYpos
	* @param   OffsetX
	* @param   OffsetY
	* @param   MaxHorizontal
	* @param   MaxVertical
	* @return
	*/
	function Builder (_startXpos : Number , _startYpos : Number , _OffsetX : Number, _OffsetY : Number, _MaxHorizontal : Number, _MaxVertical : Number)
	{
		if (_startXpos == null)
		{
			return;
		}
		init (_startXpos, _startYpos, _OffsetX, _OffsetY, _MaxHorizontal, _MaxVertical);
	}
	function init (_startXpos : Number , _startYpos : Number , _OffsetX : Number, _OffsetY : Number, _MaxHorizontal : Number, _MaxVertical : Number)
	{
		startXpos = _startXpos ;
		startYpos = _startYpos ;
		OffsetX = _OffsetX ;
		OffsetY = _OffsetY ;
		MaxHorizontal = _MaxHorizontal ;
		if (_MaxVertical == null)
		{
			MaxVertical = Infinity ;
		} else 
		{
			MaxVertical = _MaxVertical ;
		}
		trace ("set!!")
	}
	//
	public function getGridPostion () : Array
	{
		if (gridcounterX >= MaxHorizontal)
		{
			gridcounterX = 0;
			gridcounterY ++;
			if (gridcounterY >= MaxVertical)
			{
				gridcounterX = 0;
				gridcounterY = 0;
			}
		}
		//
		var xPos : Number = startXpos + (gridcounterX * OffsetX);
		var yPos : Number = startYpos + (gridcounterY * OffsetY);
		//
		gridcounterX ++;
		//
		return ([xPos, yPos]);
	}
}
