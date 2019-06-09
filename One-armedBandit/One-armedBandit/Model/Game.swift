//
//  GameModel.swift
//  One-armedBandit
//
//  Created by Bogatchuk Roman on 6/8/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation

class Game{
  private var gameModel:GameModel
  
  init(){
    gameModel = GameModel(money: 0, numberOne: 7, numberTwo: 7, numberThree: 7)
  }
  
  func getCell(cell: CellNumber) -> String{
    switch cell {
    case .one:
      return String(describing: gameModel.numberOne)
    case .two:
      return String(describing: gameModel.numberTwo)
    case .three:
      return String(describing: gameModel.numberThree)
    }
  }
  
  func showDeposit() -> String{
    
    return "Деньги: \(String(describing: gameModel.money))$"
  }
  func addMoney(deposit: Int)  {
    gameModel.money = deposit
    
  }
  func step(){
    gameModel.money = gameModel.money - bet
    getRandomNumber()
    if gameModel.numberOne == gameModel.numberTwo &&  gameModel.numberTwo == gameModel.numberThree {
      gameModel.money = gameModel.money + jackpot
    }else if gameModel.numberOne == gameModel.numberTwo || gameModel.numberTwo == gameModel.numberThree {
      gameModel.money = gameModel.money + win
    }
    
    
    
  }
  
  func getRandomNumber() {
    gameModel.numberOne = Int.random(in: 0...7)
    gameModel.numberTwo = Int.random(in: 0...7)
    gameModel.numberThree = Int.random(in: 0...7)
  }
  
  func isPlayingAvailable() -> Bool {
    if gameModel.money <= 0{
      return false
    }
    return true
  }

}
