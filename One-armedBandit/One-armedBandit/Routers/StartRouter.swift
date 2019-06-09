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
  
//  private let gameViewController: UIViewController = GameViewController()
//  private let webViewController: UIViewController = WebViewController()
  private let allowResut = UserDefaults.standard.bool(forKey: allow)
  //private let allow = true
  
  
  func root(_ window: inout UIWindow?){
    let frame = UIScreen.main.bounds
    window = UIWindow(frame: frame)
    window?.makeKeyAndVisible()
    
    if !UserDefaultsManager.shared.isKeyPresentInUserDefaults(key: allow){
      GameNetworkService.shered.getData()
    }
    
    if !allowResut {
      let webViewController: UIViewController = WebViewController()
      window?.rootViewController = webViewController
    } else {
      let gameViewController: UIViewController = GameViewController()
      window?.rootViewController = gameViewController
    }
    
  }
  
}

