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
  
  weak var resultWindow: UIWindow?
  
  func root(_ window: inout UIWindow?){
    let frame = UIScreen.main.bounds
    window = UIWindow(frame: frame)
    window?.makeKeyAndVisible()
    self.resultWindow = window
    
    if !UserDefaultsManager.shared.isKeyPresentInUserDefaults(key: allow){
      GameNetworkService.shered.getData { [weak self]  result in
        UserDefaults.standard.set(result, forKey: allow)
        UserDefaults.standard.synchronize()
        
        if !result {
          self?.resultWindow?.rootViewController = WebViewController()
        } else {
          self?.resultWindow?.rootViewController = GameViewController()
        }
      }
    }
    
    let allowResut = UserDefaults.standard.bool(forKey: allow)
    
    if !allowResut {
      let webViewController: UIViewController = WebViewController()
      window?.rootViewController = webViewController
    } else {
      let gameViewController: UIViewController = GameViewController()
      window?.rootViewController = gameViewController
    }
  }
}

