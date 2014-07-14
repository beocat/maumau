package org.maumau.scene 
{
	import flash.display.DisplayObjectContainer;
	import com.greensock.TweenLite;
	
	/**
	 * ...
	 * @author Magnus Poppel
	 */
	public class MauSceneManager extends DisplayObjectContainer 
	{
		//Transitions
		public static const FADEINOUT:String = "fade";
		
		private static var _instance:MauSceneManager;
		private static var allow_instantiation:Boolean;
		
		private var _inTransition:Boolean;
		
		private var _scene:MauScene;
		private var _nextScene:MauScene;
		
		public function MauSceneManager() 
		{
			if (!allow_instantiation)
			{
				throw new Error("Error: Instatiation failed. Please use SceneManager.instnce instead.");
			}
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		public static function instance() : MauSceneManager
		{
			if (_instance == null)
			{
				allow_instantiation = true;
				_instance = new MauSceneManager();
				allow_instantiation = false;
			}
			return _instance;
		}
		
		private function onAddedToStage(e:Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.addEventListener(MouseEvent.CLICK, onMouseClick, false, 0, true);
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		public function gotoScene(nextScene:MauScene, transition:MauSceneTransition = null) : void
		{
			if (_scene != null)
			{
				_scene.willTransitionOut();
			}
			_nextScene = nextScene;
			_nextScene.willTransitionIn();
			addChild(_nextScene);
			if (_scene != null)
			{
				if (transition == null)
				{
					var trans:MauSceneTransition = new MauSceneTransitionInstant();
					trans.runTransition(_scene, _nextScene);
				}
				else
				{
					transition.runTransition(_scene, _nextScene);
				}
			}
			else
			{
				onTransitionEnd();
			}
		}
		
		private function onTransitionEnd()
		{
			if (_scene != null)
			{
				_scene.didTransitionOut();
				removeChild(_scene);
			}
			_scene = _nextScene;
			addChild(_scene);
			stage.focus = _scene;
			_scene.didTransitionIn();
		}
		
		private function onMouseClick(e:MouseEvent) : void
		{
			stage.focus = _scene;
		}
		
		public function getScene() : MauScene
		{
			return _scene;
		}
		
		private function update(e:Event) : void
		{
			var dt:Number = 1;
			_scene.update(dt);
		}
		
	}

}