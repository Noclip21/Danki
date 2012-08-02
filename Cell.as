package
{
	import flash.events.MouseEvent;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Cell extends BaseMc
	{
		var world :World; 
		
		var RMButtons = ["addCastleBlue","addCastleRed"];
		
		public function Cell(posx,posy,target)
		{
			x = posx;
			y = posy;
			global.GUI.addChild(this);
			world = target;
			
			graphics.clear();
			graphics.lineStyle(3,target.cellColor,1);
			graphics.beginFill(target.cellColor,.5);
			graphics.drawRect(0,0,target.cellSize,target.cellSize);
			graphics.endFill();
			
			addEventListener(MouseEvent.CLICK,function(e :MouseEvent)
			{
				new RadialMenu(x+target.cellSize/2,y+target.cellSize/2,e.target);
			});
			
			if(global.world.menu)
				global.world.menu.visible=false;
		}
	}
	
}
