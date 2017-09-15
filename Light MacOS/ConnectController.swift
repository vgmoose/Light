//
//  ConnectController.swift
//  Light
//
//  Created by vgm on 9/15/17.
//
//

import Cocoa
import Foundation

class ConnectController : NSViewController
{
	@IBOutlet weak var proto: NSPopUpButton!
	@IBOutlet weak var data: NSTextField!
	
	var logic: ConnectLogic?
	var controller: NSWindowController?
	
	@IBAction func doConnect(_ sender: Any)
	{
		let myPrefs = parsePrefs()
		logic = ConnectLogic(proto: proto.titleOfSelectedItem!, prefs: myPrefs)

	}
	
	func parsePrefs() -> [String:String]
	{
		let prefs: [String:String] = [:]
		
		let contents = data.stringValue
		
		return prefs
	}
}
