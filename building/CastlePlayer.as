package building
{
	import map.*;
	import gui.*;
	import flash.events.MouseEvent;
	
	public class CastlePlayer extends Castle
	{

		public function CastlePlayer(defLane	:Number,
									 posx		:Number,
									 posy		:Number)
		{
			super(defLane,posx,posy);
			
			gotoAndStop("azul");
			
			addEventListener(MouseEvent.MOUSE_UP,Castle_click);
		}
		function Castle_click(e :MouseEvent)
		{
			Map.currentMap.focusGuerra();
			
			new GuiLocalCastle(Castle(e.target));
		}

	}
	
}
