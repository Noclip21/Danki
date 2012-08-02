package
{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import GlobalVars;
	import Utils
	
	public class GUI extends MovieClip
	{
		
		var P1 = GlobalVars.vars.P1;
		var P2 = GlobalVars.vars.P2;
		
		public function GUI()
		{
			this.addEventListener(Event.ENTER_FRAME,function() { updateMsg(); });
			
			btMaisMidia.addEventListener(MouseEvent.CLICK,function() { invest(100,P1); });
			btMenosMidia.addEventListener(MouseEvent.CLICK,function() { invest(-100,P1); });
			
			btMaisPreco.addEventListener(MouseEvent.CLICK,function() { chPrice(10,P1); });
			btMenosPreco.addEventListener(MouseEvent.CLICK,function() { chPrice(-10,P1); });
			
			btGo.addEventListener(MouseEvent.CLICK,function(){ GO(); });
		
		}
		function invest(money,P)
		{
			if(money > 0)
			{
				if(P.money - money < 0)
					return;
			}else{
				if(P.inv + money < 0)
					return;
			}
			P.money -= money;
			P.inv += money;
		}
		function chPrice(money,P)
		{
			if(P.price + money < 0 )
				P.price = 0;
			else
				P.price += money;
		}
		function GO()
		{
			
				//AI
			invest(
				 P1.inv + Math.round(Math.random()*5)*100 - 100
					,P2);
			
			World(GlobalVars.vars.world).GO();
			P1.inv = 0;
			P2.inv = 0;
		}
		function updateMsg()
		{
			if(msgFoundsP1.text != P1.money)
			{
				msgFoundsP1.alpha = .5;
				msgFoundsP1.text = P1.money;
			}
			msgInvestimentP1.text = P1.inv;
			
			msgPriceP1.text = P1.price;
			msgPriceP2.text = P2.price;
			
			Utils.alph(msgFoundsP1,0,1,.05);
		}
	}
	
}
