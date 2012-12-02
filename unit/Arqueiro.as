package unit
{
	import def.*;
	import prop.*;
	import building.*;
	
	public class Arqueiro extends Warrior
	{

		public function Arqueiro(castle :Castle)
		{
			super(castle,
				  10, 	// hp
				  1,	// speed
				  1,	// attackForce
				  1000,	// attackTimer
				  300	// range
				  );
			
			BaseMc(this).destructor = Arqueiro_destructor;
		}
		function Arqueiro_destructor()
		{
			new ArqueiroDead(this);
		}

	}
	
}
