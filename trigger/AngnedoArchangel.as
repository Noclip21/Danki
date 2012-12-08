package trigger
{
	import unit.*;
	
	// Double HP
	public class AngnedoArchangel extends GlobalEvent
	{
		static var enabled :Boolean = false;
		
		
		public function AngnedoArchangel()
		{
			super(10000);
			
			if(enabled)
			{
				kill();
				return;
			}
			enabled = true;
			
			display =	AngnedoArchangel_display;
			callback =	AngnedoArchangel_callback;
		}
		function AngnedoArchangel_display()
		{
			Warrior.special = true;
			Warrior.hpCoef = 2;
		}
		function AngnedoArchangel_callback()
		{
			Warrior.special = false;
			Warrior.hpCoef = 1;
			
			enabled = false;
		}

	}
	
}
