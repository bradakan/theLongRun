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
		public static const GLOBALSPEED_DOWN:String = "globalspeedDown";
		public static const GLOBALSPEED_UP:String = "globalspeedUp";
		private var _asset:PlayerClass;
		
		public function Player() 
		{
			_asset = new PlayerClass();
			addChild(_asset);
			addEventListener(KeyboardEvent.KEY_DOWN,move);
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
				//jump
			}			
		}
		
		public function update():void
		{
			
		}
		
	}

}