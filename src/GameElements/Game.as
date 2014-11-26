package GameElements 
{
	import flash.display.Sprite;
	import Menus.GameOverMenu;
	import flash.events.Event;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class Game extends Sprite
	{
		//player stuff
		private var _globalSpeed:int = 0;
		private var _jumpForce:int = 80;
		private var _player:Player;
		private var _background:Backgound;
		private var _background2:Backgound;
		private var _isJumping:Boolean = false;
		private var _gravity:int = 5;
		
		//game over stuff
		private var _impendingDoom:Boolean = false;
		public static const END_GAME:String = "gameOver";
		
		//level stuff
		private var _ground:DummyGround;
		
		public function Game()
		{
			
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			//addEventListener(Event.ENTER_FRAME,gameLoop);
			//addEventListener(Player.GLOBALSPEED_DOWN,changeGlobalSpeedDown);
			//addEventListener(Player.GLOBALSPEED_UP,changeGlobalSpeedUp);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_background = new Backgound();
			_background2 = new Backgound();
			_background2.x = _background2.width;
			_player = new Player();
			addChild(_background);
			addChild(_background2);
			addChild(_player);
			_player.x = 80;
			_player.y = 100;
			addChild(_player);
			
			_ground = new DummyGround();
			_ground.x = 50;
			_ground.y = 400;
			addChild(_ground);
			
			addEventListener(Player.GLOBALSPEED_DOWN,changeGlobalSpeedDown);
			addEventListener(Player.GLOBALSPEED_UP,changeGlobalSpeedUp);
			addEventListener(Player.JUMPING_PLAYER,jumpPlayer);
			addEventListener(Event.ENTER_FRAME, update);
			
			
			//even hier neergezet want ik weet op het moment geen andere plek xd
			if (_impendingDoom == true)
			{
				dispatchEvent(new Event(END_GAME, true));
			}
		}
		
		private function changeGlobalSpeedUp(e:Event):void
		{
			_globalSpeed += 1;
		}
		private function changeGlobalSpeedDown(e:Event):void
		{
			_globalSpeed -= 1;
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
			
			_background.x += _globalSpeed;
			_background2.x += _globalSpeed;
			if (_background.x <= -_background.width)
			{
				_background.x = _background2.x + _background.width;
			}
			if (_background2.x <= -_background2.width)
			{
				_background2.x = _background.x + _background2.width;
			}
			
			_player.update();
			if (_player.hitTestObject(_ground))
			{
				_player.velocityY = 0;
				_player.y = _ground.y - _player.height;
			}
		}
	}

}