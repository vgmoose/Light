//
//  MatrixSession.swift
//  Light
//
//  Created by vgm on 9/15/17.
//
//

import Foundation

class BonjourSession : LightSession
{
	var nick: String
	
	override init(prefs: [String:String])
	{
		nick = prefs["name"] ?? "name"
		
		super.init(prefs: prefs)
		
		// TODO: initiate connection
	}
	
	static func defaultConfig() -> String
	{
		return "name: name"
	}
	
	override func textEntered(msg: String) {
		// TODO: implement me
	}
	
}
