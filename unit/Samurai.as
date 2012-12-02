package unit
{
	import def.*;
	import prop.*;
	import building.*;
	
	public class Samurai extends Warrior
	{

		public function Samurai(castle :Castle)
		{
			super(castle,
				  10, 	// hp
				  1,	// speed
				  1,	// attackForce
				  500,	// attackTimer
				  100	// range
				  );
			
			BaseMc(this).destructor = Samurai_destructor;
		}
		function Samurai_destructor()
		{
			new SamuraiDead(this);
		}

	}
	
}
