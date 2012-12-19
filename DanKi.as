package
{
	import def.*;
	import screen.*;
	
	public class Danki extends Main
	{		
		static var ref :Danki;
		
		
		static var scr :Screen;
		
		
		public function Danki()
		{
			ref = this;
			
			mainScreen();
		}
		public static function mainScreen()
		{
			if(scr) scr.kill();
			scr = new MainScreen();
		}
		public static function gameScreen()
		{
			if(scr) scr.kill();
			scr = new Game(new Cenario());
		}
		public static function endgameScreen()
		{
			if(scr) scr.kill();
			scr = new EndgameScreen();
		}
	}
}