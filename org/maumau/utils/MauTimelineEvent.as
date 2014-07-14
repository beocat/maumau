package org.maumau.utils 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauTimelineEvent extends Event 
	{
		public static const LABEL	: String = "label";
		public static const END		: String = "end";
		
		public var mc:MovieClip;
		public var label:String;
		public var prevLabel:String;
		
		public function MauTimelineEvent(type:String, mc:MovieClip, label:String = "", prevLabel:String = "") 
		{
			super(type);
			this.mc = mc;
			this.label = label;
			this.prevLabel = prevLabel;
		}
		
		override public function toString():String 
		{
			return super.toString();
		}
		
		override public function clone():Event 
		{
			return super.clone();
		}
		
	}

}