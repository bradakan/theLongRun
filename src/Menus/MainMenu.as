package Menus 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.NetStreamMulticastInfo;
	import GameElements.Game;
	import flash.events.Event;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class MainMenu extends Sprite
	{
		private var _startButton:StartGameButton;
		public static const START_GAME:String = "startGame";
		
		
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
				dispatchEvent(new Event(START_GAME,true));
			}
		}
	}

}