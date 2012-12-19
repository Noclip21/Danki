package gui
{
	import def.*;
	import screen.*;
	import building.*;
	import perspective.*;
	
	
	public class GuiLocalSubmenu extends WorldObject
	{
		public static var submenu :GuiLocalSubmenu;
		
		public var ref :Building;
		
		
		public function GuiLocalSubmenu(building	:Building,
										 posx		:Number,
										 posy		:Number)
		{
			if(submenu) BaseMc(submenu).kill();
			submenu = this;
			
			super(Game.currentMap,2,posx,posy);
			
			ref = building;
			
			alpha = 0;
			BaseMc(this).fade(0.1,1);
		}

	}
	
}
