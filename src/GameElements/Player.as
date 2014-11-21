package GameElements {
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Player extends Sprite
	{
		private var _playerArt:CharacterArt;
		
		public static const GLOBALSPEED_DOWN:String = "changeGlobalspeedDown";
		public static const GLOBALSPEED_UP:String = "changeGlobalspeedUp";
		public static const JUMPING_PLAYER:String = "jumpPlayer";
		
		public function Player() 
		{
			_playerArt = new CharacterArt();
			addChild(_playerArt);
			
			addEventListener(KeyboardEvent.KEY_DOWN, move);
		}
		
		private function move(e:KeyboardEvent):void 
		{
			//left arrow key == 37
			//right arrow key == 39
			//a = 65 
			//d == 68
			
			//left
			if (e.keyCode == 37 || e.keyCode == 65)
			{
				//dispatch globalspeed down
				dispatchEvent(new Event(GLOBALSPEED_DOWN,true));
			}
			if (e.keyCode == 39 || e.keyCode == 68)
			{
				//dispatch globalspeed up
				dispatchEvent(new Event(GLOBALSPEED_UP,true));
			}
			if (e.keyCode == 32)
			{
				dispatchEvent(new Event(JUMPING_PLAYER, true));
			}			
		}
		
		/*public function update()
		{
			
		}*/
		
	}

}