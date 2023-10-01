//
//  ProductCVCell.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit

class ProductCVCell: UICollectionViewCell {

    @IBOutlet weak var productView: UIView!{
        didSet{
            productView.layer.cornerRadius = 5
            productView.layer.borderWidth = 1
            productView
                .layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBOutlet weak var productImg: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productShop: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var cartView: UIView!{
        didSet{
            cartView.backgroundColor = UIColor.darkBlue
            cartView.layer.maskedCorners = [.layerMinXMinYCorner]
            cartView.layer.cornerRadius = 5
            
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
