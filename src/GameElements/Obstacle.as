package GameElements 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Obstacle extends MovieClip 
	{
		public static const REMOVE_OBSTACLE:String = "removeObstacle";
		private var _asset:MovieClip;
		private var _hitBox:MovieClip;
		public function Obstacle() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
			var whatObstacle:Number = Math.floor(Math.random() * 3);
			if (whatObstacle == 0)
			{
				_asset = new SpikesObstacle();
				_hitBox = new SpikesHitbox();
			}
			if (whatObstacle == 1)
			{
				_asset = new AcidpoolObstacle();
				_hitBox = new AcidPoollHitbox();
			}
			if (whatObstacle == 2)
			{
				_asset = new BrokenGlassObstacle();
				_hitBox = new BrokenGlassHitbox();
			}
			addChild(_asset);
			addChild(_hitBox);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		public function update(globalspeed:Number)
		{
			this.x += globalspeed;
			if (this.x < - this.width)
			{
				dispatchEvent(new Event(REMOVE_OBSTACLE,true));
			}
		}
		
		public function get hitBox():MovieClip 
		{
			return _hitBox;
		}
		
	
		
	}

}