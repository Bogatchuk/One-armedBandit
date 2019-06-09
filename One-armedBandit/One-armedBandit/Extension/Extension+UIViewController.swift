//
//  Extension+UIViewController.swift
//  One-armedBandit
//
//  Created by Bogatchuk Roman on 6/9/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
  func showAlert(with title: String, and message: String){
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true)
  }
}
