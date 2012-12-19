package screen
{
	import def.*;
	import unit.*;
	import flash.events.MouseEvent;
	
	
	public class EndgameScreen extends Screen
	{
		
		
		public function EndgameScreen()
		{
			super(Main.gui);
			
			unitsDead.text =	String(Warrior.unitsDead);
			enemiesDead.text =	String(Warrior.unitsDeadCpu);
			
			bContinue.addEventListener(MouseEvent.MOUSE_UP,	bContininue_click);
			bQuit.addEventListener(MouseEvent.MOUSE_UP,		bQuit_click);
		}
		function bContininue_click(e :MouseEvent)
		{
			Danki.gameScreen();
		}
		function bQuit_click(e :MouseEvent)
		{
			Danki.mainScreen();
		}
	}
}
