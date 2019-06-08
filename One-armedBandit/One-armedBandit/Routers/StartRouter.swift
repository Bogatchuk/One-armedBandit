//
//  StartRouter.swift
//  One-armedBandit
//
//  Created by Bogatchuk Roman on 6/8/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit
class Router {
  static let shared = Router()
  private init(){}
  
  private let gameViewController: UIViewController = GameViewController()
  private let webViewController: UIViewController = WebViewController()
  private let allow = UserDefaults.standard.bool(forKey: "Allow")
  //private let allow = true
  func root(_ window: inout UIWindow?){
    let frame = UIScreen.main.bounds
   
    window = UIWindow(frame: frame)
    window?.makeKeyAndVisible()
    if allow {
      window?.rootViewController = webViewController
    } else {
      window?.rootViewController = gameViewController
    }
    
  }
}

