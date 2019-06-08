//
//  GameModel.swift
//  One-armedBandit
//
//  Created by Bogatchuk Roman on 6/8/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation

class GameModel{
  var money:Int!
  var numberOne:Int!
  var numberTwo:Int!
  var numberThree:Int!
  init(){}
  
  
  func start() -> Int{
    return 0
  }
  
  func step(){
    money = money - 10
    getRandomNumber()
    
    if numberOne == numberTwo || numberTwo == numberThree {
      money = money + 30
    }
    
    if numberOne == numberTwo &&  numberTwo == numberThree {
      money = money + 100
    }
    
  }
  
  func getRandomNumber() {
    numberOne = Int.random(in: 0...7)
    numberTwo = Int.random(in: 0...7)
    numberThree = Int.random(in: 0...7)
  }
}
