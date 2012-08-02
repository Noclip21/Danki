package 
{
	import flash.display.MovieClip;
	import flash.display.MorphShape;
	
	public class Utils
	{
	
		public static function dist(a :Object,b :Object)
		{
			return Math.sqrt(Math.pow(a.x - b.x,2) + Math.pow(a.y - b.y,2));
		}
		public static function ang(a :Object,b :Object)
		{
			var angulo = Math.atan((a.y - b.y)/(a.x - b.x));
			if(!angulo) angulo = 0;
			
			if(a.x < b.x)
				return angulo;
			else
				return Math.PI + angulo;
		}
		public static function alph(target :Object,min :Number,max :Number,valor :Number)
		{
			if(valor > 0)
			{
				if(target.alpha + valor <= max)
					target.alpha += valor;
				else
					target.alpha = max;
			}else{
				if(target.alpha + valor >= min)
					target.alpha += valor;
				else
					target.alpha = min;
			}
		}
		public static function getID(item,array)
		{
			for(var i=0;i<array.length;i++)
				if(array[i] == item)
					return  i;
			return null;
		}
		public static function removeObject(target,array)
		{
			array.splice(getID(target,array),1);
		}
		public static function kill(target)
		{
			target.parent.removeChild(target);
			target.stop();
			target = null;
		}
		public static function pAt(a,b)
		{
			var obj = new Object();
				obj.x = a;
				obj.y = b;
			return obj;
		}
		public static function difFactor(a,b,easy)
		{
			return (a - b)*easy;
		}

	}
	
}
