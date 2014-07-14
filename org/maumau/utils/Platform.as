package  org.maumau.utils
{
	import flash.system.Capabilities;
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class Platform 
	{
		public static const IOS					: uint = 1;
		public static const ANDROID				: uint = 2;
		public static const WEB					: uint = 3;
		
		private static var _platform			: uint = 0;
		
		/**
		 * Get the platform. Use static consts to convert uint to platform
		 */
		public static function get platform() : uint
		{
			if (_platform == 0) {
				_platform = WEB;
				if (Capabilities.version.toLowerCase().indexOf("ios") != -1) {
					_platform = IOS;
				}
				else if (Capabilities.version.toLowerCase().indexOf("and") != -1) {
					_platform = ANDROID;
				}
			}
			return _platform;
		}
		
		public static function isIOS() : Boolean
		{
			return platform == Platform.IOS;
		}
		
		public static function isAndroid() : Boolean
		{
			return platform == Platform.ANDROID; 
		}
		
		public static function isWeb() : Boolean
		{
			return platform == Platform.WEB;
		}
		
	}

}