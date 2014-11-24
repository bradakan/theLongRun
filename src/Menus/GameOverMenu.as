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
		
		public function GameOverMenu() 
		{
			_death = new DeathText();
			_death.x = 200;
			_death.y = 200;
			addChild(_death);
		}
	}

}