﻿package perspective
{
	import def.*;
	import flash.display.MovieClip;
	
	public class WorldCamera extends BaseMc
	{
		public static var objects :Array;
		
		var screen  :Screen;
		var _target :Object;
		var _delay	:Number;
		var W		:Number;
		var H		:Number;
		
		public function get target(){ return _target; }
		public function get delay() { return _delay;  }
		
		public function set target(n){ _target = n; }
		public function set delay(n) { _delay = n;  }
		
		
		public function WorldCamera(scr :Screen,obj :Object,del :Number = 0.2)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			BaseMc(this).display = 	  Camera_display;
			BaseMc(this).destructor = Camera_destructor;
			
			
			screen = scr;
			_target = obj;
			_delay = del;
			W = scr.screenW;
			H = scr.screenH;
		}
		function Camera_destructor()
		{
			Utils.removeObject(this,objects);
		}
		public function Camera_display()
		{
			avel.x = (- _target.x - screen.x)*_delay;
			avel.y = (- _target.y - screen.y)*_delay;
			
			
			screen.x += avel.x;
			screen.y += avel.y;
		}

	}
	
}
