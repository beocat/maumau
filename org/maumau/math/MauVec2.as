package org.maumau.math 
{
	import flash.geom.Matrix;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauVec2 
	{
		public function MauVec2() 
		{
		}
		
		static public function lengthSquared(vec:Point) : Number
		{
			return vec.x * vec.x + vec.y * vec.y;
		}
		
		static public function dot(vec1:Point, vec2:Point) : Number
		{
			return vec1.x * vec2.x + vec1.y * vec2.y;
		}
		
		static public function rotateByDegrees(vec:Point, deg:Number) : Point
		{
			var radians:Number = deg * Math.PI / 180.0;
			var sine:Number = Math.sin(radians);
            var cos:Number = Math.cos(radians);
			return new Point(vec.x * cos - vec.y * sine, vec.x * sine + vec.y * cos);
		}
		
		static public function reflectOnAxis(inCommingVec:Point, xAxis:Boolean) : Point
		{
			return xAxis ? new Point(inCommingVec.x, -inCommingVec.y) : new Point( -inCommingVec.x, inCommingVec.y);
		}
		
		static public function angleInDegrees(vec1:Point, vec2:Point) : Number
		{
			return angleInRadians(vec1, vec2) * 180 / Math.PI;
		}

		static public function angleInRadians(vec1:Point, vec2:Point) : Number
		{
			return Math.acos( dot(vec1, vec2) / (vec1.length * vec2.length) );
		}
		
		static public function signedAngleInDegrees(vec1:Point, vec2:Point) : Number
		{
			return signedAngleInRadians(vec1, vec2) * 180 / Math.PI;
		}
		
		static public function signedAngleInRadians(vec1:Point, vec2:Point) : Number
		{
			var v1:Point = vec1.clone();
			var v2:Point = vec2.clone();
			v1.normalize(1.0);
			v2.normalize(1.0);
			return Math.atan2(v1.x * v2.y - v1.y * v2.x, dot(v1, v2));
		}
		
		static public function createVector(to:Point, from:Point) : Point
		{
			return new Point(to.x - from.x, to.y - from.y);
		}
		
	}

}