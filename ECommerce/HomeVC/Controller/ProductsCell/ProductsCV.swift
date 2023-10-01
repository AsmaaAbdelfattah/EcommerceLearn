//
//  ProductsCV.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit

class ProductsCV: UICollectionViewCell {
    
    @IBOutlet weak var productsCollection: UICollectionView!{
        didSet{
            productsCollection.delegate = self
            productsCollection.dataSource = self
            productsCollection.register(UINib(nibName: "\(ProductCVCell.self)", bundle: nil), forCellWithReuseIdentifier: "ProductCVCell")
        }
    }
}
