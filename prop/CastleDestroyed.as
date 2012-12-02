package prop
{
	import perspective.*;
	import flash.display.MovieClip;
	
	public class CastleDestroyed extends WorldObject
	{

		public function CastleDestroyed(defParent :WorldMap,frame :String = 'AI',posx :Number = 0,posy :Number = 0)
		{
			super(defParent,0,posx,posy);
			
			gotoAndStop(frame);
		}

	}
	
}
