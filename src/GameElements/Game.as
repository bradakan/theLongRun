package GameElements {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class Game extends MovieClip
	{
		private var _globalSpeed:int = 0;
		private var _player:Player;
		private var _background:Backgound;
		
		public function Game()
		{
			
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME,gameLoop);
			//addEventListener(Player.GLOBALSPEED_DOWN,changeGlobalSpeedDown);
			//addEventListener(Player.GLOBALSPEED_UP,changeGlobalSpeedUp);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_background = new Backgound();
			_player = new Player();
			addChild(_background);
			addChild(_player);
		}
		
		private function gameLoop(e:Event):void 
		{
			root.scrollRect = new Rectangle(_player.x - stage.stageWidth/2, _player.y - stage.stageHeight/2, stage.stageWidth, stage.stageHeight);
		}
		/*
		private function changeGlobalSpeedUp():void
		{
			_globalSpeed += 1;
		}
		private function changeGlobalSpeedDown():void
		{
			_globalSpeed -= 1;
		}
		*/
		
		
	}

}