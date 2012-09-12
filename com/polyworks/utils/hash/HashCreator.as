//
//  HashCreator
//
//  Created by paul hoover on 2010-07-29.
//  Copyright (c) 2010 factor13. All rights reserved.
//
package com.polyworks.utils.hash
{
	import flash.utils.ByteArray;
	
	import com.hurlant.crypto.hash.SHA256;
	import com.hurlant.util.Hex;
	
	public class HashCreator 
	{
		public function HashCreator(){}
		
		public static function sha256(txt:String, key:String = ""):String
		{
			var ba:ByteArray = Hex.toArray(Hex.fromString(txt + key));
			var s256:SHA256 = new SHA256(); 
			var ra:ByteArray = s256.hash(ba); 
			return Hex.fromArray(ra);
		}
	}
}