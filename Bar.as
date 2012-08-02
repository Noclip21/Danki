package
{
	
	import flash.display.MovieClip;
	
	
	public class Bar extends BaseMc
	{
		
		var owner;
		
		public function Bar()
		{
			GlobalVars.vars.bars.push(this);
		}
		public function setOwner(player)
		{
			owner = player;
		}
	}
	
}
