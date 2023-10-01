//
//  FavouriteVC.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 03/07/1402 AP.
//

import UIKit

class FavouriteVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAlert()
    }
    
    
    func userAlert(){
        let alertController = UIAlertController(title: "Alert", message: "You should log in", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "User name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Phone Number"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        let logInAction = UIAlertAction(title: "Log in", style: .default,handler: { action in
            let inputName = alertController.textFields![0].text
            print(inputName)
            let inputPhone = alertController.textFields![1].text
            print(inputPhone)
            let inputPassword = alertController.textFields![2].text
            print(inputPassword)
        })
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
         label.text = "Do not you have an account"

        alertController.view.addSubview(label)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(logInAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
