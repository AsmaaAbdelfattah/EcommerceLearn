//
//  RegisterVC.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 03/07/1402 AP.
//

import UIKit
import RxSwift
import RxCocoa
class RegisterVC: UIViewController {

    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    let firebaseManager = FireStoreManager()
    let logInViewModel = LoginViewModel()
    var isExist : Bool = false
    var disposeBag = DisposeBag()
    var islogged = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
      
        _ = phoneLabel.rx.text.map{$0 ?? ""}.bind(to: logInViewModel.userPhoneNo)
        _ = nameLabel.rx.text.map{$0 ?? ""}.bind(to: logInViewModel.userName)
        _ = emailLabel.rx.text.map{$0 ?? ""}.bind(to: logInViewModel.userEmail)
        logInViewModel.isValid.subscribe { [weak self]isValid in
           self?.registerBtn.isEnabled = isValid ? true : false
            self?.registerBtn.backgroundColor = isValid ? UIColor.darkBlue : UIColor.lightGray
                
            }.disposed(by: disposeBag)
       
        logInBtn.rx.tap.bind{
            let storyboard = UIStoryboard(name: "LogIn", bundle: nil)
               let logVC = storyboard.instantiateViewController(withIdentifier: "LogIn")
            logVC.modalPresentationStyle = .popover
            self.present(logVC, animated: true)
          //  self.dismiss(animated: true)
        }.disposed(by: disposeBag)
        
        registerBtn.rx.tap.bind{
            self.addUserInFirebase(user: User(
                userEmail: self.emailLabel.text ?? "",
                userPhoneNo: self.phoneLabel.text ?? "",
                userName: self.nameLabel.text ?? "",
                userAddress: ""))
            self.islogged.set(true, forKey: "logIn")
            self.dismiss(animated: true)
        }.disposed(by: disposeBag)
        
    }
    func showAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default))
        present(alert, animated: true)
    }
    
    func addUserInFirebase(user: User){
        firebaseManager.addUser(user: user, documentName: user.userName)
    }
}
