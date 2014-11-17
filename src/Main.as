package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Menus.MainMenu;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Main extends Sprite 
	{
		private var _mainMenu:MainMenu;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_mainMenu = new MainMenu();
		}
		
	}
	
}