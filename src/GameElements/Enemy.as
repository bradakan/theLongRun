package GameElements 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Enemy extends MovieClip
	{
		private var _asset:MovieClip;
		private var _speedMultiplier:Number = 0.25;
		
		public function Enemy() 
		{
			
		}
		
		public function update(maxGlobalSpeed:Number)
		{
			this.x += maxGlobalSpeed * _speedMultiplier;
			if (this.x > 10)
			{
				dispatchEvent(new Event(Game.END_GAME,true));
			}
			
		}
		
	}

}