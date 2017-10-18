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
	var nick: String
	
	override init(prefs: [String:String])
	{
		nick = prefs["nick"] ?? "User"
		
		super.init(prefs: prefs)
		
		// read prefs
		let host = prefs["host"] ?? "localhost"
		let port = Int(prefs["port"] ?? "55225")!

		
		// initiate connection
		connect(host: host, port: port, delegate: self)
	}
	
	static func defaultConfig() -> String
	{
		return "host: 127.0.0.1\nport: 55225\nnick: User"
	}
	
	// performs a simple tcp connection
	func connect(host: String, port: Int, delegate: StreamDelegate)
	{

		Stream.getStreamsToHost(withName: host, port: port, inputStream: &super.inputStream, outputStream: &super.outputStream)
		
		// set delegates and schedule output stream on the main run thread
		// (see: http://stackoverflow.com/a/28717153 )
		super.inputStream!.delegate = self
			super.inputStream!.schedule(in: .main, forMode: RunLoopMode.defaultRunLoopMode)

		// attempt to open streams, when done the delegate's sync's method is invoked
		super.outputStream!.open()
		super.inputStream!.open()
		
	}
	
	override func textEntered(msg: String) {
		// attach nick for turtle protocol
		let nickMsg = self.nick + ": " + msg
		
		// actually send message
		send(target: "", message: nickMsg)
		
		// update UI
		super.view.message(side: "r", msg: msg)
	}
	
	func recvText()
	{
		// start a new thread to listen for incoming text
		DispatchQueue.global(qos: .userInitiated).async
		{
			// create receving buffer (caps at 10KB at a time)
			var buffer = [UInt8](repeating: 0, count: 10000)
			
			// read from socket
			var bytesRead:Int = self.inputStream!.read(&buffer, maxLength: 30)
			
			// TODO: record number of clients
			
			// loop forever, so after receving some text, more can be received
			while (true) {
				
				// read from socket
				bytesRead = self.inputStream!.read(&buffer, maxLength: 10000)

				// append it to the receiving view controller
				var content = NSString(bytes: buffer,  length: bytesRead, encoding: String.Encoding.utf8.rawValue) as! String
		//				content = content.substring(from: content.indexOf(" ")!)
				super.view.message(side: "l", msg: content.substring(from: (content.range(of: "0m")?.upperBound)!))
				
			}
		}
	}
	
	func send(target: String, message: String)
	{
		// must be cast to a byte array to sendh
		let bytes: [UInt8] = Array(message.utf8)
		outputStream!.write(bytes, maxLength: bytes.count)
	}
	
	override func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
		
		switch eventCode {
		case Stream.Event.endEncountered:
			Swift.print("error\n")
			break
		case Stream.Event.errorOccurred:
			Swift.print("error\n")

			break
		case Stream.Event.openCompleted:
			Swift.print("Connection successful!\n")
			
			
			// run on the main thread
			OperationQueue.main.addOperation {
				
				self.send(target: "", message: self.nick)
				
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
