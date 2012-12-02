package building
{
	import def.*;
	
	public class Castle extends Building
	{
		public static var objects :Array;
		
		public static var maxUnits :Number = 6;
		
		
		public function Castle(defLane	:Number,
							   posx		:Number,
							   posy		:Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			super(defLane,1000,10,posx,posy);
			
			BaseMc(this).destructor = Castle_destructor;
		}
		function Castle_destructor()
		{
			Utils.removeObject(this,objects);
		}
	}
	
}
