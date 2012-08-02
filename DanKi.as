package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import GlobalVars;
	
	public class DanKi extends MovieClip
	{
		
		var objects = GlobalVars.vars.objects = new Array();
		
		
		var P1 = GlobalVars.vars.P1 = new Object();
		var P2 = GlobalVars.vars.P2 = new Object();
		
		var bars = GlobalVars.vars.bars = new Array();
		
		public function DanKi()
		{
			stage.addEventListener(Event.ENTER_FRAME,event_enterFrame);
			
			resetStats(P1);
			resetStats(P2);
		}
		public function resetStats(P)
		{
			P.money = 18000;
			P.inv = 0;
			P.price = 50;
		}
		
		
		public function event_enterFrame(e :Event)
		{
			for(var i=0; i<objects.length; i++)
				objects[i].display();
		}
	}
	
}
