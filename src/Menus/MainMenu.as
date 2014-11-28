package Menus 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class MainMenu extends Sprite
	{
		private var _startButton:StartGameButton;
		public static const START_GAME:String = "startGame";
		private var _background:introBackground;

		
		public function MainMenu():void 
		{
			if (stage) init();
			addEventListener(Event.ADDED_TO_STAGE, init);
			_background = new introBackground();
			addChild(_background);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_startButton = new StartGameButton();
			_startButton.x = 100;
			_startButton.y = 400;
			addChild(_startButton);
			
			addEventListener(MouseEvent.CLICK, playGame);
		}
		private function playGame(e:MouseEvent):void
		{
			if (e.target == _startButton)
			{
				dispatchEvent(new Event(START_GAME, true));
			}
		}
	}

}