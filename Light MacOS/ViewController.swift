//
//  ViewController.swift
//  Light MacOS
//
//  Created by vgm on 9/9/17.
//
//

import Cocoa
import WebKit

class ViewController: NSViewController {

	@IBOutlet weak var conversation: WebView!
	
	var session: LightSession?
	var lastMsg: Date = Date()

	@IBOutlet weak var input: NSTextFieldCell!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		var url = URL(fileURLWithPath: Bundle.main.path(forResource: "chat", ofType: "html")!)
		
		//var url = NSURL(string: "http://www.google.com")
		
		var request = URLRequest(url: url)
		
		conversation.mainFrame.load(request)
		let scrollView = conversation.mainFrame.frameView.documentView.enclosingScrollView!
		scrollView.verticalScrollElasticity = .automatic
		scrollView.horizontalScrollElasticity = .none
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
	
	@IBAction func textEntered(_ sender: Any)
	{
		let message = input.stringValue
		input.stringValue = ""
		
		session?.textEntered(msg: message)
	}
	
	// side is 'l' or 'r', depending on which side to appear on
	func message(side: String, msg: String)
	{
		// TODO: if a nearby, use 'a'
		// TODO: if it contains an image, use 'i'
		// TODO: support status's with 's' boolean
		
		let dom = conversation.mainFrame.domDocument
		let div = dom!.getElementById("chat")
		
		let elem = dom!.createElement(side)
		elem!.innerHTML = msg
		div!.appendChild(elem)
		

	}

}

