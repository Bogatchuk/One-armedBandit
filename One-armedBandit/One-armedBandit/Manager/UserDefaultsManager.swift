//
//  UserDefaultsManager.swift
//  One-armedBandit
//
//  Created by Bogatchuk Roman on 6/9/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation
class UserDefaultsManager {
  static let shared = UserDefaultsManager()
  private init(){}
  
  func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
  }
  func removeInUserDefaults(key: String){
    UserDefaults.standard.removeObject(forKey: key)
  }
}
