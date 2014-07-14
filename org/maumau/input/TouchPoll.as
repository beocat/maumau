package org.maumau.input
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	import flash.ui.Multitouch;
	//import org.as3commons.collections.LinkedList;
	//import org.as3commons.collections.framework.ILinkedListIterator;
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class TouchPoll 
	{
		private var _display	: DisplayObject;
		//public var position 	: Point;
		public var stagePosition: Point;
		//public var delta		: Point;
		public var down			: Boolean;
		//private var _touches	: LinkedList;
		private var _touchId	: int;
		//private var _touchId	: int;
		
		
		public function TouchPoll(displayObject:DisplayObject) 
		{
			_display = displayObject;
			//_touches = new LinkedList();
			stagePosition	= new Point();
			//delta			= new Point();
			_display.addEventListener(TouchEvent.TOUCH_MOVE, 	onTouchMove,	false, 0, true);
			_display.addEventListener(TouchEvent.TOUCH_BEGIN, 	onTouchBegin,	false, 0, true);
			_display.addEventListener(TouchEvent.TOUCH_END, 	onTouchEnd,		false, 0, true);
		}
		
		private function onTouchEnd(e:TouchEvent) : void 
		{
			//_touches.remove(e.touchPointID);
			if(_touchId == e.touchPointID) {
				down = false;
			}
		}
		
		private function onTouchBegin(e:TouchEvent) : void 
		{
			down = true;
			stagePosition.x = e.stageX;
			stagePosition.y = e.stageY;
			//_touches.add(e.touchPointID);
			_touchId = e.touchPointID;
		}
		
		private function onTouchMove(e:TouchEvent) : void 
		{
			if(e.touchPointID == _touchId) {
				stagePosition.x = e.stageX;
				stagePosition.y = e.stageY;
			}
		}
		
		public function get container() : DisplayObject { return _display; }
		
		
		
	}

}