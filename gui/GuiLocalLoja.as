package gui
{
	import building.*;
	import trigger.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	
	public class GuiLocalLoja extends GuiLocal
	{

		public function GuiLocalLoja(loja :Loja)
		{
			super(loja,loja.x-294,loja.y-91);
			
			b1.addEventListener(MouseEvent.MOUSE_UP,b1_click);
			b2.addEventListener(MouseEvent.MOUSE_UP,b2_click);
			b3.addEventListener(MouseEvent.MOUSE_UP,b3_click);
			b4.addEventListener(MouseEvent.MOUSE_UP,b4_click);
			up.addEventListener(MouseEvent.MOUSE_UP,up_click);
		}
		function b1_click(e :MouseEvent)
		{
			new ReveriadAgainst(); // Double Attack
			new GuiLocalSubmenuLoja(Loja(ref),0);
		}
		function b2_click(e :MouseEvent)
		{
			new AngnedoArchangel(); // Double HP
			new GuiLocalSubmenuLoja(Loja(ref),1);
		}
		function b3_click(e :MouseEvent)
		{
			new IncreaseIondume(); // Double Money
			new GuiLocalSubmenuLoja(Loja(ref),2);
		}
		function b4_click(e :MouseEvent)
		{
			new MarketsImmkag(); // Double Clients
			new GuiLocalSubmenuLoja(Loja(ref),3);
		}
		function up_click(e :MouseEvent)
		{
			GlobalEvent.kill();
		}
	}
	
}
