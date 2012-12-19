package screen
{
	import def.*;
	import flash.events.MouseEvent;
	
	
	public class MainScreen extends Screen
	{

		public function MainScreen()
		{
			super(Main.gui);
			
			bInit.addEventListener(MouseEvent.MOUSE_UP,bInit_click);
		}
		function bInit_click(e :MouseEvent)
		{
			Danki.gameScreen();
		}
	}
}
