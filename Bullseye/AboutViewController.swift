//
//  AboutViewController.swift
//  Bullseye
//
//  Created by Risan Bagja Pradana  on 30092018.
//  Copyright © 2018 Risan Bagja Pradana . All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let htmlPath = Bundle.main.path(forResource: "About", ofType: "html") {
            let htmlUrl = URL(fileURLWithPath: htmlPath)
            let htmlUrlRequest = URLRequest(url: htmlUrl)
            webView.load(htmlUrlRequest)
        }
        
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
