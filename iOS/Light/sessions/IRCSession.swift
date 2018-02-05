//
//  MatrixSession.swift
//  Light
//
//  Created by vgm on 9/15/17.
//
//

import Foundation

class IRCSession : LightSession
{
	var nick: String
	
	override init(prefs: [String:String])
	{
		nick = prefs["nick"] ?? "nick"
		
		super.init(prefs: prefs)
		
		// read prefs
		let server = prefs["server"] ?? "irc.freenode.net"
		let room = prefs["roomidentity_server"] ?? "#wiiubru"
		
		// TODO: initiate connection
	}
	
	static func defaultConfig() -> String
	{
		return "nick: nick\nserver: irc.freenode.net\nroom: #wiiubru"
	}
	
	override func textEntered(msg: String) {
		// TODO: implement me
	}
	
}
