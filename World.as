package
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class World extends Screen
	{
		
		public static var objects :Array;
		
		public static var totalLanes :Number;
		public static var lane :Array;
		
		public function World()
		{
			objects = new Array();
			totalLanes = 3;
			lane = new Array();
			
			for(var i=0; i<totalLanes; i++)
			{
				lane[i] = new Array();
				
				var casa = new Casa(i);
					addChild(casa);
					lane[i][0] = casa;
					casa.x = 50;
					casa.y = 150*i+200;
					
				var loja = new Loja();
					addChild(loja);
					lane[i][1] = loja;
					loja.x = 750;
					loja.y = 150*i+200;
			}
			
			Utils.blink(this);
		}
		
		function World_display()
		{
			
		}
		override public function display()
		{
			World_display();
			BaseMc_display();
		}
	}
}
