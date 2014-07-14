package org.maumau.input 
{
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauKeyboardController
	{
		private const NUM_OF_KEYS:uint = 256;
		protected var _buttons:Vector.<Number>;
		protected var _nrOfButtons:uint;
		protected var _time:Number;
		protected var _lastTime:Number;
		
		public function MauKeyboardController() 
		{
			_nrOfButtons = NUM_OF_KEYS;
			_buttons = new Vector.<Number>(_nrOfButtons, true);
			_time = 0;
		}
		
		public function update(dt:Number = 1) : void
		{
			_lastTime = _time;
			_time += dt;
		}
		
		public function down(key:uint) : Boolean
		{
			return key < _nrOfButtons && _buttons[key] > 0;
		}
		
		public function up(key:uint) : Boolean
		{
			return key < _nrOfButtons && _buttons[key] < 0;
		}
		
		public function justPressed(key:uint) : Boolean
		{
			return key < _nrOfButtons && _buttons[key] >= _lastTime && _lastTime > 0;
		}
		
		public function justReleased(key:uint) : Boolean
		{
			return key < _nrOfButtons && _buttons[key] <= -_lastTime && _lastTime > 0;
		}
		

		public function anyDown() : Boolean
		{
			for (var key:int = 0; key < _nrOfButtons; ++key)
			{
				if (_buttons[key] > 0)
				{
					return true;
				}
			}
			return false;
		}
		
		public function anyJustPressed() : Boolean
		{
			for (var key:int = 0; key < _nrOfButtons; ++key)
			{
				if (_buttons[key] != 0 && _buttons[key] >= _lastTime)
				{
					return true;
				}
			}
			return false;
		}
		
		public function release(key:uint) : void
		{
			if (key < _nrOfButtons)
			{
				_buttons[key] = -_time;
			}
		}
		
		public function releaseAll() : void
		{
			for (var key:int = 0; key < _nrOfButtons; ++key)
			{
				_buttons[key] = _buttons[key] > 0 ? -_time : _buttons[key];
			}
		}
		
		public function reset(key:uint) : void
		{
			if (key < _nrOfButtons)
			{
				_buttons[key] = 0;
			}
		}
		
		public function handleKeyDownEvent(e:KeyboardEvent) : void
		{
			if (e.keyCode >= _nrOfButtons || _buttons[e.keyCode] > 0)
			{
				return;
			}
			_buttons[e.keyCode] = _time;
		}
		
		public function handleKeyUpEvent(e:KeyboardEvent) : void
		{
			if (e.keyCode < _nrOfButtons)
			{
				_buttons[e.keyCode] = -_time;
			}
		}
		
	}

}