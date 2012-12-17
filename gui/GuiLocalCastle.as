﻿package gui
{
	import building.*;
	import unit.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class GuiLocalCastle extends GuiLocal
	{

		public function GuiLocalCastle(castle :Castle)
		{
			super(castle,castle.x+70,castle.y-123);
			
			b1.addEventListener(MouseEvent.MOUSE_UP,b1_click);
			b2.addEventListener(MouseEvent.MOUSE_UP,b2_click);
			b3.addEventListener(MouseEvent.MOUSE_UP,b3_click);
			b4.addEventListener(MouseEvent.MOUSE_UP,b4_click);
		}
		function b1_click(e :MouseEvent)
		{
			new GuiLocalSubmenuCastle(Castle(ref),Arqueiro);
		}
		function b2_click(e :MouseEvent)
		{
			new GuiLocalSubmenuCastle(Castle(ref),Lanceiro);
		}
		function b3_click(e :MouseEvent)
		{
			new GuiLocalSubmenuCastle(Castle(ref),Samurai);
		}
		function b4_click(e :MouseEvent)
		{
			new GuiLocalSubmenuCastle(Castle(ref),Lanceiro);
		}
	}
	
}
