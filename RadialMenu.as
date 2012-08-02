package
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class RadialMenu extends GUI
	{
		var _owner;
		
		public function get owner(){ return _owner; }
		public function set owner(n){ _owner = n; }
		
		public function RadialMenu(posx,posy,target)
		{
			var ratius = width/2;
			
			var newx = x = posx;
				if(x - ratius < 0) newx = ratius;
				if(x + ratius > global.world.width) newx = global.world.width - ratius;
			var newy = y = posy;
				if(y - ratius < 0) newy = ratius;
				if(y + ratius > global.world.height) newy = global.world.height - ratius;
			
			Utils.move(this,Utils.pAt(newx,newy));
			
			_owner = target;
			
			var n = target.RMButtons.length;
			for(var i=0; i<n; i++)
			{
				var obj = addChild(new RMButton);
					obj.gotoAndStop(target.RMButtons[i]);
					obj.x = ratius*Math.cos(2*Math.PI*i/n - Math.PI/2);
					obj.y = ratius*Math.sin(2*Math.PI*i/n - Math.PI/2);
					obj.addEventListener(MouseEvent.CLICK,pressed);
					obj.alvo = target;
			}
		}
	}
	
}
