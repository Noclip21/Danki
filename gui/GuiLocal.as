package gui
{
	import def.*;
	import map.*;
	import building.*;
	import perspective.*;
	
	
	public class GuiLocal extends WorldObject
	{
		static var menu	:GuiLocal;
		public var ref	:Building;
		
		
		public function GuiLocal(building	:Building,
								 posx		:Number,
								 posy		:Number)
		{
			if(menu) BaseMc(menu).kill();
			menu = this;
			
			super(Map.currentMap,2,posx,posy);
			
			ref = building;
			BaseMc(building).blink();
			
			alpha = 0;
			BaseMc(this).fade(0.1,1);
		}

	}
	
}
