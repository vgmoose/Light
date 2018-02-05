//
//  MatrixSession.swift
//  Light
//
//  Created by vgm on 9/15/17.
//
//

import Foundation

class MatrixSession : LightSession
{
	var nick: String
	
	override init(prefs: [String:String])
	{
		nick = prefs["username"] ?? "username"
		
		super.init(prefs: prefs)
		
		// read prefs
		let password = prefs["password"] ?? "secretpassword"
		let home_server = prefs["home_server"] ?? "https://matrix.org"
		let identity_server = prefs["identity_server"] ?? "https://vector.im"
		
		// TODO: initiate connection
	}
	
	static func defaultConfig() -> String
	{
		return "username: username\npassword: secretpassword\nhome_server: https://matrix.org\nidentity_server: https://vector.im"
	}
	
	override func textEntered(msg: String) {
		// TODO: implement me
	}
	
}
