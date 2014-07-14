package org.maumau.input
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MousePoll 
	{
		private var _display	: DisplayObject;
		public var position 	: Point;
		public var stagePosition: Point;
		public var delta		: Point;
		public var down			: Boolean;
		
		
		public function MousePoll(displayObject:DisplayObject) 
		{
			_display = displayObject;
			position		= new Point(0, 0);
			stagePosition	= new Point();
			delta			= new Point();
			_display.addEventListener(MouseEvent.MOUSE_MOVE, 	onMouseMove,	false, 0, true);
			_display.addEventListener(MouseEvent.MOUSE_DOWN, 	onMouseDown,	false, 0, true);
			_display.addEventListener(MouseEvent.MOUSE_UP, 		onMouseUp,		false, 0, true);
		}
		
		private function onMouseUp(e:MouseEvent):void 
		{
			down = false;
			delta.x = 0;
			delta.y = 0;
		}
		
		private function onMouseDown(e:MouseEvent):void 
		{
			down = true;
			position.x = _display.mouseX;
			position.y = _display.mouseY;
			stagePosition.x = e.stageX;
			stagePosition.y = e.stageY;
			delta.x = 0;
			delta.y = 0;
		}
		
		private function onMouseMove(e:MouseEvent):void 
		{
			//trace(this, "Mouse move", _display.mouseX, _display.mouseY);
			position.x = _display.mouseX;
			position.y = _display.mouseY;
			var oldStageX:Number = stagePosition.x;
			var oldStageY:Number = stagePosition.y;
			stagePosition.x = e.stageX;
			stagePosition.y = e.stageY;
			delta.x = stagePosition.x - oldStageX;
			delta.y = stagePosition.y - oldStageY;
		
		}
		
		public function get container() : DisplayObject { return _display; }
		
		
		
	}

}