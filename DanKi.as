package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import GlobalVars;
	
	public class DanKi extends MovieClip
	{
		var global = GlobalVars.vars;
		
		public function DanKi()
		{
			global.objects = new Array();
			global.castles = new Array();
			
			global.lvl = 0;
			global.world;
			global.GUI;
		
		
			nextLevel();
			
			stage.addEventListener(Event.ENTER_FRAME,event_enterFrame);
			
		}
		
		public function nextLevel()
		{
			//MovieClip(root).addChild(global.GUI = new MovieClip());
			
			global.lvl = 1;
			
			global.castles.length = 0;
			global.objects.length = 0;
			
			MovieClip(root).addChild(global.world = new World(global.lvl));
		}
		
		
		
		public function event_enterFrame(e :Event)
		{
			for(var i=0; i<global.objects.length; i++)
				global.objects[i].display();
		}
	}
	
}
