package trigger
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Trigger
	{
		var timer	  :Timer;
		var listeners :Array;
		
		public function set display(f :Function){ listeners.push(f); }
		
		
		public function Trigger(delay :Number = 500)
		{
			timer = 	new Timer(delay);
			listeners = new Array();
			
			timer.addEventListener(TimerEvent.TIMER,timerLst);
			timer.start();
		}
		function timerLst(e :TimerEvent)
		{
			for(var i=0; i<listeners.length; i++)
				listeners[i]();
		}
		public function kill()
		{
			timer.removeEventListener(TimerEvent.TIMER,timerLst);
		}

	}
	
}
