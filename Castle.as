package
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class Castle extends CenarioObject
	{
		var units 			= new Array();
		var _hp 			= 8000;
		var _unitStamina 	= 3;
		var _spawnRate 		= 0.5;
		var _maxUnits		= 6;
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
		public function set maxUnits(n)		{ _maxUnits = n; }
		
		
		public function Castle()
		{
			GlobalVars.vars.castles.push(this);
			changeOwner();
			spawnTimer.addEventListener(TimerEvent.TIMER,function(){ enableSpawn = true; });
		}
		
		public function changeOwner()
		{
			if(name == "AI")
			{
				setForAI();
				AI = true;
			}else{
				setForPlayer();
				AI = false;
			}
		}
		
		public function setForAI()
		{
			gotoAndStop("vermelho");
			Castle_display = function()
			{
				if(Math.random()*100 < _spawnRate)				
					createUnit(Unit.units[Math.round(Utils.random(0,Unit.units.length-1))]);
				
				if(_hp <= 0)
					die();
			}
		}
		public function setForPlayer()
		{
			gotoAndStop("azul");
			addEventListener(MouseEvent.CLICK,function(e :MouseEvent)
			{
				if(global.world.cell)
					global.world.cell.visible = false;
				new RadialMenu(x,y,e.target);
				new HorizontalMenu(e.target);
			});
		}
		
		public function dmg(n,obj)
		{
			_hp -= n;
			attacker = obj;
		}
		
		public function die()
		{
			for(var i=0; i<units.length; i++)
				units[i].die();
			
			this.parent.addChild(new CastleDestroyed(this));
			this.parent.addChild(new Exp(this));
			
			if(GUI.Rmenu)
				if(GUI.Rmenu.owner == this)
					GUI.Rmenu.visible = false;
			
			Utils.removeObject(this,GlobalVars.vars.castles);
			Utils.removeObject(this,GlobalVars.vars.objects);
				
			parent.removeChild(this);
			delete this;
		}

		public function createUnit(type :String = 'lanceiro')
		{
			if(enableSpawn && units.length < _maxUnits)
			{
				parent.addChild(new Unit(this,_unitStamina,type));
				enableSpawn = false;
				spawnTimer.start();
			}
		}
		
		
		var Castle_display = function()
		{
			if(_hp <= 0)
				die();
		}
		
		override public function display()
		{
			Castle_display();
			CenarioObject_display();
		}
	}
	
}
