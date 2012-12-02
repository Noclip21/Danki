package prop
{
	import def.*;
	import unit.*;
	import perspective.*;
	import flash.geom.Point;
	
	public class WarriorDead extends Prop
	{
		
		
		public function WarriorDead(ref :Warrior)
		{
			if(ref.cpu) gotoAndStop('AI');
			else		gotoAndStop('player');
			
			super(new Point(ref.x,ref.y),1,function()
			{
				Particle(this).animation.stop();
				BaseMc(this).fade(-0.05,0,function()
				{
					BaseMc(this).kill();
				});
			});
		}
	}
	
}
