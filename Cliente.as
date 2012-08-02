package
{
	
	import flash.display.MovieClip;
	
	
	public class Cliente extends BaseMc
	{
		
		var bars = GlobalVars.vars.bars;
		var target :Object;
		var oldPos :Object;
		var vel = 80;
		
		public function Cliente()
		{
			 GlobalVars.vars.clients.push(this);
			 target = this;
			 oldPos = Utils.pAt(this.x,this.y);
		}
		public function attraction(obj :Bar)
		{
			
			return 2*GlobalVars.vars["P"+obj.owner].inv
			- 8*GlobalVars.vars["P"+obj.owner].price
			- Utils.dist(this,obj)/2;
			
		}
		function getBar()
		{
			var bar = bars[0];
			var attr = attraction(bar);
			for(var i=1; i<bars.length; i++)
				if(attraction(bars[i]) > attr)
				{
					bar = bars[i];
					attr = attraction(bars[i]);
				}
			oldPos = Utils.pAt(this.x,this.y);
			target = bar;
		}
		public function walk()
		{
			if(Utils.dist(this,target) >= vel)
			{
				return Utils.pAt(
				oldPos.x + Math.cos(Utils.ang(this,target))*vel,
				oldPos.y + Math.sin(Utils.ang(this,target))*vel
							);
			}else
				return Utils.pAt(target.x,target.y);
		}
		
		
		override public function display()
		{
			var avel = walk();
			
			avelx = Utils.difFactor(avel.x,this.x,0.2);
			avely = Utils.difFactor(avel.y,this.y,0.2);
			
			
			BaseMc_display();
		}
	}
	
}
