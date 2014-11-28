package Menus 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class GameOverMenu extends Sprite
	{
		private var _death:DeathText;
		private var _startButton:RestartButton;
		private var _background:introBackground;
		
		public function GameOverMenu() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_background = new introBackground();
			_startButton = new RestartButton();
			_startButton.x = 100;
			_startButton.y = 400;
			addChild(_background);
			addChild(_startButton);
			
			addEventListener(MouseEvent.CLICK, playGame);
		}
		private function playGame(e:MouseEvent):void
		{
			if (e.target == _startButton)
			{
				dispatchEvent(new Event(MainMenu.START_GAME, true));
			}
		}
	}

}