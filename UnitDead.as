package
{
	
	import flash.display.MovieClip;
	
	
	public class UnitDead extends Particle
	{
		
		
		public function UnitDead(obj :Object)
		{
			super(obj);
			
			
			gotoAndStop(obj.name);
			
			if(obj.AI) MovieClip(getChildAt(0)).gotoAndStop('AI');
			else MovieClip(getChildAt(0)).gotoAndStop('player');
			
			scaleX = obj.scaleX;
			
			mcListener = MovieClip(getChildAt(0)).getChildAt(0);
		}
	}
	
}
