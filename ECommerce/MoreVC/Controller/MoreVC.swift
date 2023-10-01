//
//  MoreVC.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 03/07/1402 AP.
//

import UIKit

class MoreVC: UIViewController {

    @IBOutlet weak var createAccount: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createAccount(_ sender: Any) {
        let storyboard = UIStoryboard(name: "LogIn", bundle: nil)
        let logVC = storyboard.instantiateViewController(withIdentifier: "LogIn")
        logVC.modalPresentationStyle = .popover
        self.present(logVC, animated: true)
    }
}
