package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import GlobalVars;
	
	public class BaseMc extends MovieClip
	{
		var avelx :Number = 0;
		var avely :Number = 0;
		
		var lastx :Number = 0;
		var lasty :Number = 0;
		
		var key = GlobalVars.vars.key;
		var global = GlobalVars.vars;
		
		public function get _avelx(){ return avelx; }
		public function get _avely(){ return avely; }
		
		public function set _avelx(n){ avelx = n; }
		public function set _avely(n){ avely = n; }
		
		
		
		// animation vars
		
		var minAlpha;
		var maxAlpha;
		var offsetAlpha;
		var callbackAlpha;
		var pointMove;
		var easyMove;
		var callbackMove;
		var resizeSize;
		var resizeEasy;
		var resizeCallback;
		
		
		
		public function BaseMc()
		{
			global.objects.push(this);
			lastx = x;
			lasty = y;
		}
		
		
		public function BaseMc_display()
		{
			this.x += avelx;
			this.y += avely;
		}
		public function display()
		{
			BaseMc_display();
		}
		
	}
	
}
