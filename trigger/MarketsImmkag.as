package trigger
{
	import unit.*;
	import building.*;
	
	// Double Clients
	public class MarketsImmkag extends GlobalEvent
	{
		static var enabled :Boolean = false;
		
		
		public function MarketsImmkag()
		{
			super(10000);
			
			if(enabled)
			{
				kill();
				return;
			}
			enabled = true;
			
			display =	MarketsImmkag_display;
			callback =	MarketsImmkag_callback;
		}
		function MarketsImmkag_display()
		{
			Cliente.special = true;
			Casa.spawnRate = 0.6;
		}
		function MarketsImmkag_callback()
		{
			Cliente.special = false;
			Casa.spawnRate = 0.3;
			
			enabled = false;
		}

	}
	
}
