<<<<<<< HEAD
package GameElements {
	import flash.display.MovieClip;
	import flash.events.Event;
	
=======
package GameElements 
{
	import flash.display.MovieClip;
>>>>>>> 529fa59d62546d80343a113396fbe319a31bb36a
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