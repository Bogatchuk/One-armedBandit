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
  
  func getData(){
    guard let url = URL(string:"https://api.myjson.com/bins/w6e65") else {return}
    
    request(url, method: .get).validate().responseJSON { (response) in
      switch response.result {
      case .success(let value):
        var json =  value as? [String: Bool]
        guard let result = json?["isAdmin"] else {return}
        UserDefaults.standard.set(result, forKey: "Allow")
      case .failure(let error):
        print(error)
      }
    }
  }
  
  
  //
  //   func getData(url: URL){
  //
  //    let session = URLSession.shared
  //    session.dataTask(with: url) { (data, response, error) in
  //      guard let data = data else {return}
  //
  //      do {
  //        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Bool]
  //        guard let result = json?["isAdmin"] else {return}
  //        UserDefaults.standard.set(result, forKey: "Allow")
  //
  //      } catch {
  //        print(error)
  //      }
  //      }.resume()
  //  }
  
}


