package
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.MouseEvent;

	
	public class World extends BaseMc
	{
		var win = false;
		var timer:Timer = new Timer(3000);
		
		var cellSize = 50;
		var cellColor = 0xFFFF00;
		var cell :Cell;
		
		var menu = null;
		
		public function World(lvl :Number)
		{
			this.gotoAndStop("lvl"+lvl);
			addEventListener(MouseEvent.CLICK,selectArea);
		}
		override public function display()
		{
			var teams = new Array();
			for(var i=0; i<global.castles.length; i++)
			{
				for(var j=0; j<=teams.length; j++)
					if(j == teams.length)
					{
						teams.push(global.castles[i].name);
						break;
					}else
						if(teams[j] == global.castles[i].name)
							break;
			}
			
			if(teams.length < 2 && !win)
			{
				win = true;
				timer.addEventListener(TimerEvent.TIMER,endMatch);
				timer.start();
			}
		}
		private function endMatch(e :TimerEvent)
		{
			timer.removeEventListener(TimerEvent.TIMER,endMatch);
			DanKi(root).nextLevel();
			Utils.kill(this);
		}
		function createCell(x,y)
		{
			if(menu)
			{
				if(!menu.hitTestPoint(mouseX,mouseY))
				{
					Utils.kill(cell);
					cell = new Cell(x,y,this);
				}
			}else{
				Utils.kill(cell);
				cell = new Cell(x,y,this);
			}
		}
		public function selectArea(e :MouseEvent)
		{
			var posx = Math.floor(mouseX/cellSize)*cellSize;
			var posy = Math.floor(mouseY/cellSize)*cellSize;
			
			createCell(posx,posy);
		}
		public function createRadialMenu(x,y,obj)
		{
			Utils.kill(menu);
			menu = new RadialMenu(x,y,this,obj);
		}
	}
	
}
