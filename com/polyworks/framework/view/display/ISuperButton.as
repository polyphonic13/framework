//AS3///////////////////////////////////////////////////////////////////////////
// 
// 
// 
////////////////////////////////////////////////////////////////////////////////

package com.polyworks.framework.view.display {
	import com.polyworks.framework.view.display.ButtonParams;
	import com.polyworks.framework.view.IView;
	
	public interface ISuperButton extends IView {
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		function activate():void;
		function select():void;
		function deselect():void;
		function highlight():void;
		function dehighlight():void;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		function get buttonParams():ButtonParams;
		function set buttonParams( value:ButtonParams ):void;
		
		
		
		
	//+++++++++++++++++++++
	};

};

