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
		private var _playerArt:MovieClip;
		private var _playerJump:PlayerJump;
		private var _isJumping:Boolean = false;
		private var _game:MovieClip;
		public static const GLOBALSPEED_DOWN:String = "changeGlobalspeedDown";
		public static const GLOBALSPEED_UP:String = "changeGlobalspeedUp";
		public static const JUMPING_PLAYER:String = "jumpPlayer";
		
		
		public function Player(game:MovieClip) 
		{
			_game = game;
			_playerArt = new PlayerRun();
			_playerJump = new PlayerJump();
			addChild(_playerJump);
			_playerJump.visible = false;
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
			
			if (e.keyCode == 37 || e.keyCode == 65)
			{
				//dispatch globalspeed down
				dispatchEvent(new Event(GLOBALSPEED_DOWN, true));
			}
			if (e.keyCode == 39 || e.keyCode == 68)
			{
				//dispatch globalspeed up
				dispatchEvent(new Event(GLOBALSPEED_UP, true));
			}
			if (e.keyCode == 32)
			{
				//dispatchEvent(new Event(JUMPING_PLAYER, true));
				if (!_isJumping)
				{
					_velocityY = -20;
					_isJumping = true;
				}
			}			
		}
		public function update():void
		{
			
			y += _velocityY;
			if (y > 430)
			{
				_velocityY = 0;
				_isJumping = false;
				
			}
			else
			{
				_velocityY++;
			}
			if (this.x < 450)
			{
				x++;
			}
			/*
			if (_isJumping == true)
			{
				_playerJump.visible = true;
				_playerArt.visible = false;
			}
			else
			{
				_playerArt.visible = true;
				_playerJump.visible = false;
			}
			*/
		}
		
		public function get velocityY():int 
		{
			return _velocityY;
		}
		
		public function set velocityY(value:int):void 
		{
			_velocityY = value;
		}
		
		public function get isJumping():Boolean 
		{
			return _isJumping;
		}
		
		public function set isJumping(value:Boolean):void 
		{
			_isJumping = value;
		}
		
	}

}