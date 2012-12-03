package unit
{
	import def.*;
	import gui.*;
	import building.*;
	import flash.geom.Point;
	
	public class Cliente extends Human
	{
		static var range :Number = 100;
		
		public static var money :Number = 5;
		var wallet :Number;
		
		
		public function Cliente(spawn :Casa)
		{
			super(Building(spawn),1,1,500);
			
			wallet = money;
			
			gotoAndStop(Math.round(Math.random()*(totalFrames - 1) + 1));
			
			BaseMc(this).display = Cliente_display;
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
		function pay()
		{
			loja.sell(wallet);
			new AugmentedText(x,y-10,"$"+wallet,100,0x00FF00);
			wallet = 0;
		}
		function buy()
		{
			if(wallet > 0)
				if(Utils.dist(this,loja) <= range)
				{
					if(avelx != 0 || avely != 0) timerStart();
					
					if(!timer)
					{
						pay();
						timerStart();
					}
					
					avelx = avely = 0;
				}else
					walk(loja);
		}
		function Cliente_display()
		{
			if(wallet > 0)
			{
				if(loja) buy();
				else	 goHome();
			}else
				goHome();
		}

	}
	
}
