package
{
	
	import flash.display.MovieClip;
	
	
	public class Castle extends BaseMc
	{
		var units 		= new Array();
		var _hp 		= 1000;
		var _unitHp 	= 100;
		var _spawnRate 	= 1;
		
		public function set hp(n)		{ _hp = n; }
		public function set unitHp(n)	{ _unitHp = n; }
		public function set spawnRate(n){ _spawnRate = n; }
		
		public function dmg(n)		{ _hp -= n; }
		
		
		public function Castle()
		{
			GlobalVars.vars.castles.push(this);
		}
		
		
		public function die()
		{
			for(var i=0; i<units.length; i++)
				units[i].die();
				
			this.parent.addChild(new Exp(this));
			
			Utils.removeObject(this,GlobalVars.vars.castles);
			Utils.removeObject(this,GlobalVars.vars.objects);
				
			parent.removeChild(this);
			delete this;
		}
		
		
		public function Castle_display()
		{
			if(Math.random()*100 < _spawnRate)
				this.parent.addChild(new Unit(this,_unitHp));
				
			if(_hp <= 0)
				die();
		}
		override public function display()
		{
			Castle_display();
			BaseMc_display();
		}
	}
	
}
