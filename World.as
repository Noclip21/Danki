package
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	
	public class World extends BaseMc
	{
		var win = false;
		var timer:Timer = new Timer(3000);
		
		public function World(lvl :Number)
		{
			this.gotoAndStop("lvl"+lvl);
		}
		override public function display()
		{
			if(GlobalVars.vars.castles.length < 2 && !win)
			{
				win = true;
				timer.addEventListener(TimerEvent.TIMER,endMatch);
				timer.start();
			}
		}
		private function endMatch(e :TimerEvent)
		{
			timer.removeEventListener(TimerEvent.TIMER,endMatch);
			DanKi(root).nextLevel();
			Utils.kill(this);
		}
	}
	
}
