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
		
		self.session = LightSession(prefs: prefs)
	}
}
