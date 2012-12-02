package map
{
	import def.*;
	import perspective.*;
	import building.*;
	import unit.*;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;

	
	public class Map extends WorldMap
	{
		public static var currentMap :Map;
		public static var level		 :Number;
		public static var buildings   :Array;
		
		public var totalLanes :Number;
		/*public static var 
		public static var _lane = [[ 100 */
		
		public static function getBuilding(lane :Number,defClass :Class)
		{
			var classString :String = Class(defClass).toString();
			for(var i=0; i<buildings[lane].length; i++)
				if(Utils.getClass(buildings[lane][i]) == classString)
					return buildings[lane][i];
		}
		
		
		public function Map(defParent	:MovieClip,
							source		:MovieClip,
							lvl			:Number = 1)
		{
			if(currentMap) BaseMc(currentMap).kill();
			currentMap = this;
			level = 	 lvl;
			
			gotoAndStop('lvl'+lvl);
			super(defParent,0,source);
			
			createBuildings();
			
			BaseMc(this).destructor = World_destructor;
		}
		function World_destructor()
		{
			var array = Utils.copy(WorldObject.objects);
			for(var i=0; i<array.length; i++)
				BaseMc(array[i]).kill();
		}
		function createBuildings()
		{
			var lanes = totalLanes = 5;
			
			buildings = new Array();
			var base = 146;
			var coef = 138;
			for(var i=0; i<lanes; i++)
			{
				buildings.push(new Array());
				
				buildings[i].push(new Casa(i,0,				base + coef*i));
				buildings[i].push(new Loja(i,677,			base + coef*i));
				buildings[i].push(new CastlePlayer(i,772,	base + coef*i));
				buildings[i].push(new CastleCpu(i,1650,		base + coef*i));
			}
			focusGuerra();
		}
		public function focusGuerra()	{ cam = new Point(1180,384); }
		public function focusComercio() { cam = new Point(512,384);  }
	}
	
}
