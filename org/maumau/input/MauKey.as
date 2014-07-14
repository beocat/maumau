package org.maumau.input 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauKey 
	{
		//letters
		public static const A			:uint = 65;
		public static const B			:uint = 66;
		public static const C			:uint = 67;
		public static const D			:uint = 68;
		public static const E			:uint = 69;
		public static const F			:uint = 70;
		public static const G			:uint = 71;
		public static const H			:uint = 72;
		public static const I			:uint = 73;
		public static const J			:uint = 74;
		public static const K			:uint = 75;
		public static const L			:uint = 76;
		public static const M			:uint = 77;
		public static const N			:uint = 78;
		public static const O			:uint = 79;
		public static const P			:uint = 80;
		public static const Q			:uint = 81;
		public static const R			:uint = 82;
		public static const S			:uint = 83;
		public static const T			:uint = 84;
		public static const U			:uint = 85;
		public static const V			:uint = 86;
		public static const W			:uint = 87;
		public static const X			:uint = 88;
		public static const Y			:uint = 89;
		public static const Z			:uint = 90;
		
		//Numbers
		public static const NUMBER_0	:uint = 48;
		public static const NUMBER_1	:uint = 49;
		public static const NUMBER_2	:uint = 50;
		public static const NUMBER_3	:uint = 51;
		public static const NUMBER_4	:uint = 52;
		public static const NUMBER_5	:uint = 53;
		public static const NUMBER_6	:uint = 54;
		public static const NUMBER_7	:uint = 55;
		public static const NUMBER_8	:uint = 56;
		public static const NUMBER_9	:uint = 57;
		
		//Arrows
		public static const LEFT		:uint = 37;
		public static const UP			:uint = 38;
		public static const RIGHT		:uint = 39;
		public static const DOWN		:uint = 40;
		
		//Fs
		public static const F1			:uint = 112;
		public static const F2			:uint = 113;
		public static const F3			:uint = 114;
		public static const F4			:uint = 115;
		public static const F5			:uint = 116;
		public static const F6			:uint = 117;
		public static const F7			:uint = 118;
		public static const F8			:uint = 119;
		public static const F9			:uint = 120;
		public static const F10			:uint = 121;
		public static const F11			:uint = 122;
		public static const F12			:uint = 123;
		public static const F13			:uint = 124;
		public static const F14			:uint = 125;
		public static const F15			:uint = 126;

		//Numpad
		public static const NUMPAD_0		:uint = 96;
		public static const NUMPAD_1		:uint = 97;
		public static const NUMPAD_2		:uint = 98;
		public static const NUMPAD_3		:uint = 99;
		public static const NUMPAD_4		:uint = 100;
		public static const NUMPAD_5		:uint = 101;
		public static const NUMPAD_6		:uint = 102;
		public static const NUMPAD_7		:uint = 103;
		public static const NUMPAD_8		:uint = 104;
		public static const NUMPAD_9		:uint = 105;
		public static const NUMPAD_MULTIPLY	:uint = 106;
		public static const NUMPAD_PLUS		:uint = 107;
		public static const NUMPAD_MINUS	:uint = 109;
		public static const NUMPAD_DIVIDE	:uint = 191;
		public static const NUMPAD_PERIOD	:uint = 110;

		//Misc
		public static const BACKSPACE	:uint = 8;
		public static const TAB			:uint = 9;
		public static const ENTER		:uint = 13;
		public static const SHIFT		:uint = 16;
		public static const CONTROL		:uint = 17;
		public static const ALT			:uint = 18;
		public static const CAPSLOCK	:uint = 20;
		public static const ESCAPE		:uint = 27;
		public static const SPACE		:uint = 32;
		public static const PAGEUP		:uint = 33;
		public static const PAGEDOWN	:uint = 34;
		public static const END			:uint = 35;
		public static const HOME		:uint = 36;
		public static const INSERT		:uint = 45;
		public static const DELETE		:uint = 46;
		public static const SEMICOLON	:uint = 186;
		public static const PLUS		:uint = 187;
		public static const COMMA		:uint = 188;
		public static const MINUS		:uint = 189;
		public static const PERIOD		:uint = 190;
		public static const SLASH		:uint = 191;
		public static const GRAVE		:uint = 192;
		public static const LEFTBRACKET	:uint = 219;
		public static const BACKSLASH	:uint = 220;
		public static const RIGHTBRACKET:uint = 221;
		public static const QUOTE		:uint = 222;
		
		
		
		
		private static var dictionary:Dictionary;
		
		//Letter
		static public function isLetter(keyCode:uint) : Boolean
		{
			return keyCode >= A && keyCode <= Z;
		}
		
		//Number
		static public function isNumber(keyCode:uint) : Boolean
		{
			return keyCode >= NUMBER_0 && keyCode <= NUMBER_9;
		}
		
		//Arrow
		static public function isArrow(keyCode:uint) : Boolean
		{
			return keyCode >= LEFT && keyCode <= DOWN;
		}
		
		//Numpad number
		static public function isNumpadNumber(keyCode:uint) : Boolean
		{
			return keyCode >= NUMPAD_0 && keyCode <= NUMPAD_9;
		}
		
		//F
		static public function isFKey(keyCode:uint) : Boolean
		{
			return keyCode >= F1 && keyCode <= F12;
		}
		
		//Get string representation of key
		static public function keyName(keyCode:uint) : String
		{
			if (dictionary == null) {
				dictionary = createDictionary();
			}
			
			var str:String = dictionary[keyCode];
			if (str == null) {
				str = "Key_" + String(keyCode);
			}
			return str;
		}
		
		//Create a dictionary of string representations
		private static function createDictionary() : Dictionary
		{
			//Letters
			var i:int;
			for (i = A; i <= Z; ++i) {
				dictionary[i] = String.fromCharCode(i);
			}
			//Numbers
			for (i = NUMBER_0; i <  NUMBER_9; ++i) {
				dictionary[i] = String(i - 48);
			}
			//Fs
			for (i = F1; i <= F12; ++i) {
				dictionary[i] = F + String(i - 111);
			}
			//Numpad numbers
			for (i = NUMPAD_0; i <= NUMPAD_9; ++i ) {
				dictionary[i] = String(i - 96);
			}
			//Numpad other
			dictionary[NUMPAD_MULTIPLY] = "*";
			dictionary[NUMPAD_PLUS] 	= "+";
			dictionary[NUMPAD_MINUS] 	= "-";
			dictionary[NUMPAD_DIVIDE] 	= "/";
			dictionary[NUMPAD_PERIOD] 	= ".";
			//Arrows
			dictionary[LEFT]			= "Left";
			dictionary[RIGHT]			= "Right";
			dictionary[UP]				= "Up";
			dictionary[DOWN]			= "Down";
			
			//Misc
			dictionary[BACKSPACE]		= "Backspace";
			dictionary[TAB]				= "Tab";
			dictionary[ENTER]			= "Enter";
			dictionary[SHIFT]		 	= "Shift";
			dictionary[CONTROL]			= "Ctrl";
			dictionary[ALT]				= "Alt";
			dictionary[CAPSLOCK]	 	= "Capslock";
			dictionary[ESCAPE]			= "Escape";
			dictionary[SPACE]			= "Space";
			dictionary[PAGEUP]			= "Pageup";
			dictionary[PAGEDOWN]		= "Pagedown";
			
			dictionary[END]				= "End";
			dictionary[HOME]			= "Home";
			dictionary[INSERT]			= "Insert";
			dictionary[DELETE]			= "Delete";
			dictionary[SEMICOLON]		= ";";
			dictionary[PLUS]			= "+";
			dictionary[COMMA]			= ",";
			dictionary[MINUS]			= "-";
			dictionary[PERIOD]			= ".";
			dictionary[SLASH]			= "/";
			dictionary[GRAVE]			= "Grave";
			dictionary[LEFTBRACKET]		= "[";
			dictionary[BACKSLASH]		= "\\";
			dictionary[RIGHTBRACKET]	= "]";
			dictionary[QUOTE]			= "\"";
			
			return dictionary;
		}
	}

}