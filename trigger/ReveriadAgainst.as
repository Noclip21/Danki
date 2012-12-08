package trigger
{
	import unit.*;
	
	// Double attack
	public class ReveriadAgainst extends GlobalEvent
	{
		static var enabled :Boolean = false;
		
		
		public function ReveriadAgainst()
		{
			super(10000);
			
			if(enabled)
			{
				kill();
				return;
			}
			enabled = true;
			
			display = 	ReveriadAgainst_display;
			callback =	ReveriadAgainst_callback;
		}
		function ReveriadAgainst_display()
		{
			Warrior.special = true;
			Warrior.attackCoef = 2;
		}
		function ReveriadAgainst_callback()
		{
			Warrior.special = false;
			Warrior.attackCoef = 1;
			
			enabled = false;
		}

	}
	
}
