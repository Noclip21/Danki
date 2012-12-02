package prop
{
	import def.*;
	import perspective.*;
	import flash.display.MovieClip;


	public class Exp extends WorldObject
	{
		
		public function Exp(defParent :MovieClip,posx :Number,posy :Number)
		{
			super(defParent,posx,posy,1,function(){ BaseMc(this).kill(); });
		}
	}
	
}
