//
//  GameViewController.swift
//  One-armedBandit
//
//  Created by Bogatchuk Roman on 6/8/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

  @IBOutlet weak var numberOne: UILabel!
  @IBOutlet weak var numberTwo: UILabel!
  @IBOutlet weak var numberThree: UILabel!
  @IBOutlet weak var moneyLabel: UILabel!
  @IBOutlet weak var betLabel: UILabel!
  @IBOutlet weak var depositTextField: UITextField!
  @IBOutlet weak var startButton: UIButton!
  var deposit:Int!
  var game = GameModel()
  override func viewDidLoad() {
        super.viewDidLoad()
    startButton.isEnabled = false
    }
  @IBAction func depositButtonClicked(_ sender: UIButton) {
    deposit = Int(depositTextField.text!)
    game.money = deposit
    moneyLabel.text = "Деньги: \(game.money!)$"
    startButton.isEnabled = true
  }
  @IBAction func startButtonClicked(_ sender: UIButton) {
    game.step()
    
    numberOne.text = String(describing: game.numberOne!)
    numberTwo.text = String(describing: game.numberTwo!)
    numberThree.text = String(describing: game.numberThree!)
    moneyLabel.text = "Деньги: \(game.money!)$"
    
    if game.money <= 0{
      startButton.isEnabled = false
    }
  }
  @IBAction func resetButtonClick(_ sender: UIButton) {
    UserDefaults.standard.removeObject(forKey: "Allow")
  }
}
