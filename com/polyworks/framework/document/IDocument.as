//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 Selectable Media
// 
////////////////////////////////////////////////////////////////////////////////

package com.polyworks.framework.document {
	import flash.events.Event;
	
	public interface IDocument {
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		function init():void;
		function startListening():void;
		function stopListening():void;
		function build():void;
		function testInit():void;
		function externalInit( config:Object ):void;
		function externalCommand( command:String, data:Object = null ):void;
		function executeCommand( command:String, data:Object = null ):void;
		function kill():void;
		function reset():void;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		function get testing():Boolean;
		function set testing( value:Boolean ):void;
		function get config():Object;
		function set config( value:Object ):void;
		function get model():*;
		function get eventCenter():*;
		function get controller():*;
		function get viewList():*;
		
	//+++++++++++++++++++++
	};

};