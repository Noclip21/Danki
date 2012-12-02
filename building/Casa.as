package building
{
	import def.*;
	import unit.*;
	import map.*;
	
	public class Casa extends Building
	{
		public static var objects :Array;
		
		public static var maxUnits :Number = 3;
		
		
		public function Casa(lane :Number,
							 posx :Number,
							 posy :Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			super(lane,2000,1,posx,posy);
			
			BaseMc(this).display =		Loja_display;
			BaseMc(this).destructor =	Loja_destructor;
		}
		function Loja_destructor()
		{
			Utils.removeObject(this,objects);
		}
		function Loja_display()
		{
			if(Map.getBuilding(lane,Loja))
				addUnit(Cliente);
		}

	}
	
}
