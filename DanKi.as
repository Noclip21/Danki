package
{
	import def.*;
	import map.*;
	
	public class Danki extends Main
	{		
		static var ref :Danki;
		
		
		public function Danki()
		{
			ref = this;
			
			nextLevel();
		}
		public static function nextLevel()
		{
			new Map(new Cenario());
		}
	}
}