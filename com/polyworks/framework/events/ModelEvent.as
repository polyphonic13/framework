//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 Zemi
// 
////////////////////////////////////////////////////////////////////////////////

package com.polyworks.framework.events {

import flash.events.Event;

public class ModelEvent extends Event {
	//--------------------------------------
	// CLASS CONSTANTS
	//--------------------------------------
	public static const MODEL_CHANGE:String = "modelChange";
	public static const HIDE_LESS:String = "hideLessButton";
	public static const HIDE_MORE:String = "hideMoreButton";
	public static const SHOW_LESS:String = "showLessButton";
	public static const SHOW_MORE:String = "showMoreButton";
	
	//--------------------------------------
	//  CONSTRUCTOR
	//--------------------------------------
	
	public function ModelEvent( type:String, bubbles:Boolean=true, cancelable:Boolean=false ) {
		super( type, bubbles, cancelable );
	};
	
	//--------------------------------------
	//  GETTER/SETTERS
	//--------------------------------------
	
	//--------------------------------------
	//  PUBLIC METHODS
	//--------------------------------------

	override public function clone():Event {
		return new ModelEvent( type, bubbles, cancelable );
	};
	
	//--------------------------------------
	//  EVENT HANDLERS
	//--------------------------------------
	
	//--------------------------------------
	//  PRIVATE VARIABLES
	//--------------------------------------
	
	//--------------------------------------
	//  PRIVATE & PROTECTED INSTANCE METHODS
	//--------------------------------------
	
};

};

