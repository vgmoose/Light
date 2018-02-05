//
//  ConnectLogic.swift
//  Light
//
//  Created by vgm on 9/15/17.
//
//

import Foundation

class ConnectLogic
{
	let session: LightSession
	
	init(proto: String, prefs: [String:String])
	{
		if proto == "Turtle"
		{
			self.session = TurtleSession(prefs: prefs)
			return
		}
		
		if proto == "Matrix"
		{
			self.session = MatrixSession(prefs: prefs)
			return
		}
		
		if proto == "IRC"
		{
			self.session = IRCSession(prefs: prefs)
			return
		}
		
		if proto == "XMPP"
		{
			self.session = XMPPSession(prefs: prefs)
			return
		}
		
		if proto == "Bonjour"
		{
			self.session = BonjourSession(prefs: prefs)
			return
		}
		
		if proto == "Echo"
		{
			self.session = EchoSession(prefs: prefs)
			return
		}
		
		self.session = LightSession(prefs: prefs)
	}
	
	static func defaultFor(_ proto: String) -> String
	{
		if proto == "Turtle"
		{
			return TurtleSession.defaultConfig()
		}
		
		if proto == "Matrix"
		{
			return MatrixSession.defaultConfig()
		}
		
		if proto == "IRC"
		{
			return IRCSession.defaultConfig()
		}
		
		if proto == "XMPP"
		{
			return XMPPSession.defaultConfig()
		}
		
		if proto == "Bonjour"
		{
			return BonjourSession.defaultConfig()
		}
		
		if proto == "Echo"
		{
			return EchoSession.defaultConfig()
		}
		
		return ""
	}
}
