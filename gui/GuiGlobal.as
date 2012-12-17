package gui
{
	import def.*;
	import flash.geom.Point;
	
	public class GuiGlobal extends BaseMc
	{
		var refX :Number;
		var refY :Number;
		
		
		public function GuiGlobal(posx :Number,
								  posy :Number)
		{
			super(Main.gui,posx,posy);
			
			refX = posx;
			refY = posy;
		}
		public function hide()
		{
			move(new Point(refX,refY+height));
		}
		public function show()
		{
			move(new Point(refX,refY));
		}

	}
	
}
