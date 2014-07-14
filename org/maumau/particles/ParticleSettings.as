package org.maumau.particles 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class ParticleSettings 
	{
		public var angle		:Number;		//Degrees
		public var angleVar		:Number;
		
		public var gravity		:Number;
		
		public var lifespan		:uint;		//Frames
		public var lifespanVar	:uint;
		
		public var startSpeed	: Number;
		public var startSpeedVar: Number;
		
		public var startRotation: Number;
		
		public var spread		: Number;
		
		public function ParticleSettings() 
		{
			angle 			= 0.0;
			angleVar 		= 0.0;
			gravity 		= 0.0;
			lifespan		= 0.0;
			lifespanVar		= 0.0;
			startSpeed		= 0.0;
			startSpeedVar	= 0.0;
			spread 			= 0.0;
			startRotation	= 0.0;
		}
		
		public function setAngle(angle:Number, variance:Number) : ParticleSettings
		{
			this.angle		= angle;
			this.angleVar	= variance;
			return this;
		}
		
		public function setStartSpeed(startSpeed:Number, variance:Number) : ParticleSettings
		{
			this.startSpeed = startSpeed;
			this.startSpeedVar = variance;
			return this;
		}
		
		public function setGravity(gravity:Number) : ParticleSettings
		{
			this.gravity	= gravity;
			return this;
		}
		
		public function setLifespan(span:uint, variance:Number) : ParticleSettings
		{
			this.lifespan		= span;
			this.lifespanVar	= variance;
			return this;
		}
		
		public function setSpread(spread:Number) : ParticleSettings
		{
			this.spread = spread;
			return this;
		}
		
		public function setRotation(rotation:Number) : ParticleSettings
		{
			this.startRotation = rotation;
			return this;
		}
		
	}

}