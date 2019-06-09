//
//  GameNetworkService.swift
//  One-armedBandit
//
//  Created by Bogatchuk Roman on 6/8/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class GameNetworkService {
  
  static let shered = GameNetworkService()
  
  private init(){}
  
  func getData(closure:@escaping (Bool) -> Void){
    guard let url = URL(string: urlServer) else {return}
    
    request(url, method: .get).validate().responseJSON { (response) in
      switch response.result {
      case .success(let value):
        var json =  value as? [String: Bool]
        guard let result = json?["allow"] else {return}
        closure(result)
      case .failure(let error):
        print(error)
      }
    }
  }
}


