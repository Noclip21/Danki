package  unit
{
	import def.*;
	import gui.*;
	import screen.*;
	import building.*;
	import perspective.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class Unit extends WorldObject
	{
		public static var objects :Array;
		
		
		static const SPECIAL_COLOR :uint = 0x00FF00;
		public static var _special :Boolean;
		
		
		var _building 		:Building
		var _lane			:Number;
		var _hp				:Number;
		var _timer 			:Timer;
		var timerCooldown	:Boolean;
		
		
		public function get building()	{ return _building;		 }
		public function get lane()		{ return _lane;			 }
		public function get timer()		{ return timerCooldown;  }
		
		public function get hp(){ return _hp; }
		
		
		public function Unit(defBuilding	:Building = null,
							 defLane		:Number = 0,
							 posx			:Number = 0,
							 posy			:Number = 0,
							 hp				:Number = 1,
							 defTimer		:Number = 100)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			super(Game.currentMap,1,posx,posy);
			
			_building =		defBuilding;
			_lane =			defLane;
			_hp = 			hp;
			_timer = 		new Timer(defTimer);
			timerCooldown = false;
			
			
			BaseMc(this).destructor = Unit_destructor;
			
			_timer.addEventListener(TimerEvent.TIMER,timerLst);
		}
		function Unit_destructor()
		{
			_timer.removeEventListener(TimerEvent.TIMER,timerLst);
			Utils.removeObject(this,objects);
			if(_building) Utils.removeObject(this,_building.units);
		}
		function timerLst(e :TimerEvent)
		{
			timerCooldown = false;
		}
		public function timerStart()
		{
			_timer.start();
			timerCooldown = true;
		}
		public function dmg(damage :Number)
		{
			_hp -= damage;
			new AugmentedText(x,y-20,"-"+damage,100,0xFF0000);
			if(_hp <= 0) BaseMc(this).kill();
		}
		public function onSpecial()
		{
			color(SPECIAL_COLOR,0.5);
		}
		public function outSpecial()
		{
			color(SPECIAL_COLOR,0);
		}
	}
	
}
