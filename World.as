package
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.MouseEvent;

	
	public class World extends BaseMc
	{
		var objects = new Array();
		var win = false;
		var timer:Timer = new Timer(3000);
		
		var cellSize = 50;
		var cellColor = 0xFFFF00;
		var cell :Cell;
		
		var menu = null;
		
		var totalLanes = 6;
		
		public function World(lvl :Number)
		{
			gotoAndStop("lvl"+lvl);
			global.world = this;
			
			while(this.map.numChildren)
			{
				var obj = this.map.getChildAt(0);
				this.map.removeChild(obj);
				addChild(obj);
			}
			removeChild(this.map);
			//addEventListener(MouseEvent.CLICK,selectArea);
			
			for(var i=0; i<3; i++)
			{
				createCastle('a',i,50,200*i + 200);
				createCastle('AI',i,750,200*i + 200);
			}
			
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
		public function createCastle(str,lane,posx,posy)
		{
			var castle = new Castle();
				castle.name = str;
				castle.lane = lane;
				Castle(castle).changeOwner();
				castle.x = posx;
				castle.y = posy;
			addChild(castle);
		}
	}
	
}
