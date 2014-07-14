package org.maumau.utils 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauTimelineWatcher extends EventDispatcher
	{
		private var _mcs:Dictionary;
		private var _enterFrameDispatcher:DisplayObjectContainer;
		
		public function MauTimelineWatcher(enterFrameDispatcher:DisplayObjectContainer = null)
		{
			super();
			_mcs = new Dictionary();
			_enterFrameDispatcher = enterFrameDispatcher;
			if (_enterFrameDispatcher != null) {
				_enterFrameDispatcher.addEventListener(Event.ENTER_FRAME, this.onEnterFrame, false, 0, true);
				//trace(this, _enterFrameDispatcher, _enterFrameDispatcher.hasEventListener(Event.ENTER_FRAME));
			}
		}
		
		public function addMovieClip(mc:MovieClip) : void
		{
			_mcs[mc] = new MauTimelineData(mc.currentLabel, mc.currentFrame);
		}
		
		public function removeMovieClip(mc:MovieClip) : void
		{
			if (_mcs[mc]) {
				_mcs[mc] = null;
				delete _mcs[mc];
			}
		}
		
		public function dispose() : void
		{
			for (var o:Object in _mcs) {
				_mcs[o] = null;
				o = null;
			}
			if (_enterFrameDispatcher != null) {
				_enterFrameDispatcher.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		public function onEnterFrame(e:Event) : void
		{
			watchTimelines();
		}
		
		public function manualUpdate() : void
		{
			watchTimelines();
		}
		
		private function watchTimelines() : void
		{
			var mc:MovieClip;
			var data:MauTimelineData;
			for (var o:Object in _mcs) {
				mc = o as MovieClip;
				data = _mcs[mc];
				if (mc != null && data != null && mc.currentFrame != data.frame) {
					data.frame = mc.currentFrame;
					if (data.frame == mc.totalFrames) {
						dispatchEvent(new MauTimelineEvent(MauTimelineEvent.END, mc));
					}
					if (mc.currentLabel != data.label) {
						dispatchEvent(new MauTimelineEvent(MauTimelineEvent.LABEL, mc, mc.currentLabel, data.label));
						data.label = mc.currentLabel;
					}
				}
			}
		}
		
	}

}