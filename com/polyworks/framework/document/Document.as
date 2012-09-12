//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 Selectable Media
// 
////////////////////////////////////////////////////////////////////////////////

package com.polyworks.framework.document {
	import flash.display.Sprite;
	import com.polyworks.framework.document.IDocument;
	import flash.events.Event;
	
	public class Document extends Sprite implements IDocument {
	//Vars+++++++++
		//Read Write
		private var _testing:Boolean;
		private var _config:Object;
		
		/*
		private var _model:*;
		private var _eventCenter:*;
		private var _controller:*;
		private var _viewList:*;
		*/
		//Read
		
		//Private
		
	//+++++++++++++
		
	//Get Set++++++
		//Read Write
		public function get testing():Boolean { 
			return _testing; 
		};
		public function set testing( value:Boolean ):void {
			if ( value !== _testing ){
				_testing = value;
			};
		}
		public function get config():Object { 
			return _config; 
		};
		public function set config( value:Object ):void {
			if ( value !== _config ){
				_config = value;
			};
		};
		
		public function get model():* { 
			return null; 
		};

		public function get eventCenter():* { 
			return null; 
		};
		
		public function get controller():* { 
			return null; 
		};

		public function get viewList():* { 
			return null; 
		};
		
		//Read
		
	//+++++++++++++
		
	//Constructor++
		public function Document():void {
			//VVVVVV gets changed in sub class VVVVVV
			//trace( '---------\nMade for you on: 10.27.2011 11:13' );
			//trace( 'and the ' + this + ' document class hopes you\'re well.\n---------\n' );
			
			if( _testing ){
				testInit();
			};
		};
	//+++++++++++++
		public function init():void {
			
		};
		
		public function startListening():void {
			
		};
		
		public function stopListening():void {
			
		};
		
		public function build():void {
			
		};
		
		public function testInit():void {
			
		};
		
		public function externalInit( config:Object ):void {
			_config = config;
		};
		
		public function externalCommand( command:String, data:Object = null ):void {
			executeCommand( command, data );
		};
		
		public function executeCommand( command:String, data:Object = null ):void {
			controller.getCommand( command ).directExecute( data );
		};
		
		public function kill():void {
			
		};
		
		public function reset():void {
			
		};
		
	//++++++++++++++++++++++
	};
};