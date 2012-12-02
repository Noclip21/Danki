package prop
{
	import map.*;
	import perspective.*;
	import flash.geom.Point;
	
	public class Prop extends WorldObject
	{

		public function Prop(point				:Point,
							 parentsToAnimation :Number = 0,
							 callback			:Function = null)
		{
			super(Map.currentMap,1,point.x,point.y,false,parentsToAnimation,callback);
		}

	}
	
}
