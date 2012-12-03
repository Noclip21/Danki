package building
{
	import map.*;
	import gui.*;
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
		override public function addUnit(unitClass :Class)
		{
			if(!timer && units.length < maxUnits &&
			   Loja.incoming - unitClass.cost >= 0)
			{
				units.push(new unitClass(this));
				Loja.incoming -=  unitClass.cost;
				new AugmentedText(x,y-30,"$"+unitClass.cost,100,0xFF0000);
				
				timerStart();
			}
		}

	}
	
}
