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
			
			_deathScreen = new GameOverMenu();
			_mainMenu = new MainMenu();
			addChild(_mainMenu);
			
			addEventListener(MainMenu.START_GAME, startGame);
			addEventListener(Game.END_GAME, gameOver);
		}
		
		private function startGame(e:Event):void 
		{
			
			_game = new Game();
			addChild(_game);
			if (stage.contains(_mainMenu))
			{
				trace("i haz a mainMenu");
				removeChild(_mainMenu);
			}
			if (stage.contains(_deathScreen))
			{
				trace("i haz a deathscreen");
				removeChild(_deathScreen);
			}
			stage.focus = stage;
		}
		private function gameOver(e:Event):void
		{
			_deathScreen = new GameOverMenu();
			addChild(_deathScreen);
			_game.toBeRemoved = true;
			removeChild(_game);
		}
		
		
	}
	
}