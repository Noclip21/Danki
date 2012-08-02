package
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class GUI extends BaseMc
	{

		public static var Rmenu = null;
		public static var Hmenu = null;
		
		public function GUI()
		{
			switch(Utils.getClass(this))
			{
				case(RadialMenu):{
					if(Rmenu) Rmenu.die();
					Rmenu = this;
					break;
				}
				case(HorizontalMenu):{
					if(Hmenu) Hmenu.die();
					Hmenu = this;
					break;
				}
				default:{
					// nothing. Deal with it
				}
			}
			global.GUI.addChild(this);
			alpha = 0;
			Utils.fade(this,0.3);
		}
		public function pressed(e:Event)
		{
			e.target.action();
		}
		public function die()
		{
			Utils.fade(this,-0.3,function()
			{
				Utils.kill(this);
			});
		}
	}
}
