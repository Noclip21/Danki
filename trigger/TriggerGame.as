package  trigger
{
	import unit.*;
	import screen.*;
	import building.*;
	
	public class TriggerGame extends Trigger
	{

		public function TriggerGame()
		{
			Trigger(this).display = TriggerGame_display;
		}
		function TriggerGame_display()
		{
			var numCastlePLayer :Number = 0;
			var numCastleCpu :Number	= 0;
			
			
			for(var i=0; i<Game.totalLanes; i++)
			{
				if(Game.getBuilding(i,CastlePlayer)) numCastlePLayer++;
				if(Game.getBuilding(i,CastleCpu))	 numCastleCpu++;
			}
			
			if(numCastlePLayer < Game.totalLanes || numCastleCpu == 0)
			{
				Danki.endgameScreen();
			}
		}

	}
	
}
