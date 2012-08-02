package
{
	
	
	public class Unit extends BaseMc
	{
		
		var base :Castle;
		var enemyBase :Castle;
		
		var vel = 1;
		var hp = 100;
		var power = 1;
		var radius = 200;
		
		var attacker = null;
		
		
		public function Unit(spawn :Castle,stamina :Number)
		{
			spawn.units.push(this);
			initVars(stamina);
			this.x = spawn.x;
			this.y = spawn.y;
			base = spawn;
		}
		
		
		public function initVars(stamina :Number)
		{
			radius 	= 200 - stamina*10;
			hp 		= 200*stamina;
			vel 	= .3*stamina;
			power 	= stamina;
		}
		
		public function dmg(n,obj)
		{
			hp -= n;
			attacker = obj;
		}
		
		
		public function wait()
		{
			this.gotoAndStop("idle");
			
			avelx = 0;
			avely = 0;
		}
		public function attack(obj :Object)
		{
			this.gotoAndStop("attack");
			
			avelx = 0;
			avely = 0;
			
			obj.dmg(power,this);
			
			if(Utils.ang(this,obj) < Math.PI/2)
				this.scaleX = Math.abs(this.scaleX);
			else
				this.scaleX = -Math.abs(this.scaleX);
		}
		public function walk(obj :Object)
		{ 
			this.gotoAndStop("walk");
			
			avelx = Math.cos(Utils.ang(this,BaseMc(obj)))*vel;
			avely = Math.sin(Utils.ang(this,BaseMc(obj)))*vel;
			
			if(avelx > 0)
				this.scaleX = Math.abs(this.scaleX);
			if(avelx < 0)
				this.scaleX = -Math.abs(this.scaleX);
		}
		public function die()
		{
			Utils.removeObject(this,GlobalVars.vars.objects);
			this.parent.addChild(new Exp(this));
			Utils.kill(this);
		}
		
		
		
		private function getEnemyBase()
		{
			var objects = GlobalVars.vars.castles;
			for(var i=0; i<objects.length; i++)
				if(objects[i].name != base.name)
					return objects[i];
			return null;
		}
		
		private function getEnemy()
		{
			if(Utils.dist(this,enemyBase) <= radius)
				return enemyBase;
			else
				for(var i=0; i<enemyBase.units.length; i++)
					if(Utils.dist(this,enemyBase.units[i]) <= radius)
					   return enemyBase.units[i];
			return null;
		}
		
		
		
		
		public function Unit_display()
		{
			
			
			enemyBase = getEnemyBase();
			if(enemyBase)
			{
				var enemy = getEnemy();
				
				if(enemy)
				{
					attack(enemy);
				}else
					if(attacker)
					{
						walk(attacker);
						attacker = null;
					}else
						walk(enemyBase);
			}else{
				wait();
			}
			
			if(hp <= 0)
			{
				Utils.removeObject(this,base.units);
				die();
			}
			
			
		}
		
		override public function display()
		{
			Unit_display();
			BaseMc_display();
		}
	}
	
}
