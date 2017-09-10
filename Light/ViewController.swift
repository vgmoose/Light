//
//  ViewController.swift
//  Light
//
//  Created by vgm on 9/9/17.
//
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		//load a file
		var testHTML = NSBundle.mainBundle().pathForResource("chat", ofType: "html")
		var contents = NSString(contentsOfFile: testHTML!, encoding: NSUTF8StringEncoding, error: nil)
		var baseUrl = NSURL(fileURLWithPath: testHTML!) //for load css file
		
		conversation.loadHTMLString(contents, baseURL: baseUrl)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

