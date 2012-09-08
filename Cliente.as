package
{
	
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	public class Cliente extends CenarioObject
	{;		
		var casa :Casa;
		var loja :Loja;
		
		var hp		:Number;
		var vel		:Number;
		var bits	:Number;
		var radius	:Number;
		
		static var _units 	= ['lanceiro',	'samurai',	'arqueiro'];
		static var vars 	= [[0,			0,			0],		// hp
							   [0,			0,			0],		// vel
							   [0,			0,			0],		// bits
							   [0,			0,			0]		// radius
							  ];
		static var baseVars = [[150,		100,		80],	// hp
							   [2,		1,			1],		// vel
							   [10,			20,			30],	// bits
							   [100,		75,			300]	// radius
							  ];


		public static function get units(){ return _units };
		
		public function Cliente(spawn :Casa,stamina :Number,type :String)
		{
			spawn.units.push(this);
			initVars(stamina,'lanceiro');
			this.x = spawn.x;
			this.y = spawn.y;
			casa = spawn;
			
			alpha = 0;
			Utils.fade(this,0.2);
		}
		
		
		public function initVars(stamina :Number,type :String)
		{
			name = type;
			gotoAndStop(type);
			
			hp 		= baseVars[0][Utils.getID(type,_units)] + vars[0][Utils.getID(type,_units)]*stamina;
			vel 	= baseVars[1][Utils.getID(type,_units)] + vars[1][Utils.getID(type,_units)]*stamina;
			bits 	= baseVars[2][Utils.getID(type,_units)] + vars[2][Utils.getID(type,_units)]*stamina;
			radius 	= baseVars[3][Utils.getID(type,_units)] + vars[3][Utils.getID(type,_units)]*stamina;
		}
		
		public function dmg(n,obj)
		{
			hp -= n;
		}
		
		
		public function wait()
		{
			//if(AI) MovieClip(getChildAt(0)).gotoAndStop("AIidle");
			//else MovieClip(getChildAt(0)).gotoAndStop("idle");
			
			avelx = 0;
			avely = 0;
		}
		public function attack(obj :Object)
		{
			//if(AI) MovieClip(getChildAt(0)).gotoAndStop("AIattack");
			//else MovieClip(getChildAt(0)).gotoAndStop("attack");
			
			avelx = 0;
			avely = 0;
			
			obj.dmg(bits,this);
			
			if(Utils.ang(this,obj) < Math.PI/2)
				this.scaleX = Math.abs(this.scaleX);
			else
				this.scaleX = -Math.abs(this.scaleX);
		}
		public function walk(obj :Object)
		{ 
			//if(AI) MovieClip(getChildAt(0)).gotoAndStop("AIwalk");
			//else MovieClip(getChildAt(0)).gotoAndStop("walk");
			
			avelx = Math.cos(Utils.ang(this,BaseMc(obj)))*vel;
			avely = Math.sin(Utils.ang(this,BaseMc(obj)))*vel;
			
			if(avelx > 0)
				this.scaleX = Math.abs(this.scaleX);
			if(avelx < 0)
				this.scaleX = -Math.abs(this.scaleX);
		}
		function isInRange(obj :Object)
		{
			return Utils.dist(this,obj) <= radius;
		}
		
		public function die()
		{
			//this.parent.addChild(new UnitDead(this));
			Utils.kill(this);
		}
		
		
		
		
		public function Unit_display()
		{
			if(bits)
			{
				loja = World.lane[casa.lane][1];
				if(loja)
				{
					if(isInRange(loja))
						attack(loja);
					else
						walk(loja);
				}else
					wait();
			}else{
				if(isInRange(casa))
					die();
				else
					walk(casa);
			}
			
		}
		
		override public function display()
		{
			Unit_display();
			CenarioObject_display();
		}
	}
	
}
