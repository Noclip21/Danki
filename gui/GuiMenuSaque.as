package gui
{
	import def.*;
	import building.*;
	import flash.events.MouseEvent;
	
	
	public class GuiMenuSaque extends GuiGlobal
	{

		public function GuiMenuSaque()
		{
			super(0,0);
			
			
			btCostUp.addEventListener(MouseEvent.MOUSE_UP,btCostUpLst);
			btCostDown.addEventListener(MouseEvent.MOUSE_UP,btCostDownLst);
			btQntUp.addEventListener(MouseEvent.MOUSE_UP,btQntUpLst);
			btQntDown.addEventListener(MouseEvent.MOUSE_UP,btQntDownLst);
			
			addEventListener(MouseEvent.ROLL_OUT,rollOutLst);
			
			
			BaseMc(this).display = GuiMenuSaque_display;
		}
		function btCostUpLst(e :MouseEvent)
		{
			trace('ola');
			++Loja.products[0][0];
		}
		function btCostDownLst(e :MouseEvent)
		{
			--Loja.products[0][0];
		}
		function btQntUpLst(e :MouseEvent)
		{
			++Loja.products[1][0];
		}
		function btQntDownLst(e :MouseEvent)
		{
			--Loja.products[1][0];
		}
		
		function rollOutLst(e :MouseEvent)
		{
			kill();
		}
		function GuiMenuSaque_display()
		{
			msgCost.text =	Loja.products[0][0];
			msgQnt.text = 	Loja.products[1][0];
		}
	}
	
}
