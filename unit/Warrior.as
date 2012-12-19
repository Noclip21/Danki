package unit
{
	import def.*;
	import building.*;
	import flash.geom.Point;
	
	public class Warrior extends Human
	{
		public static var objects :Array;
		
		
		static var _special :Boolean;
		static var _hpCoef	:Number = 1;
		public static var attackCoef :Number = 1;
		
		
		public static var unitsDead :Number = 0;
		public static var unitsDeadCpu :Number = 0;
		
		
		var enemyCastle :Castle;
		var _cpu		:Boolean;
		var _attack 	:Number;
		var _range		:Number;
		
		
		public function get cpu() { return _cpu; 	}
		
		public static function set special(mode :Boolean)
		{
			_special = mode;
			if(objects)
			for(var i=0; i<objects.length; i++)
				if(!objects[i].cpu)
				if(mode) Unit(objects[i]).onSpecial();
				else	 Unit(objects[i]).outSpecial();
		}
		public static function set hpCoef(n :Number)
		{
			if(objects)
			for(var i=0; i<objects.length; i++)
				if(!objects[i].cpu)
				objects[i].dmg(-objects[i].hp*(_hpCoef -1));
		}
		
		
		public function Warrior(defBuilding :Castle,
								hp			:Number = 10,
								speed		:Number = 1,
								attackForce	:Number = 1,
								attackTimer	:Number = 1000,
								range		:Number = 50)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			if(!_cpu) hp *= _hpCoef;
			super(Building(defBuilding),hp,speed,attackTimer);
			
			
			getEnemyCastle();
			_attack =	attackForce;
			_range =	range;
			
			
			if(!_cpu && _special) onSpecial();
			
			
			BaseMc(this).display = Wairror_display;
			BaseMc(this).destructor = Wairror_desctructor;
		}
		function Wairror_desctructor()
		{
			unitsDead++;
			if(cpu) unitsDeadCpu++;
			
			Utils.removeObject(this,objects);
		}
		function getEnemyCastle()
		{
			if(Utils.getClass(building) == Class(CastlePlayer).toString())
			{
				enemyCastle = castleCpu;
				_cpu = false;
			}else{
				enemyCastle = castlePlayer;
				_cpu = true;
			}
		}
		function attack(target :Unit)
		{
			if(Utils.dist(this,target) <= _range)
			{
				if(avelx != 0 || avely != 0) timerStart();
				
				if(!timer)
				{
					if(target.x > x) scaleX = Math.abs(scaleX);
					else			 scaleX = -Math.abs(scaleX);
					
					if(!_cpu)	target.dmg(_attack*attackCoef);
					else		target.dmg(_attack);
					
					timerStart();
				}
				
				avelx = avely = 0;
				
				if(_cpu) gotoAndStop('AIattack');
				else	gotoAndStop('attack');
				
				return true;
			}else
				return false;
		}
		function targetSearch()
		{
			
			var attacking :Boolean = attack(enemyCastle);
			
			for(var i=0; i<enemyCastle.units.length; i++)
			{
				attacking = attack(Unit(enemyCastle.units[i]))
				if(attacking) break;
			}
			
			return attacking;
		}
		function march()
		{
			moveTo(new Point(enemyCastle.x,enemyCastle.y));
			if(_cpu) gotoAndStop('AIwalk');
			else	 gotoAndStop('walk');
		}
		function idle()
		{
			avelx = avely = 0;
			
			if(_cpu) gotoAndStop('AIidle');
			else	 gotoAndStop('idle');
		}
		function Wairror_display()
		{
			getEnemyCastle();
			
			if(enemyCastle)
			{
				if(!targetSearch()) march();
			}else
				idle();
		}
	}
	
}
