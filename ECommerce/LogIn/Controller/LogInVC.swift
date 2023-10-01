//
//  LogInVC.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 03/07/1402 AP.
//

import UIKit
import RxSwift
import RxCocoa
class LogInVC: UIViewController {

    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    let firebaseManager = FireStoreManager()
    let logInViewModel = LoginViewModel()
    var isExist : Bool = false
    var disposeBag = DisposeBag()
    var isLogged = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = phoneLabel.rx.text.map{$0 ?? ""}.bind(to: logInViewModel.userPhoneNo)
        _ = nameLabel.rx.text.map{$0 ?? ""}.bind(to: logInViewModel.userName)
        _ = emailLabel.rx.text.map{$0 ?? ""}.bind(to: logInViewModel.userEmail)
        logInViewModel.isValid.subscribe { [weak self]isValid in
                self?.logInBtn.isEnabled = isValid ? true : false
                self?.logInBtn.backgroundColor = isValid ? UIColor.darkBlue : UIColor.lightGray
        }.disposed(by: disposeBag)
       
        logInBtn.rx.tap.bind{
            self.CheckUserInFirebase(user: User(
                userEmail: self.emailLabel.text ?? "",
                userPhoneNo: self.phoneLabel.text ?? "",
                userName: self.nameLabel.text ?? "",
                userAddress: ""))
        
        }.disposed(by: disposeBag)
        
        registerBtn.rx.tap.bind{
            let storyboard = UIStoryboard(name: "Register", bundle: nil)
               let registerVC = storyboard.instantiateViewController(withIdentifier: "Register")
            registerVC.modalPresentationStyle = .popover
            self.present(registerVC, animated: true)
          //  self.dismiss(animated: true)
        }.disposed(by: disposeBag)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if (isLogged.value(forKey: "logIn") != nil){
            self.dismiss(animated: true)
        }

    }
 //Mark :- Login Validation
    func showAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default))
        present(alert, animated: true)
    }
    
    func CheckUserInFirebase(user: User){
        firebaseManager.getUsers { [weak self]users, error in
            if error != nil{
                print(error?.localizedDescription ?? nil)
            }
            self?.isExist = ((users?.contains{ $0.userEmail == user.userEmail }) != nil)
            if self?.isExist ?? false{
                self?.isLogged.setValue(true, forKey: "logIn")
                self?.dismiss(animated: true)
            }
            else{
                self?.showAlert(message: "You don't have an account please create one or enter valid data")
            }
        }
    }
}
