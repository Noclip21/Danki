package building
{
	import def.*;
	
	public class Castle extends Building
	{
		public static var objects :Array;
		
		
		public function Castle(defLane	:Number,
							   posx		:Number,
							   posy		:Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			super(defLane,1000,10,posx,posy);
			
			maxUnits = 6;
			
			BaseMc(this).destructor = Castle_destructor;
		}
		function Castle_destructor()
		{
			Utils.removeObject(this,objects);
		}
	}
	
}
