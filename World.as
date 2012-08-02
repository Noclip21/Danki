package
{
	public class World extends BaseMc
	{
		
		var clients = GlobalVars.vars.clients = new Array();
		
		public function World()
		{
			GlobalVars.vars.world = this;
		}
		override public function display()
		{
			//
		}
		public function GO()
		{
			for(var i=0; i<clients.length; i++)
			{
				clients[i].getBar();
			}
		}
	}
	
}
