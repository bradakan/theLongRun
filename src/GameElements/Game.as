package GameElements {
	import flash.display.MovieClip;
<<<<<<< HEAD
	import Menus.GameOverMenu;
=======
	import flash.events.Event;
>>>>>>> origin/master
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class Game extends MovieClip
	{
		private var _globalSpeed:int = 0;
		private var _player:Player;
		
		public function Game()
		{
			_player = new Player();
			addChild(_player);
			
			addEventListener(Player.GLOBALSPEED_DOWN,changeGlobalSpeedDown);
			addEventListener(Player.GLOBALSPEED_UP,changeGlobalSpeedUp);
		}
		
		private function changeGlobalSpeedUp()
		{
			_globalSpeed += 1;
		}
		private function changeGlobalSpeedDown()
		{
			_globalSpeed += 1;
		}
		
	}

}