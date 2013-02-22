package gui
{
	import def.*;
	import building.*;
	
	
	public class GuiGlobalCommon extends GuiGlobal
	{

		public function GuiGlobalCommon()
		{
			super(300,0);
			
			BaseMc(this).display = GuiGlobalCommon_display;
		}
		function GuiGlobalCommon_display()
		{
			incoming.text = String(Loja.incoming);
		}
	}
}
