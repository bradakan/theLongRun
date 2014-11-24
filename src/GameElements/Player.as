package GameElements {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Player extends MovieClip
	{
		
		private var _velocityY:int = 5;
		private var _playerArt:CharacterArt;
		
		public static const GLOBALSPEED_DOWN:String = "changeGlobalspeedDown";
		public static const GLOBALSPEED_UP:String = "changeGlobalspeedUp";
		public static const JUMPING_PLAYER:String = "jumpPlayer";
		
		public function Player() 
		{
			_playerArt = new CharacterArt();
			addChild(_playerArt);
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, move);
			
		}
		
		private function move(e:KeyboardEvent):void 
		{
			//left arrow key == 37
			//right arrow key == 39
			//a = 65 
			//d == 68
			//left
			trace(e.keyCode);
			if (e.keyCode == 37 || e.keyCode == 65)
			{
				//dispatch globalspeed down
				dispatchEvent(new Event(GLOBALSPEED_DOWN, true));
				this.x -= 1;
			}
			if (e.keyCode == 39 || e.keyCode == 68)
			{
				//dispatch globalspeed up
				dispatchEvent(new Event(GLOBALSPEED_UP, true));
				this.x -= 1;
			}
			if (e.keyCode == 32)
			{
				//dispatchEvent(new Event(JUMPING_PLAYER, true));
				trace("pewpew");
				_velocityY = -20;
			}			
		}
		public function update():void
		{
			y += _velocityY;
			
			_velocityY++;
			
		}
		
		public function get velocityY():int 
		{
			return _velocityY;
		}
		
		public function set velocityY(value:int):void 
		{
			_velocityY = value;
		}
		
	}

}