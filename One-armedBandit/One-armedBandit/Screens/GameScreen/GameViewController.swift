//
//  GameViewController.swift
//  One-armedBandit
//
//  Created by Bogatchuk Roman on 6/8/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
  
  @IBOutlet private weak var numberOne: UILabel!
  @IBOutlet private weak var numberTwo: UILabel!
  @IBOutlet private weak var numberThree: UILabel!
  @IBOutlet private weak var moneyLabel: UILabel!
  @IBOutlet private weak var betLabel: UILabel!
  @IBOutlet private weak var depositTextField: UITextField!
  @IBOutlet private weak var startButton: UIButton!
  
  private var game:Game!
  override func viewDidLoad() {
    super.viewDidLoad()
    game = Game()
    startButton.isEnabled = false
  }
  @IBAction func depositButtonClicked(_ sender: UIButton) {
    guard let deposit = Int(depositTextField.text!) else {
      showAlert(with: "Ошибка", and: "Введите целое число кратное 10!")
      return
    }
    if deposit % 10 != 0 {
      showAlert(with: "Ошибка", and: "Введите целое число кратное 10!")
      return
    }
    game.addMoney(deposit: deposit)
    moneyLabel.text = game.showDeposit()
    startButton.isEnabled = true
  }
  @IBAction func startButtonClicked(_ sender: UIButton) {
    game.step()
    
    numberOne.text = game.getCell(cell: .one)
    numberTwo.text = game.getCell(cell: .two)
    numberThree.text = game.getCell(cell: .three)
    moneyLabel.text = game.showDeposit()
    
    
    startButton.isEnabled = game.isPlayingAvailable()
    
  }
  @IBAction func resetButtonClick(_ sender: UIButton) {
    UserDefaultsManager.shared.removeInUserDefaults(key: allow)
  }
}
