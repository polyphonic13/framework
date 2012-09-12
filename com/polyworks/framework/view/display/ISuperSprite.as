//AS3///////////////////////////////////////////////////////////////////////////
// 
// 
// 
////////////////////////////////////////////////////////////////////////////////

package com.polyworks.framework.view.display {
	
import flash.display.Sprite;
	public interface ISuperSprite {
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		//Mine
		function initMe():void;
		function build():void;
		function addTo( scope:Object ):void;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		function get idNum():uint;
		function set idNum( value:uint ):void;
		function get asSprite():Sprite;
		
		
	//+++++++++++++++++++++
	};

};