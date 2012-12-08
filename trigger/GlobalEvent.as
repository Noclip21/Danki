package trigger
{
	import def.*;
	
	
	public class GlobalEvent extends Trigger
	{
		static var objects :Array;
		
		override public function set callback(f :Function){ destructor = f; }
		

		public function GlobalEvent(delay :Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			super(delay,1);
			
			destructor = GlobalEvent_destructor;
		}
		function GlobalEvent_destructor()
		{
			Utils.removeObject(this,objects);
		}
		public static function kill()
		{
			while(objects.length > 0)
				GlobalEvent(objects[0]).kill();
		}
		
	}
	
}
