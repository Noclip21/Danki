package unit
{
	import def.*;
	import gui.*;
	import building.*;
	import flash.geom.Point;
	
	public class Cliente extends Human
	{
		public static var objects :Array;
		
		
		static var _special :Boolean;
		
		
		static var range	:Number = 100;
		public var bought	:Boolean;
		
		
		public static function set special(mode :Boolean)
		{
			_special = mode;
			if(objects)
			for(var i=0; i<objects.length; i++)
				if(mode) Unit(objects[i]).onSpecial();
				else	 Unit(objects[i]).outSpecial();
		}
		
		
		public function Cliente(spawn :Casa)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			super(Building(spawn),1,1,500);
			
			bought = false;
			
			if(_special) onSpecial();
			
			gotoAndStop(Math.round(Math.random()*(totalFrames - 1) + 1));
			
			BaseMc(this).display = 		Cliente_display;
			BaseMc(this).destructor =	Cliente_destructor;
		}
		function Cliente_destructor()
		{
			Utils.removeObject(this,objects);
		}
		function walk(target :Building)
		{
			moveTo(new Point(target.x,target.y));
		}
		function goHome()
		{
			walk(casa);
			
			if(Utils.dist(this,casa) <= range) BaseMc(this).kill();
		}
		function buy()
		{
			loja.sell(Math.round(Math.random()*(Loja.productsLen-1)));
			bought = true;
		}
		function goBuy()
		{
			if(!bought)
				if(Utils.dist(this,loja) <= range)
				{
					if(avelx != 0 || avely != 0) timerStart();
					
					if(!timer)
					{
						buy();
						timerStart();
					}
					
					avelx = avely = 0;
				}else
					walk(loja);
		}
		function Cliente_display()
		{
			if(!bought)
			{
				if(loja) goBuy();
				else	 goHome();
			}else
				goHome();
		}

	}
	
}
