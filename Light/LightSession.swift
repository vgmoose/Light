//
//  LightSession.swift
//  Light
//
//  Created by vgm on 9/15/17.
//
//

import Foundation
import Cocoa

class LightSession : NSObject, StreamDelegate
{
	var controller: ChatWindowController
	var view: ViewController
	
	// input and output streams for the socket
	var inputStream: InputStream?
	var outputStream: OutputStream?
	
	init(prefs: [String:String])
	{
		let storyboard = NSStoryboard(name: "Main", bundle: nil)
		self.controller = storyboard.instantiateController(withIdentifier: "ChatWindowController") as! ChatWindowController
		self.controller.showWindow(nil)
		
		self.view = self.controller.window!.contentViewController! as! ViewController
		super.init()

		self.view.session = self
	}
	
	// perform a login and obtain any info needed to persist a connection
	// to the remote server
//	func login(user: String, pass: String) { }
	
	// send a message to the remote server, where 'target' can be
	// session specific
	func send(target: String, message: String) { }
	
	// listen for any incoming messages
	func listen() { }
	
	func textEntered(msg: String) { }

	func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
		
	}
}
