package
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class HorizontalMenu extends GUI
	{
		var _owner;
		
		public function get owner(){ return _owner; }
		public function set owner(n){ _owner = n; }

		public function HorizontalMenu(target)
		{
			_owner = target;
			createButton(0,target.HMButtons);
			/*for(var i=0; i<target.HMButtons.length; i++)
			{
				var obj = addChild(new HMElements());
					obj.gotoAndStop(target.HMButtons[i]);
					Utils.move(obj,Utils.pAt(i*obj.width,0),0.3);
			}*/
		}
		function createButton(i,array)
		{
			if(i<array.length)
			{
				var obj = addChild(new HMElements());
					obj.gotoAndStop(array[i]);
					obj.x = obj.width*(i - 1);
					swapChildren(obj,getChildAt(0));
					Utils.move(obj,Utils.pAt(i*obj.width,0),0.7,function(){ createButton(i+1,array); });
					obj.alvo = _owner;
					obj.addEventListener(MouseEvent.CLICK,pressed);
			}
		}
	}
	
}
