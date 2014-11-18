package Menus 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class GameOverMenu extends Sprite
	{
		private var _death:DeathText;
		private var _restartGame:RestartButton;
		private var _backToMain:MainMenu;
		
		public function GameOverMenu() 
		{
			_death = new DeathText();
			_death.x = 200;
			_death.y = 200;
			addChild(_death);
			
			_restartGame = new RestartButton();
			_restartGame.x = 200;
			_restartGame.y = 250;
			addChild(_restartGame);
			
			addEventListener(MouseEvent.CLICK, startOver);
		}
		private function startOver(e:MouseEvent):void
		{
			if (e.target == _restartGame)
			{
				_backToMain = new MainMenu();
				addChild(_backToMain);
				removeChild(_death);
				removeChild(_restartGame);
			}
		}
		
	}

}