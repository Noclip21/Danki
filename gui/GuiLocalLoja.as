package gui
{
	import building.*;
	import flash.display.MovieClip;

	
	public class GuiLocalLoja extends GuiLocal
	{

		public function GuiLocalLoja(building :Building)
		{
			super(building,MovieClip(building).x-170-width,MovieClip(building).y-70);
		}

	}
	
}
