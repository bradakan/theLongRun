package GameElements 
{
	import flash.display.Sprite;
	import Menus.GameOverMenu;
	import flash.events.Event;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class Game extends Sprite
	{
		//player stuff
		private var _globalSpeed:int = 0;
		private var _jumpForce:int = 8;
		private var _player:Player;
		private var _isJumping:Boolean = false;
		
		//game over stuff
		private var _impendingDoom:Boolean = false;
		public static const END_GAME:String = "gameOver";
		
		//level stuff
		private var _ground:DummyGround;
		
		public function Game()
		{
			_player = new Player();
			_player.x = 80;
			_player.y = 400;
			addChild(_player);
			
			_ground = new DummyGround();
			_ground.x = 50;
			_ground.y = 400;
			addChild(_ground);
			
			addEventListener(Player.GLOBALSPEED_DOWN,changeGlobalSpeedDown);
			addEventListener(Player.GLOBALSPEED_UP, changeGlobalSpeedUp);
			addEventListener(Player.JUMPING_PLAYER, jumpPlayer);
			addEventListener(Event.ENTER_FRAME, update);
			
			trace(_player, _ground)
			
			//even hier neergezet want ik weet op het moment geen andere plek xd
			if (_impendingDoom == true)
			{
				dispatchEvent(new Event(END_GAME, true));
			}
		}
		
		private function changeGlobalSpeedUp():void
		{
			_globalSpeed += 1;
		}
		private function changeGlobalSpeedDown():void
		{
			_globalSpeed += 1;
		}
		private function jumpPlayer():void
		{
			_isJumping = true;
			_player.y += _jumpForce;
			while (_isJumping == true)
			{
				_isJumping = false;
				_jumpForce -= 1;
				
			}
		}
		private function update(e:Event):void
		{
			_player.y ++;
			if (_player.hitTestObject(_ground))
			{
				_player.y += -1;
			}
		}
	}

}