package org.maumau.utils 
{
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class Clock 
	{
		private var _time:Number;
		private var _scale:Number;
		private var _isPaused:Boolean;
		
		public function Clock() 
		{
			_time = 0;
			_scale = 1;
			_isPaused = false;
		}
		
		public function update(dt:int) : void
		{
			_time += dt * _scale;
		}
		
		public function get paused() 					: Boolean 	{ return _isPaused; }
		public function set paused(isPaused:Boolean) 	: void		{ _isPaused = isPaused; }
		public function get scale()						: Number	{ return _scale; }
		public function set scale(scaling:Number)		: void		{ _scale = scaling; }
		public function get time()						: Number	{ return _time; }
		
	}

}