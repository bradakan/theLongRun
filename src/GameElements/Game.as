package GameElements 
{
	import flash.display.MovieClip;
	import Menus.GameOverMenu;
	import flash.events.Event;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class Game extends MovieClip
	{
		//player stuff
		private var _globalSpeed:int = 0;
		private var _player:Player;
		
		//game over stuff
		private var _impendingDoom:Boolean = false;
		public static const END_GAME:String = "gameOver";
		
		public function Game()
		{
			_player = new Player();
			addChild(_player);
			
			addEventListener(Player.GLOBALSPEED_DOWN,changeGlobalSpeedDown);
			addEventListener(Player.GLOBALSPEED_UP, changeGlobalSpeedUp);
			
			//even hier neergezet want ik weet op het moment geen andere plek xd
			if (_impendingDoom == true)
			{
				dispatchEvent(new Event(END_GAME, true));
			}
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