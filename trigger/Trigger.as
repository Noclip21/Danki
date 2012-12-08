package trigger
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class Trigger
	{
		var timer	 	:Timer;
		var init 		:Timer;
		var listeners	:Array;
		var callbacks	:Array;
		var destructors :Array;
		
		
		public function set display(f :Function)	{ listeners.push(f);	}
		public function set callback(f :Function)	{ callbacks.push(f);	}
		public function set destructor(f :Function)	{ destructors.push(f);	}
		
		
		public function Trigger(delay :Number = 500,count :Number = 0)
		{
			timer = 		new Timer(delay,count);
			init =			new Timer(0,1);
			listeners =		new Array();
			callbacks =		new Array();
			destructors =	new Array();
			
			
			timer.addEventListener(TimerEvent.TIMER,timerLst);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerCompleteLst);
			timer.start();
			
			init.addEventListener(TimerEvent.TIMER_COMPLETE,initLst);
			init.start();
		}
		function timerLst(e :TimerEvent)
		{
			if(timer.repeatCount == 0 ||
			   timer.currentCount < timer.repeatCount)
			for(var i=0; i<listeners.length; i++)
				listeners[i]();
		}
		function timerCompleteLst(e :TimerEvent)
		{
			for(var i=0; i<callbacks.length; i++)
				callbacks[i]();
			kill();
		}
		function initLst(e :TimerEvent)
		{
			timerLst(null);
		}
		public function kill()
		{
			for(var i=0; i<destructors.length; i++)
				destructors[i]();
				
			timer.removeEventListener(TimerEvent.TIMER,timerLst);
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,timerCompleteLst);
			
			init.removeEventListener(TimerEvent.TIMER_COMPLETE,initLst);
		}

	}
	
}
