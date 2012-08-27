package
{
	
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	public class Unit extends CenarioObject
	{;		
		var base :Castle;
		var enemyBase :Castle;
		
		var hp		:Number;
		var vel		:Number;
		var power	:Number;
		var radius	:Number;
		
		var AI :Boolean;
		var attacker = null;
		
		
		static var _units 	= ['lanceiro',	'samurai',	'arqueiro'];
		static var vars 	= [[0,			0,			0],		// hp
							   [0,			0,			0],		// vel
							   [0,			0,			0],		// power
							   [0,			0,			0]		// radius
							  ];
		static var baseVars = [[150,		100,		80],	// hp
							   [0.9,		1,			1],		// vel
							   [1,			1.2,		.75],	// power
							   [100,		75,			300]	// radius
							  ];


		public static function get units(){ return _units };
		
		public function Unit(spawn :Castle,stamina :Number,type :String)
		{
			spawn.units.push(this);
			initVars(stamina,type);
			this.x = spawn.x;
			this.y = spawn.y;
			base = spawn;
			AI = spawn.AI;
			
			alpha = 0;
			Utils.fade(this,0.2);
		}
		
		
		public function initVars(stamina :Number,type :String)
		{
			name = type;
			gotoAndStop(type);
			
			hp 		= baseVars[0][Utils.getID(type,_units)] + vars[0][Utils.getID(type,_units)]*stamina;
			vel 	= baseVars[1][Utils.getID(type,_units)] + vars[1][Utils.getID(type,_units)]*stamina;
			power 	= baseVars[2][Utils.getID(type,_units)] + vars[2][Utils.getID(type,_units)]*stamina;
			radius 	= baseVars[3][Utils.getID(type,_units)] + vars[3][Utils.getID(type,_units)]*stamina;
		}
		
		public function dmg(n,obj)
		{
			hp -= n;
			attacker = obj;
		}
		
		
		public function wait()
		{
			if(AI) MovieClip(getChildAt(0)).gotoAndStop("AIidle");
			else MovieClip(getChildAt(0)).gotoAndStop("idle");
			
			avelx = 0;
			avely = 0;
		}
		public function attack(obj :Object)
		{
			if(AI) MovieClip(getChildAt(0)).gotoAndStop("AIattack");
			else MovieClip(getChildAt(0)).gotoAndStop("attack");
			
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
			if(AI) MovieClip(getChildAt(0)).gotoAndStop("AIwalk");
			else MovieClip(getChildAt(0)).gotoAndStop("walk");
			
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
			this.parent.addChild(new UnitDead(this));
			Utils.kill(this);
		}
		
		
		
		private function getEnemyBase()
		{
			var objects = GlobalVars.vars.castles;
			for(var i=0; i<objects.length; i++)
				if(objects[i].name != base.name && objects[i].lane == base.lane)
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
			CenarioObject_display();
		}
	}
	
}
