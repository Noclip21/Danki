package unit
{
	import def.*;
	import prop.*;
	import building.*;
	
	public class Lanceiro extends Warrior
	{
		public static function get cost(){ return 10; }
		
		
		public function Lanceiro(castle :Castle)
		{
			super(castle,
				  20, 	// hp
				  1,	// speed
				  1,	// attackForce
				  500,	// attackTimer
				  100	// range
				  );
			
			BaseMc(this).destructor = Lanceiro_destructor;
		}
		function Lanceiro_destructor()
		{
			new LanceiroDead(this);
		}

	}
	
}
