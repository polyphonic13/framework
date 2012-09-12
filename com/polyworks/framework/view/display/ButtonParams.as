//AS3///////////////////////////////////////////////////////////////////////////
// 
// 
// 
////////////////////////////////////////////////////////////////////////////////

package com.polyworks.framework.view.display {
 	
	public class ButtonParams extends Object  {
	//Vars+++++++++
		//Read Write
		private var _coords:Object;
		private var _libNames:Object;
		private var _attributes:Object;
		
		//Read
		
		//Private
		
	//+++++++++++++
		
	//Get Set++++++
		//Read Write
		public function get libNames():Object { 
			return _libNames; 
		};
		public function set libNames( value:Object ):void {
			if ( value !== _libNames ){
				_libNames = value;
			};
		};
		
		public function get coords():Object { 
			return _coords; 
		};
		public function set coords( value:Object ):void {
			if ( value !== _coords ){
				_coords = value;
			};
		};
		
		public function get attributes():Object { 
			return _attributes; 
		};
		public function set attributes( value:Object ):void {
			if ( value !== _attributes ){
				_attributes = value;
			};
		};
		
		//Read
		
	//+++++++++++++
		
	//Constructor++
		public function ButtonParams():void {
			_coords = new Object();
			_libNames = new Object();
			_attributes = new Object();
		};
	//+++++++++++++
				
		
	//++++++++++++++++++++++
	};
};

