package building
{
	import def.*;
	import unit.*;
	
	public class CastleCpu extends Castle
	{
		static var unitClasses :Array = [Arqueiro,Lanceiro,Samurai];
		
		
		public function CastleCpu(defLane	:Number,
								  posx		:Number,
								  posy		:Number)
		{
			super(defLane,posx,posy);
			
			gotoAndStop("vermelho");
			
			BaseMc(this).display = CastleCpu_display;
		}
		function CastleCpu_display()
		{
			if(Math.random()*100 < 0.05)
				addUnit(Class(unitClasses[Math.round(Math.random()*(unitClasses.length-1))]));
		}
	}
	
}
