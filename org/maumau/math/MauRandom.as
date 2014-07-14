package org.maumau.math 
{
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauRandom 
	{
		
		public function MauRandom()
		{
		}
		
		//Return random between 0 and 1 incl 0 excl 1
		public static function float() : Number
		{
			return Math.random();
		}
		
		static public function rangedInteger(min:int, max:int) : int
		{
			return Math.floor(min + float() * (max + 1 - min));
		}
		
		static public function rangedFloat(min:Number, max:Number) : Number
		{
			return min + float() * (max - min);
		}
		
		static public function bool(chanceForTrue:Number = 0.5) : Boolean
		{
			return float() < chanceForTrue;
		}
		
		static public function sign(chanceForPositive:Number = 0.5) : int
		{
			return float() < chanceForPositive ? 1 : -1;
		}
		
	}

}