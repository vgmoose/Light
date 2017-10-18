//
//  MatrixSession.swift
//  Light
//
//  Created by vgm on 9/15/17.
//
//

import Foundation

class XMPPSession : LightSession
{
	var nick: String
	
	override init(prefs: [String:String])
	{
		nick = prefs["username"] ?? "username"
		
		super.init(prefs: prefs)
		
		// read prefs
		let password = prefs["password"] ?? "secretpassword"
		let server = prefs["server"] ?? "xmpp.com"
		
		// TODO: initiate connection
	}
	
	static func defaultConfig() -> String
	{
		return "username: username\npassword: secretpassword\nserver: xmpp.com"
	}
	
	override func textEntered(msg: String) {
		// TODO: implement me
	}
	
}
