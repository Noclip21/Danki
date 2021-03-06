﻿package building
{
	import def.*;
	import unit.*;
	import screen.*;
	
	public class Casa extends Building
	{
		public static var objects :Array;
		
		
		public static var spawnRate :Number = 0.3;
		
		
		
		public function Casa(lane :Number,
							 posx :Number,
							 posy :Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			super(lane,2000,1,posx,posy);
			
			BaseMc(this).display =		Casa_display;
			BaseMc(this).destructor =	Casa_destructor;
		}
		function Casa_destructor()
		{
			Utils.removeObject(this,objects);
		}
		function Casa_display()
		{
			if(spawnRate > Math.random()*100)
			if(Game.getBuilding(lane,Loja))
				addUnit(Cliente);
		}

	}
	
}
