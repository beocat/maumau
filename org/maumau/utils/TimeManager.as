package org.maumau.utils 
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class TimeManager
	{
		private var _currentTime:int;
		private var _lastTime:int;
		private var _deltaTime:int;
		
		private static var _instance:TimeManager;
		private static var allow_instantiation:Boolean;
		
		public function TimeManager() 
		{
			if (! allow_instantiation)
			{
				throw new Error("Error: Instatiation failed. Please use TimeManager.instance() instead.");
			}
		}
		
		public function instance() : TimeManager
		{
			if (_instance == null)
			{
				allow_instantiation = true;
				_instance = new TimeManager();
				allow_instantiation = false;
			}
			return _instance
		}
		
		public function update() : void
		{
			_lastTime = _currentTime;
			_currentTime = getTimer();
			_deltaTime = _currentTime - _lastTime;
			//Update all clocks
		}
		
		public function get globalTime() 	: int { return _currentTime; }
		public function get deltaTime()		: int { return _deltaTime; }
	}

}