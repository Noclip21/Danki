package trigger
{
	import building.*;
	
	// Double Money
	public class IncreaseIondume extends GlobalEvent
	{
		static var enabled :Boolean = false;
		
		
		public function IncreaseIondume()
		{
			super(10000);
			
			if(enabled)
			{
				kill();
				return;
			}
			enabled = true;
			
			display =	IncreaseIondume_display;
			callback =	IncreaseIondume_callback;
		}
		function IncreaseIondume_display()
		{
			Loja.special = true;
			Loja.incomingCoef = 2;
		}
		function IncreaseIondume_callback()
		{
			Loja.special = false;
			Loja.incomingCoef = 1;
			
			enabled = false;
		}

	}
	
}
