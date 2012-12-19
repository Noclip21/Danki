package building
{
	import def.*;
	import unit.*;
	import screen.*;
	import perspective.*;
	
	
	public class Building extends Unit
	{
		public static var objects :Array;
		
		public var units	:Array;
		public static var maxUnits :Number = 6;
		
		
		public function Building(defLane		:Number,
								 defSpawnTime	:Number = 1000,
								 hp				:Number = 1,
								 posx			:Number = 0,
								 posy			:Number = 0)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			super(null,defLane,posx,posy,hp,defSpawnTime);
			
			units = new Array();
			
			BaseMc(this).destructor = Building_destructor;
		}
		function Building_destructor()
		{
			for(var i=0; i<units.length; i++)
				BaseMc(units[i]).kill();
			Utils.removeObject(this,Game.buildings[lane]);
			Utils.removeObject(this,objects);
		}
		public function addUnit(unitClass :Class)
		{
			if(!timer && units.length < maxUnits)
			{
				units.push(new unitClass(this));
				timerStart();
			}
		}
	}
	
}
