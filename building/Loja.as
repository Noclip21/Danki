package building
{
	import def.*;
	import map.*;
	import gui.*;
	import flash.events.MouseEvent;
	
	
	public class Loja extends Building
	{
		public static var objects :Array;
		public static var incoming :Number = 30;
		
		
		public function Loja(lane :Number,
							 posx :Number,
							 posy :Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			
			super(lane,1000,1,posx,posy);
			
			gotoAndStop("azul");
			
			//BaseMc(this).display =		Loja_display();
			addEventListener(MouseEvent.MOUSE_UP,Loja_click);
			
			BaseMc(this).destructor =	Loja_destructor;
		}
		function Loja_destructor()
		{
			Utils.removeObject(this,objects);
		}
		public function sell(money :Number)
		{
			incoming += money;
			trace(incoming);
		}
		function Loja_click(e :MouseEvent)
		{
			Map.currentMap.focusComercio();
			
			new GuiLocalLoja(this);
		}

	}
	
}
