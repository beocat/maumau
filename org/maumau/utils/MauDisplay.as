package org.maumau.utils 
{
	import fl.motion.Color;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.filters.ColorMatrixFilter;
	import org.maumau.math.MauVec2;
	
	
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauDisplay 
	{
		
		public function MauDisplay() 
		{
			
		}
		
		public static function localToLocal(p:Point, from:DisplayObject, to:DisplayObject) : Point
		{
			if (from == null || to == null) {
				return p;
			}
			return to.globalToLocal(from.localToGlobal(p));
		}
		
		public static function getChildByClass(parent:DisplayObjectContainer, childClass:Class) : DisplayObject
		{
			var n:int = parent.numChildren;
			var child:DisplayObject;
			for (var i:int = 0 ; i < n; ++i)
			{
				child = parent.getChildAt(i);
				if (child is childClass)
				{
					return child;
				}
			}
			return null;
		}
		
		public static function getAllChildrenByClass(parent:DisplayObjectContainer, childClass:Class) : Vector.<DisplayObject>
		{
			var children:Vector.<DisplayObject> = new Vector.<DisplayObject>();
			var n:int = parent.numChildren;
			var child:DisplayObject;
			for (var i:int = 0 ; i < n; ++i)
			{
				child = parent.getChildAt(i);
				if (child is childClass)
				{
					children.push(child);
				}
			}
			return children;
		}
		
		public static function removeFromParent(child:DisplayObject) : Boolean
		{
			if (child.parent != null)
			{
				child.parent.removeChild(child);
				return true;
			}
			return false;
		}
		
		public static function setTint(d:DisplayObject, color:uint, multiplier:Number) : void
		{
			var c:Color = new Color();
			c.setTint(color, multiplier);
			d.transform.colorTransform = c;
		}
		
		public static function removeTint(d:DisplayObject) : void
		{
			var c:Color = new Color();
			c.setTint(0x000000, 0.0);
			d.transform.colorTransform = c;
		}
		
		/*
		 * Darkness: 0 is all white, 1 is all black
		 */
		public static function greyout(d:DisplayObject, darkness:Number) : void
		{
			var greyoutMatrix:Array = 	[darkness, 0, 0, 0, 0,
										 0, darkness, 0, 0, 0,
										 0, 0, darkness, 0, 0,
										 0, 0, 0, 1, 0];
			var filter:ColorMatrixFilter = new ColorMatrixFilter(greyoutMatrix);
			d.filters = [filter];
		}
		
		public static function blackAndWhite(d:DisplayObject) : void
		{
			var rc:Number = 1/3;
			var gc:Number = 1/3;
			var bc:Number = 1/3;
			var cmf:ColorMatrixFilter = new ColorMatrixFilter([rc, gc, bc, 0, 0, rc, gc, bc, 0, 0, rc, gc, bc, 0, 0, 0, 0, 0, 1, 0]);
			d.filters = [cmf];
		}
		
			
		
		public static function removeAllFilters(d:DisplayObject) : void
		{
			d.filters = [];
		}
		
		public static function rotateAroundPoint(d:DisplayObject, degrees:Number, p:Point) : void
		{
			var dx:Number = d.x - p.x;
			var dy:Number = d.y - p.y;
			var newDxDy:Point = MauVec2.rotateByDegrees(new Point(dx, dy), degrees);
			d.rotation += degrees;
			d.x = p.x + newDxDy.x;
			d.y = p.y + newDxDy.y;
		}
	}

}