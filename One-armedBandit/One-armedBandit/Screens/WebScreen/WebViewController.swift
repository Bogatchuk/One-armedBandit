//
//  WebViewController.swift
//  One-armedBandit
//
//  Created by Bogatchuk Roman on 6/8/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
 // private var webView: WKWebView!
  @IBOutlet weak var webView: WKWebView!
  private let url = URL(string: "https://html5test.com/")!
  override func viewDidLoad() {
    super.viewDidLoad()
//    webView = WKWebView()
//    view = webView
    
    let request = URLRequest(url: url)
    webView.load(request)
    //для хождения по истории жестами
    webView.allowsBackForwardNavigationGestures = true
    
  }
  @IBAction func resetButtonClicked(_ sender: UIButton) {
    UserDefaults.standard.removeObject(forKey: "Allow")
  }
}
