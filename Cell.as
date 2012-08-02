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
			target.addChild(this);
			world = target;
			
			graphics.clear();
			graphics.lineStyle(3,target.cellColor,1);
			graphics.beginFill(target.cellColor,.5);
			graphics.drawRect(0,0,target.cellSize,target.cellSize);
			graphics.endFill();
			
			addEventListener(MouseEvent.CLICK,function(e :MouseEvent)
			{
				World(global.world).createRadialMenu(x+target.cellSize/2,y+target.cellSize/2,e.target);
			});
			
			if(global.world.menu)
				global.world.menu.visible=false;
		}
		public function createCastle(str)
		{
			var castle = new Castle();
				castle.name = str;
				Castle(castle).changeOwner();
				castle.x = x + world.cellSize/2;
				castle.y = y + world.cellSize/2;
			world.addChild(castle);
		}
	}
	
}
