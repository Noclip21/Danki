package  gui
{
	import building.*;
	import unit.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class GuiLocalCastle extends GuiLocal
	{

		public function GuiLocalCastle(castle :Castle)
		{
			super(Building(castle),MovieClip(castle).x+170,MovieClip(castle).y-70);
			
			b1.addEventListener(MouseEvent.MOUSE_UP,b1_click);
			b2.addEventListener(MouseEvent.MOUSE_UP,b2_click);
			b3.addEventListener(MouseEvent.MOUSE_UP,b3_click);
			b4.addEventListener(MouseEvent.MOUSE_UP,b4_click);
		}
		function b1_click(e :MouseEvent)
		{
			ref.addUnit(Arqueiro);
		}
		function b2_click(e :MouseEvent)
		{
			ref.addUnit(Lanceiro);
		}
		function b3_click(e :MouseEvent)
		{
			ref.addUnit(Samurai);
		}
		function b4_click(e :MouseEvent)
		{
			ref.addUnit(Lanceiro);
		}
		function b5_click(e :MouseEvent)
		{
			ref.addUnit(Lanceiro);
		}

	}
	
}
