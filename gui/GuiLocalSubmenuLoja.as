package gui
{
	import building.*;
	import flash.events.MouseEvent;
	
	
	public class GuiLocalSubmenuLoja extends GuiLocalSubmenu
	{
		var item :Number;
		
		
		public function GuiLocalSubmenuLoja(loja	:Loja,
											itemId	:Number)
		{
			super(loja,loja.x-337,loja.y-92);
			
			item = itemId;
			
			b1.addEventListener(MouseEvent.MOUSE_UP,b1_click);
			b2.addEventListener(MouseEvent.MOUSE_UP,b2_click);
			b3.addEventListener(MouseEvent.MOUSE_UP,b3_click);
			b4.addEventListener(MouseEvent.MOUSE_UP,b4_click);
			b5.addEventListener(MouseEvent.MOUSE_UP,b5_click);
		}
		function b1_click(e :MouseEvent)
		{
			Loja.products[item] = 5;
			GuiLocal.menu.kill();
		}
		function b2_click(e :MouseEvent)
		{
			Loja.products[item] = 10;
			GuiLocal.menu.kill();
		}
		function b3_click(e :MouseEvent)
		{
			Loja.products[item] = 20;
			GuiLocal.menu.kill();
		}
		function b4_click(e :MouseEvent)
		{
			Loja.products[item] = 40;
			GuiLocal.menu.kill();
		}
		function b5_click(e :MouseEvent)
		{
			Loja.products[item] = 80;
			GuiLocal.menu.kill();
		}
	}
	
}
