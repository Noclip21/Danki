package
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class Casa extends CenarioObject
	{
		var units 			= new Array();
		var _hp 			= 8000;
		var _unitStamina 	= 3;
		var _spawnRate 		= 0.5;
		var lane = 0;
		var AI = false;
		
		var attacker = null;
		var spawnTimer = new Timer(1000,0);
		var enableSpawn = true;
		
		var RMButtons = ["increaseStamina","decreaseStamina","deleteCastle"];
		var HMButtons = ["unit1","unit2","unit3"];
		
		
		public function set hp(n)			{ _hp = n; }
		public function set unitStamina(n)	{ _unitStamina = n; }
		public function addStamina(n)		{ _unitStamina += n; }
		public function set spawnRate(n)	{ _spawnRate = n; }
		
		
		public function Casa(l)
		{
			lane = l;
			changeOwner();
			spawnTimer.addEventListener(TimerEvent.TIMER,function(){ enableSpawn = true; });
		}
		
		public function changeOwner()
		{
			setForAI();
			AI = true;
		}
		
		public function setForAI()
		{
			//gotoAndStop("vermelho");
			Castle_display = function()
			{
				if(Math.random()*100 < _spawnRate)				
					createUnit();
			}
		}
		/*public function setForPlayer()
		{
			//gotoAndStop("azul");
			addEventListener(MouseEvent.CLICK,function(e :MouseEvent)
			{
				if(global.world.cell)
					global.world.cell.visible = false;
				new RadialMenu(x,y,e.target);
				new HorizontalMenu(e.target);
			});
		}*/

		public function createUnit()
		{
			if(enableSpawn)
			{
				parent.addChild(new Cliente(this,_unitStamina,'lol dunno'));
				enableSpawn = false;
				spawnTimer.start();
			}
		}
		
		
		var Castle_display = function()
		{
			// ?
		}
		
		override public function display()
		{
			Castle_display();
			CenarioObject_display();
		}
	}
	
}
