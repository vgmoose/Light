//
//  MatrixSession.swift
//  Light
//
//  Created by vgm on 9/15/17.
//
//

import Foundation

class EchoSession : LightSession
{
	override init(prefs: [String:String])
	{
		super.init(prefs: prefs)
	}
	
	static func defaultConfig() -> String
	{
		return "N/A: No configuration required for this protocol"
	}
	
	override func textEntered(msg: String) {
		// echo message back to self after displaying once
		super.view.message(side: "r", msg: msg)
		super.view.message(side: "l", msg: msg)
	}
	
}
