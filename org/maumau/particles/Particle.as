package org.maumau.particles 
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class Particle 
	{
		public var velocityX	: Number;
		public var velocityY	: Number;
		public var age			: Number;
		public var lifespan		: Number;
		public var mc			: MovieClip;
		
		public function Particle(o:Object) 
		{
			this.mc = new o["mcClass"]();
			//mc.stop();
			//mc.cacheAsBitmap = true;
			this.age = 0;
		}
		
		public function reset() : void
		{
			this.age 		= 0;
			this.lifespan 	= 0;
			this.velocityX	= 0;
			this.velocityY	= 0;
		}
		
		public function dispose() : void
		{
			this.mc = null;
		}
		
	}

}