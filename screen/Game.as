package screen
{
	import def.*;
	import gui.*;
	import unit.*;
	import building.*;
	import perspective.*;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import trigger.*;

	
	public class Game extends WorldMap
	{
		public static var currentMap :Game;
		public static var level		 :Number;
		public static var buildings  :Array;
		public static var totalLanes :Number;
		
		
		var triggerLst :TriggerGame;
		
		var guiGlobalCommon :GuiGlobalCommon;
		var guiGlobalLoja	:GuiGlobalLoja;
		var guiGlobalCastle :GuiGlobalCastle;
		
		
		public static function getBuilding(lane :Number,defClass :Class)
		{
			var classString :String = Class(defClass).toString();
			for(var i=0; i<buildings[lane].length; i++)
				if(Utils.getClass(buildings[lane][i]) == classString)
					return buildings[lane][i];
		}
		
		
		public function Game(source	:MovieClip,
							lvl		:Number = 1)
		{
			currentMap = this;
			
			gotoAndStop('lvl'+lvl);
			super(Main.game,0,source);
			
			level = 	 lvl;
			totalLanes = 5;
			triggerLst = new TriggerGame();
			
			guiGlobalCommon = new GuiGlobalCommon();
			guiGlobalLoja	= new GuiGlobalLoja();
			guiGlobalCastle = new GuiGlobalCastle();
			
			Loja.incoming =			30;
			Warrior.unitsDead =		0;
			Warrior.unitsDeadCpu =	0;
			
			createBuildings();
			
			BaseMc(this).destructor = World_destructor;
		}
		function World_destructor()
		{
			triggerLst.kill();
			
			guiGlobalCommon.kill();
			guiGlobalLoja.kill();
			guiGlobalCastle.kill();
		}
		function createBuildings()
		{
			buildings = new Array();
			var base = 146;
			var coef = 138;
			for(var i=0; i<totalLanes; i++)
			{
				buildings.push(new Array());
				
				buildings[i].push(new Casa(i,0,				base + coef*i));
				buildings[i].push(new Loja(i,677,			base + coef*i));
				buildings[i].push(new CastlePlayer(i,772,	base + coef*i));
				buildings[i].push(new CastleCpu(i,1650,		base + coef*i));
			}
			focusGuerra();
		}
		public function focusGuerra()
		{
			cam = new Point(1180,384);
			guiGlobalLoja.hide();
			guiGlobalCastle.show();
		}
		public function focusComercio()
		{
			cam = new Point(512,384);
			guiGlobalLoja.show();
			guiGlobalCastle.hide();
		}
	}
	
}
