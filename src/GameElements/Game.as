package GameElements 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import Menus.GameOverMenu;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author Bart van der Geest & Rocky Tempelaaars
	 */
	public class Game extends MovieClip
	{
		//player stuff
		private var _toBeRemoved:Boolean = false;
		private var _obstacleTimer:Timer;
		private var _globalSpeed:int = -10;
		private var _maxGlobalSpeed:int = 10;
		private var _jumpForce:int = 80;
		private var _player:Player;
		private var _background:MovieClip;
		private var _background2:MovieClip;
		private var _isJumping:Boolean = false;
		private var _gravity:int = 5;
		private var _obstacles:Array = [];
		private var _enemy:EnemyArt;
		//game over stuff
		public static const END_GAME:String = "gameOver";
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_background = new Background1();
			_background2 = new Background2();
			_background2.x = _background2.width;
			_background2.y = _background.y;
			_player = new Player(this);
			_enemy = new EnemyArt();
			addChild(_background);
			addChild(_background2);
			addChild(_player);
			_player.x = _player.width;
			_player.y = 430;
			addChild(_player);
			_enemy.y = _player.y;
			_enemy.x =  _player.x - 200;
			addChild(_enemy);
			_obstacleTimer = new Timer(5000,1);
			_obstacleTimer.addEventListener(TimerEvent.TIMER_COMPLETE,spawnObstacle);
			_obstacleTimer.start();
			
			//addEventListener(Player.GLOBALSPEED_DOWN,changeGlobalSpeedDown);
			//addEventListener(Player.GLOBALSPEED_UP,changeGlobalSpeedUp);
			addEventListener(Event.ENTER_FRAME, update);
			addEventListener(Obstacle.REMOVE_OBSTACLE,removeObstacle);
			
		}
		
		private function spawnObstacle(e:TimerEvent):void 
		{
			if (_toBeRemoved == false)
			{
				var obstacle = new Obstacle();
				obstacle.x = stage.stageWidth + obstacle.width;
				obstacle.y = 430;
				addChild(obstacle);
				_obstacles.push(obstacle);
				trace(_obstacles.length);
				_globalSpeed--;
				_obstacleTimer.start();
			}
		}
		
		private function removeObstacle(e:Event):void 
		{
			var currentObstacle : Obstacle = e.target as Obstacle;
			var index : int = _obstacles.indexOf(currentObstacle);
			removeChild(_obstacles[index]);
			_obstacles.splice(index,1);
		}
		
		private function changeGlobalSpeedUp(e:Event):void
		{
			if (_globalSpeed > -_maxGlobalSpeed)
			{
				_globalSpeed -= 1;
			}
		}
		private function changeGlobalSpeedDown(e:Event):void
		{
			if (_globalSpeed < 0)
			{
				_globalSpeed += 1;
			}
		}
		private function update(e:Event):void
		{
			if (_toBeRemoved == false)
			{
				_background.x += _globalSpeed;
				_background2.x += _globalSpeed;				
				_enemy.x =  _player.x - 200;
				if (_background.x <= -_background.width)
				{
					_background.x = _background2.x + _background.width;
				}
				if (_background2.x <= -_background2.width)
				{
					_background2.x = _background.x + _background2.width;
				}
				if (_obstacles.length > 0)
				{
					for (var i:int = _obstacles.length - 1; i >= 0; i--)
					{
						
						if (_player.hitTestObject(_obstacles[i].hitBox))
						{
							dispatchEvent(new Event(Game.END_GAME,true));
						}
						_obstacles[i].update(_globalSpeed);
					}
				}
				
				
				_player.update();
				trace(_obstacleTimer.running);
				trace(_obstacles.length);
			}
		}
		
		public function get toBeRemoved():Boolean 
		{
			return _toBeRemoved;
		}
		
		public function set toBeRemoved(value:Boolean):void 
		{
			_toBeRemoved = value;
		}
	}

}