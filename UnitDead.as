package
{
	
	import flash.display.MovieClip;
	
	
	public class UnitDead extends Particle
	{
		
		
		public function UnitDead(obj :Object)
		{
			super(obj);
			
			if(obj.AI) this.gotoAndStop('AIunit');
			else this.gotoAndStop('unit');
			
			scaleX = obj.scaleX;
		}
	}
	
}
