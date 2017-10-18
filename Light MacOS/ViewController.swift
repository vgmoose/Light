//
//  ViewController.swift
//  Light MacOS
//
//  Created by vgm on 9/9/17.
//
//

import Cocoa
import WebKit

class ViewController: NSViewController, WebUIDelegate {

	@IBOutlet weak var conversation: WebView!
	
	var session: LightSession?
	var lastMsg: Date = Date()

	@IBOutlet weak var input: NSTextFieldCell!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		conversation.delegate = selfhttps://img1.etsystatic.com/042/0/9741230/il_570xN.634617915_ipqj.jpg
		
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
		DispatchQueue.main.async
		{
			// TODO: if a nearby, use 'a'
			// TODO: if it contains an image, use 'i'
			// TODO: support status's with 's' boolean
			
			let dom = self.conversation.mainFrame.domDocument
			let div = dom!.getElementById("chat")
			
			// escape html specific characters
			var esc_msg = msg.replacingOccurrences(of: "&", with: "&#38;")
			esc_msg = esc_msg.replacingOccurrences(of: "<", with: "&lt;")
			esc_msg = esc_msg.replacingOccurrences(of: ">", with: "&gt;")
			
			let elem = dom!.createElement(side)
			elem!.innerHTML = esc_msg
			div!.appendChild(elem)
		}


	}

}

