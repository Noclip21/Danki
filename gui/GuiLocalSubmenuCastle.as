package gui
{
	import building.*;
	import flash.events.MouseEvent;
	
	
	public class GuiLocalSubmenuCastle extends GuiLocalSubmenu
	{
		var unit :Class;
		
		
		public function GuiLocalSubmenuCastle(castle	:Castle,
											  unitClass	:Class)
		{
			super(castle,castle.x+283,castle.y-124)
			
			unit =	unitClass;
			
			b1.addEventListener(MouseEvent.MOUSE_UP,b1_click);
			b2.addEventListener(MouseEvent.MOUSE_UP,b2_click);
			b3.addEventListener(MouseEvent.MOUSE_UP,b3_click);
			b4.addEventListener(MouseEvent.MOUSE_UP,b4_click);
		}
		function b1_click(e :MouseEvent)
		{
			ref.addUnit(unit);
			GuiLocal.menu.kill();
		}
		function b2_click(e :MouseEvent)
		{
			ref.addUnit(unit);
			GuiLocal.menu.kill();
		}
		function b3_click(e :MouseEvent)
		{
			ref.addUnit(unit);
			GuiLocal.menu.kill();
		}
		function b4_click(e :MouseEvent)
		{
			ref.addUnit(unit);
			GuiLocal.menu.kill();
		}
	}
	
}
