package org.maumau.math 
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauPrimitiveTest
	{
		
		public function MauPrimitiveTest()
		{
		}
		
		///////////////////////////////////////////////////////////////////////////////////
		//
		//	Circles
		//
		///////////////////////////////////////////////////////////////////////////////////
		static public function circle_vs_circle(c1x:Number, c1y:Number, c1Radius:Number,
												c2x:Number, c2y:Number, c2Radius:Number) : Boolean
		{
			var dist:Number = new Point(c1x - c2x, c1y - c2y).length;
			return dist <= c1Radius + c2Radius;
		}
		
		static public function circle_vs_aabb(cx:Number, cy:Number, cRadius:Number,
											 rx1:Number, ry1:Number, rx2:Number, ry2:Number) : Boolean
		{
			//The closest point of the center of the circle in the rectangle
			var closestPoint:Point = new Point(cx, cy);
			
			closestPoint.x = (closestPoint.x < rx1) ? rx1 : closestPoint.x;
			closestPoint.x = (closestPoint.x > rx2) ? rx2 : closestPoint.x;
			
			closestPoint.y = (closestPoint.y < ry1) ? ry1 : closestPoint.y;
			closestPoint.y = (closestPoint.y > ry2) ? ry2 : closestPoint.y;
			
			return closestPoint.subtract(new Point(cx, cy)).length <= cRadius;
		}
		
		static public function circle_vs_obb(cx:Number, cy:Number, cRadius:Number) : Boolean
		{
			return false;
		}
		
		///////////////////////////////////////////////////////////////////////////////////
		//
		//	AABB's
		//
		///////////////////////////////////////////////////////////////////////////////////
		static public function aabb_vs_aabb(r1x1, r1y1, r1x2, r1y2, r2x1, r2y1, r2x2, r2y2) : Boolean
		{
			return (r1x1 < r2x2 && r1x2 > r2x1) && (r1y1 < r2y2 && r1y2 > r2y1);
		}
		
		static public function aabb_vs_obb() : Boolean
		{
			//convert aabb input to obb input and run obb_vs_obb
			//return obb_vs_obb();
			return false;
		}
		
		///////////////////////////////////////////////////////////////////////////////////
		//
		//	OBB's
		//
		///////////////////////////////////////////////////////////////////////////////////
		static public function obb_vs_obb(allCorners:Vector.<Point>, allCenters:Vector.<Point>) : Boolean
		{
			var dividingAxisFound:Boolean = false;
			var a:Point;
			var b:Point;
			var baX:Number;
			var baY:Number;
			var o:Point;
			for (var i:int = 0; i < 8; ++i)
			{
				var c1:int = i;
				var c2:int = (i + 1) % 4 + 4 * Math.floor(i / 4);
				a = allCorners[c1];
				b = allCorners[c2];
				baX = b.x - a.x;
				baY = b.y - a.y;
				var start:int = 4 * (1 - Math.floor(i / 4));
				var end:int = start + 4;
				
				var ownPoint:Point = allCenters[Math.floor(i / 4)];
				var ownCrossAboveZero:Boolean = ((baX) * (ownPoint.y - a.y) - (baY) * (ownPoint.x - a.x) > 0.0);
				
				for (var j:int = start; j < end; ++j )
				{
					o = allCorners[j];
					var otherCrossAboveZero:Boolean = ((baX) * (o.y - a.y) - (baY) * (o.x - a.x) > 0.0);
					if (ownCrossAboveZero == otherCrossAboveZero)
					{
						break;
					}
					else if (j == start + 3)
					{
						dividingAxisFound = true;
					}
				}
				if (dividingAxisFound)
				{
					break;
				}
			}
			
			return !dividingAxisFound;
		}
		
		///////////////////////////////////////////////////////////////////////////////////
		//
		//	Swept circles
		//
		///////////////////////////////////////////////////////////////////////////////////
		static public function movingCircle_vs_circle(c1x:Number, c1y:Number, c1Radius:Number, c1xPrevious:Number, c1yPrevious:Number,
													 c2x:Number, c2y:Number, c2Radius:Number) : Number
		{
			//Make sure the circles are not overlapping at time 0
			if (circle_vs_circle(c1xPrevious, c1yPrevious, c1Radius, c2x, c2y, c2Radius))
			{
				//trace("Hit at time 0");
				return 0.0;
			}
			var betweenCenters:Point = new Point(c1xPrevious - c2x, c1yPrevious - c2y);
			var movement:Point = new Point(c1x - c1xPrevious, c1y - c1yPrevious);
			var sumOfRadii:Number = c1Radius + c2Radius;
			//trace("Movement", movement.x, movement.y);
			//trace("between centers", betweenCenters.x, betweenCenters.y);
			var a:Number = MauVec2.dot(movement, movement);
			var b:Number = MauVec2.dot(movement, betweenCenters);
			var c:Number = MauVec2.dot(betweenCenters, betweenCenters) - sumOfRadii * sumOfRadii;
			var d:Number = b * b - a * c;
			if (d < 0)
			{
				trace("No hit");
				return -1.0;
			}
			//trace("a b c d", a, b, c, d);
			var t:Number = ((-b - Math.sqrt(d)) / a);
			t = t > 1.0 || t < 0.0 ? -1.0 : t;
			return t;
		}
		
		static public function movingCircle_vs_aabb(c1x:Number, c1y:Number, c1Radius:Number, c1xPrevious:Number, c1yPrevious:Number,
													rx1:Number, ry1:Number, rx2:Number, ry2:Number) : Number
		{
			//Husk at vi snyder. Den udvidede firkant burde have runde hjørner
			//Expand faces of rectangle with radius, and compare line segment vs expanded rectangle
			rx1 -= c1Radius;
			ry1 -= c1Radius;
			rx2 += c1Radius;
			ry2 += c1Radius;
			
			var movement:Point = new Point(c1x - c1xPrevious, c1y - c1yPrevious);
			var movementLength:Number = movement.length;
			
			var startsInAABB:Boolean = true;
			//Test on x axis
			var xt:Number = -1.0;
			if (c1xPrevious < rx1)
			{
				xt = rx1 - c1xPrevious;
				if (xt > movement.x)
					return -1.0;
				xt /= movement.x;
				startsInAABB = false;
			}
			else if (c1xPrevious > rx2) 
			{
				xt = rx2 - c1xPrevious;
				if (xt < movement.x)
					return -1.0;
				xt /= movement.x;
				startsInAABB = false;
			}
			
			//Test on y axis
			var yt:Number = -1.0;
			if (c1yPrevious < ry1)
			{
				yt = ry1 - c1yPrevious;
				if (yt > movement.y)
					return -1.0;
				yt /= movement.y;
				startsInAABB = false;
			}
			else if (c1yPrevious > ry2) 
			{
				yt = ry2 - c1yPrevious;
				if (yt < movement.y)
					return -1.0;
				yt /= movement.y;
				startsInAABB = false;
			}
			
			if(startsInAABB)
			{
				return 0.0;
			}
			var t:Number = yt > xt ? yt : xt;
			return t;
		}
		
	}

}