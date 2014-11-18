package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import GameElements.Game;
	import Menus.GameOverMenu;
	import Menus.MainMenu;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Main extends Sprite 
	{
		private var _mainMenu:MainMenu;
		private var _game:Game;
		private var _deathScreen:GameOverMenu;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(MainMenu.START_GAME,startGame);
			_mainMenu = new MainMenu();
			addChild(_mainMenu);
		}
		
		private function startGame(e:Event):void 
		{
			_game = new Game();
			removeChild(_mainMenu);
		}
		private function gameOver(e:Event):void
		{
			_deathScreen = new GameOverMenu();
		}
		
	}
	
}