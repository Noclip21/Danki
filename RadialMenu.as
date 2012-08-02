﻿package{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class RadialMenu extends BaseMc
	{
		var owner;
		
		public function RadialMenu(posx,posy,target,mc)
		{
			var ratius = width/2;
			
			x = posx;
				if(x - ratius < 0) x = ratius;
				if(x + ratius > target.width) x = target.width - ratius;
			y = posy;
				if(y - ratius < 0) y = ratius;
				if(y + ratius > target.height) y = target.height - ratius;
				
			target.addChild(this);
			owner = mc;
			
			var n = mc.RMButtons.length;
			for(var i=0; i<n; i++)
			{
				var obj = addChild(new RMButton);
					obj.gotoAndStop(mc.RMButtons[i]);
					obj.x = ratius*Math.cos(2*Math.PI*i/n - Math.PI/2);
					obj.y = ratius*Math.sin(2*Math.PI*i/n - Math.PI/2);
					obj.addEventListener(MouseEvent.CLICK,pressed);
					obj.alvo = mc;
			}
		}
		public function pressed(e:Event)
		{
			e.target.action();
		}
	}
	
}
