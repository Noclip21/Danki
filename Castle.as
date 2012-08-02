package
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Castle extends CenarioObject
	{
		var units 			= new Array();
		var _hp 			= 8000;
		var _unitStamina 	= 3;
		var _spawnRate 		= 1;
		var lane = 0;
		var AI = false;
		
		var attacker = null;
		
		var RMButtons = ["addUnit","increaseStamina","deleteCastle","decreaseStamina"];
		
		public function set hp(n)			{ _hp = n; }
		public function set unitStamina(n)	{ _unitStamina = n; }
		public function addStamina(n)		{ _unitStamina += n; }
		public function set spawnRate(n)	{ _spawnRate = n; }
		
		
		public function Castle()
		{
			GlobalVars.vars.castles.push(this);
			changeOwner();
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
					createUnit();
				
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
				World(global.world).createRadialMenu(x,y,e.target);
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
				
			this.parent.addChild(new Exp(this));
			
			if(global.world.menu)
				if(global.world.menu.owner == this)
					global.world.menu.visible = false;
			
			Utils.removeObject(this,GlobalVars.vars.castles);
			Utils.removeObject(this,GlobalVars.vars.objects);
				
			parent.removeChild(this);
			delete this;
		}

		public function createUnit()
		{
			parent.addChild(new Unit(this,_unitStamina));
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
