//AS3///////////////////////////////////////////////////////////////////////////
// 
// 
// 
////////////////////////////////////////////////////////////////////////////////

package com.polyworks.framework.view.display {
 	
import flash.display.Sprite;
	public class SuperSprite extends Sprite implements ISuperSprite {
	//Vars+++++++++
		//Read Write
		private var _idNum:uint;
		
		//Read
		
		//Private
		
	//+++++++++++++
		
	//Get Set++++++
		//Read Write
		public function get idNum():uint { 
			return _idNum; 
		};
		public function set idNum( value:uint ):void {
			if ( value !== _idNum ){
				_idNum = value;
			};
		};
		
		public function get asSprite():Sprite { 
			return this as Sprite; 
		};
		
		//Read
		
	//+++++++++++++
		
	//Constructor++
		public function SuperSprite():void {
			
		};
	//+++++++++++++
		
		public function initMe():void {
			
		};
		
		public function build():void {
			
		};
		
		public function addTo( scope:Object ):void {
			scope.addChild( this );
		};
		
	//++++++++++++++++++++++
	};
};