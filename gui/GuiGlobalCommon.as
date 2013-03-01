package gui
{
	import def.*;
	import building.*;
	
	
	public class GuiGlobalCommon extends GuiGlobal
	{

		public function GuiGlobalCommon()
		{
			super(123,703);
			
			BaseMc(this).display = GuiGlobalCommon_display;
		}
		function GuiGlobalCommon_display()
		{
			incoming.text = String(Loja.incoming);
		}
	}
}
