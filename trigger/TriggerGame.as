package  trigger
{
	import map.*;
	import building.*;
	import unit.*;
	
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
			
			
			for(var i=0; i<Map.totalLanes; i++)
			{
				if(Map.getBuilding(i,CastlePlayer)) numCastlePLayer++;
				if(Map.getBuilding(i,CastleCpu))	numCastleCpu++;
			}
			
			if(numCastlePLayer < Map.totalLanes)
			{
				Danki.nextLevel();
				//GlobalEvent.kill();
			}
		}

	}
	
}
