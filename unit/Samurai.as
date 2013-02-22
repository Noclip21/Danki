package unit
{
	import def.*;
	import prop.*;
	import building.*;
	
	public class Samurai extends Warrior
	{
		public static function get cost(){ return 30; }
		
		
		public function Samurai(castle :Castle)
		{
			super(castle,
				  30, 	// hp
				  0.8,	// speed
				  1,	// attackForce
				  300,	// attackTimer
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
