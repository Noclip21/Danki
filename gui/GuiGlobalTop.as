package gui
{
	import flash.events.MouseEvent;
	
	
	public class GuiGlobalTop extends GuiGlobal
	{
		var menu :GuiMenuSaque;
		
		
		public function GuiGlobalTop()
		{
			super(0,0);
			
			menu = null;
			
			addEventListener(MouseEvent.MOUSE_UP,clickLst);
		}
		function clickLst(e :MouseEvent)
		{
			if(menu) menu.kill();
			menu = new GuiMenuSaque();
		}

	}
	
}
