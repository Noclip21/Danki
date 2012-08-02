package
{
	import flash.display.MovieClip;
	
	public class Particle extends CenarioObject
	{

		var mcListener :Object;
		
		public function Particle(origin :Object)
		{
			this.x = origin.x;
			this.y = origin.y;
		}
		public function Particle_display()
		{
			if(mcListener.currentFrame == mcListener.totalFrames)
			{
				mcListener.stop();
				Utils.fade(this,-0.05,function()
				{
					Utils.removeObject(this,GlobalVars.vars.objects);
					Utils.kill(this);
				});
			}
		}
		override public function display()
		{
			Particle_display();
			CenarioObject_display();
		}

	}
	
}
