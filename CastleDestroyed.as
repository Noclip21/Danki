package
{
	import flash.display.MovieClip;
	
	public class CastleDestroyed extends Particle
	{

		public function CastleDestroyed(obj :Object)
		{
			super(obj);
			
			if(obj.AI)	gotoAndStop('AI');
			else 		gotoAndStop('player');
			
			mcListener = MovieClip(getChildAt(0));
		}

	}
	
}
