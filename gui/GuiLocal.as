package gui
{
	import def.*;
	import map.*;
	import building.*;
	import perspective.*;
	
	
	public class GuiLocal extends WorldObject
	{
		public static var menu :GuiLocal;
		
		public var ref :Building;
		
		
		public function GuiLocal(build	:Building,
								 posx	:Number,
								 posy	:Number)
		{
			if(menu) BaseMc(menu).kill();
			menu = this;
			
			super(Map.currentMap,2,posx,posy);
			
			ref = build;
			
			BaseMc(this).destructor = GuiLocal_destructor;
			
			alpha = 0;
			BaseMc(this).fade(0.1,1);
		}
		function GuiLocal_destructor()
		{
			if(GuiLocalSubmenu.submenu)
				GuiLocalSubmenu.submenu.kill();
		}

	}
	
}

