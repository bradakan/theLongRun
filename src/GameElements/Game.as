package GameElements {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class Game extends MovieClip
	{
		private var _globalSpeed
		
		public function Game() 
		{
			addEventListener(Player.GLOBALSPEED_DOWN,changeGlobalSpeed(-1));
			addEventListener(Player.GLOBALSPEED_UP,changeGlobalSpeed(1));
		}
		
		private function changeGlobalSpeed(i:int)
		{
			_globalSpeed += i;
		}
	}

}