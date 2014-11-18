package Menus 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import GameElements.Game;
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class MainMenu extends Sprite
	{
		private var _startButton:StartGameButton;
		private var _game:Game;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
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
				stage._game = new Game();
				stage.addChild(_game);
				stage.removeChild(_startButton);
			}
		}
	}

}