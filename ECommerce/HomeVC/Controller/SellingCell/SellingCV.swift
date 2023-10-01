//
//  SellingCV.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit

class SellingCV: UICollectionViewCell {
    
    @IBOutlet weak var sellingCV: UICollectionView!{
        didSet{
            sellingCV.delegate = self
            sellingCV.dataSource = self
            sellingCV.register(UINib(nibName: "\(ProductCVCell.self)", bundle: nil), forCellWithReuseIdentifier: "ProductCVCell")
        }
    }
}
