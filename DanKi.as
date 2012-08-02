package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import GlobalVars;
	
	public class DanKi extends MovieClip
	{
		
		var objects = GlobalVars.vars.objects = new Array();
		GlobalVars.vars.castles = new Array();
		
		var level = 0;
		var world :World;
		
		public function DanKi()
		{
			nextLevel();
			
			stage.addEventListener(Event.ENTER_FRAME,event_enterFrame);
			
		}
		
		public function nextLevel()
		{
			level++;
			
			GlobalVars.vars.castles.length = 0;
			GlobalVars.vars.objects.length = 0;
			
			MovieClip(root).addChild(world = new World(level));
		}
		
		
		
		public function event_enterFrame(e :Event)
		{
			for(var i=0; i<objects.length; i++)
				objects[i].display();
		}
	}
	
}
