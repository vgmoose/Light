//
//  TurtleSession.swift
//  Light
//
//  Created by vgm on 9/15/17.
//
//

import Foundation

class TurtleSession : LightSession
{
	override init(prefs: [String:String])
	{
		super.init(prefs: prefs)
		
		// read prefs
		let host = prefs["host"] ?? "localhost"
		let port = Int(prefs["port"] ?? "55225")!
		let nick = prefs["nick"] ?? "User"
		
		// initiate connection
		connect(host: host, port: port, delegate: self)
	}
	
	// performs a simple tcp connection
	func connect(host: String, port: Int, delegate: StreamDelegate)
	{
		// start a new thread to listen for incoming text
		DispatchQueue.global(qos: .userInitiated).async
		{

			Stream.getStreamsToHost(withName: host, port: port, inputStream: &super.inputStream, outputStream: &super.outputStream)
			
			// set delegates and schedule output stream on the main run thread
			// (see: http://stackoverflow.com/a/28717153 )
			super.inputStream!.delegate = self
//			super.inputStream!.schedule(in: .main, forMode: RunLoopMode.defaultRunLoopMode)

			// attempt to open streams, when done the delegate's sync's method is invoked
			super.outputStream!.open()
			super.inputStream!.open()
			
		}
	}
	
	func recvText()
	{
		// loop forever, so after receving some text, more can be received
		while (true) {
			
			// create receving buffer (caps at 10KB at a time)
			var buffer = [UInt8](repeating: 0, count: 10000)
			
			// read from socket
			let bytesRead:Int = self.inputStream!.read(&buffer, maxLength: 10000)
			
//			// if it's disconnected, exit this loop
//			if (!self.connected || bytesRead <= 0) {
//				return
//			}
//			
			// append it to the receiving view controller
			
			
		}
	}
	
	override func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
		
		switch eventCode {
		case Stream.Event.endEncountered:
			break
		case Stream.Event.errorOccurred:
			break
		case Stream.Event.openCompleted:
//			Swift.print("Connection successful!\n")
			
			// run on the main thread
			OperationQueue.main.addOperation {
				
				// start receiving loop
				self.recvText()
				
			}
			break
		case Stream.Event.hasBytesAvailable:
			//            log("input: HasBytesAvailable")
			break
		default:
			break
		}
	}
}
