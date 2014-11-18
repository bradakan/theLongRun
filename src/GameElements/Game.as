package GameElements 
{
	import flash.display.MovieClip;
	import Menus.GameOverMenu;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class Game extends MovieClip
	{
		private var _deathScreen:GameOverMenu
		private var _gameOver:Boolean;
		
		
		public function Game()
		{
			_gameOver = true;
			if (_gameOver == true)
			{
				_deathScreen = new GameOverMenu();
				addChild(_deathScreen);
			}
		}
		
	}

}