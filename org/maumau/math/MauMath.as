package org.maumau.math 
{
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauMath 
	{
		
		public function MauMath() 
		{
			
		}
		
		static public function degreesToRadians(degrees:Number) : Number
		{
			return degrees * Math.PI / 180;
		}
		
		static public function radiansToDegrees(radians:Number) : Number
		{
			return radians * 180 / Math.PI;
		}
		
	}

}