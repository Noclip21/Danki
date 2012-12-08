package gui
{
	import building.*;
	import trigger.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	
	public class GuiLocalLoja extends GuiLocal
	{

		public function GuiLocalLoja(building :Building)
		{
			super(building,MovieClip(building).x-170-width,MovieClip(building).y-70);
			
			b1.addEventListener(MouseEvent.MOUSE_UP,b1_click);
			b2.addEventListener(MouseEvent.MOUSE_UP,b2_click);
			b3.addEventListener(MouseEvent.MOUSE_UP,b3_click);
			b4.addEventListener(MouseEvent.MOUSE_UP,b4_click);
			up.addEventListener(MouseEvent.MOUSE_UP,up_click);
		}
		function b1_click(e :MouseEvent)
		{
			new ReveriadAgainst(); // Double Attack
		}
		function b2_click(e :MouseEvent)
		{
			new AngnedoArchangel(); // Double HP
		}
		function b3_click(e :MouseEvent)
		{
			new IncreaseIondume(); // Double Money
		}
		function b4_click(e :MouseEvent)
		{
			new MarketsImmkag(); // Double Clients
		}
		function up_click(e :MouseEvent)
		{
			GlobalEvent.kill();
		}
	}
	
}
