package unit
{
	import def.*;
	import building.*;
	import map.*;
	import flash.geom.Point;
	
	public class Warrior extends Human
	{
		var enemyCastle :Castle;
		var _cpu		:Boolean
		var _attack 	:Number;
		var _range		:Number;
		
		
		public function get cpu() { return _cpu; 	}
		
		
		public function Warrior(defBuilding :Castle,
								hp			:Number = 10,
								speed		:Number = 1,
								attackForce	:Number = 1,
								attackTimer	:Number = 1000,
								range		:Number = 50)
		{
			super(Building(defBuilding),hp,speed,attackTimer);
			
			
			getEnemyCastle();
			_attack =	attackForce;
			_range =	range;
			
			
			BaseMc(this).display = Wairror_display;
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
					target.dmg(_attack);
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
