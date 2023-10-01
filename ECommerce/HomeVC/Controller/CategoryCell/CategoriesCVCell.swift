//
//  CategoriesCVCell.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit

class CategoriesCVCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!{
        didSet{
            categoryView.layer.borderWidth = 2
            categoryView.layer.borderColor = UIColor.lightBlue.cgColor
            categoryView.layer.cornerRadius = 5
        }
    }
    


}
