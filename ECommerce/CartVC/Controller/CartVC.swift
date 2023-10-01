//
//  CartVC.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 01/07/1402 AP.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var Order: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func placeOrder(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Address", bundle: nil)
        let addressVC = storyboard.instantiateViewController(withIdentifier: "address")
        self.navigationController?.pushViewController(addressVC, animated: true)
    }
    
}
