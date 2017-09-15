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

}

