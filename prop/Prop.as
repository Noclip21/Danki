package prop
{
	import screen.*;
	import perspective.*;
	import flash.geom.Point;
	
	public class Prop extends WorldObject
	{

		public function Prop(point				:Point,
							 parentsToAnimation :Number = 0,
							 callback			:Function = null)
		{
			super(Game.currentMap,1,point.x,point.y,false,parentsToAnimation,callback);
		}

	}
	
}
