package Menus 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import GameElements.Game;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class MainMenu extends Sprite
	{
		private var _startButton:StartGameButton;
		private var _game:Game;
		
		
		public function MainMenu() 
		{
			_startButton = new StartGameButton();
			_startButton.x = 200;
			_startButton.y = 200;
			addChild(_startButton);
			
			addEventListener(MouseEvent.CLICK, playGame);
		}
		private function playGame(e:MouseEvent):void
		{
			if (e.target == _startButton)
			{
				trace("lalal");
				_game = new Game();
				addChild(_game);
				removeChild(_startButton);
			}
		}
	}

}