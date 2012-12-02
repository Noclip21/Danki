package unit
{
	import def.*;
	import map.*;
	import building.*;
	import flash.geom.Point;
	
	public class Human extends Unit
	{
		public var objects :Array;
		
		
		var _speed :Number;
		
		
		public function get speed()			{ return _speed; }
		
		
		public function get casa()			{ return Casa		 (Map.getBuilding(lane,Casa			));	}
		public function get loja()			{ return Loja		 (Map.getBuilding(lane,Loja			));	}
		public function get castlePlayer()	{ return CastlePlayer(Map.getBuilding(lane,CastlePlayer )); }
		public function get castleCpu()		{ return CastleCpu	 (Map.getBuilding(lane,CastleCpu	));	}
		
		
		public function Human(defBuilding :Building,
							  hp		  :Number = 100,
							  speed		  :Number = 1,
							  timer		  :Number = 100)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			
			super(defBuilding,defBuilding.lane,defBuilding.x,defBuilding.y,hp,timer);
			
			
			_speed = speed;
			
			
			BaseMc(this).destructor = Human_destructor;
		}
		function Human_destructor()
		{
			Utils.removeObject(this,objects);
		}
		public function moveTo(target :Point)
		{
			var ang = Utils.ang(this,target);
				avelx = Math.cos(ang)*speed;
				avely = Math.sin(ang)*speed;
				
			if(avelx > 0) scaleX = Math.abs(scaleX);
			if(avelx < 0) scaleX = -Math.abs(scaleX);
		}

	}
	
}
