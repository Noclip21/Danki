package building
{
	import def.*;
	import unit.*;
	import map.*;
	
	public class Casa extends Building
	{
		public static var objects :Array;
		
		
		public function Casa(lane :Number,
							 posx :Number,
							 posy :Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			super(lane,2000,1,posx,posy);
			
			maxUnits = 3;
			
			BaseMc(this).display =		Casa_display;
			BaseMc(this).destructor =	Casa_destructor;
		}
		function Casa_destructor()
		{
			Utils.removeObject(this,objects);
		}
		function Casa_display()
		{
			if(0.3 > Math.random()*100)
			if(Map.getBuilding(lane,Loja))
				addUnit(Cliente);
		}

	}
	
}
