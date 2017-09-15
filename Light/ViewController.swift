//
//  ViewController.swift
//  Light
//
//  Created by vgm on 9/9/17.
//
//

import UIKit
import WebKit
import SwiftMatrixSDK


class ViewController: UIViewController {

	@IBOutlet weak var conversation: UIWebView!
	
	var session: LightSession?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		var url = URL(fileURLWithPath: Bundle.main.path(forResource: "chat", ofType: "html")!)
		
		//var url = NSURL(string: "http://www.google.com")
		
		var request = URLRequest(url: url)
		
		conversation.loadRequest(request)
//		let scrollView = conversation.frameView.documentView.enclosingScrollView!
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

