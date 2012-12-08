package building
{
	import def.*;
	import map.*;
	import gui.*;
	import unit.*;
	import flash.events.MouseEvent;
	
	
	public class Loja extends Building
	{
		public static var objects		:Array;
		public static var incoming		:Number = 30;
		public static var incomingCoef	:Number = 1;
		
		
		public static var _special :Boolean = false;
		
		
		public static function set special(mode :Boolean)
		{
			_special = mode;
			if(objects)
			for(var i=0; i<objects.length; i++)
				if(mode) Unit(objects[i]).onSpecial();
				else	 Unit(objects[i]).outSpecial();
		}
		
		
		public function Loja(lane :Number,
							 posx :Number,
							 posy :Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			
			super(lane,1000,1,posx,posy);
			
			
			if(_special) onSpecial();
			
			
			gotoAndStop("azul");
			
			
			addEventListener(MouseEvent.MOUSE_UP,Loja_click);
			
			
			BaseMc(this).destructor =	Loja_destructor;
		}
		function Loja_destructor()
		{
			Utils.removeObject(this,objects);
		}
		public function sell(money :Number)
		{
			money *= incomingCoef;
			incoming += money;
			new AugmentedText(x,y-10,"$"+money,100,0x00FF00);
		}
		function Loja_click(e :MouseEvent)
		{
			Map.currentMap.focusComercio();
			
			new GuiLocalLoja(this);
		}

	}
	
}
