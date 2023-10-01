//
//  CategoriesCell.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit

class CategoriesCV: UICollectionViewCell {
    let layout = UICollectionViewFlowLayout()
    @IBOutlet weak var categoryCollection: UICollectionView!{
        didSet{
            categoryCollection.dataSource = self
            categoryCollection.delegate = self
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 25
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            self.categoryCollection.collectionViewLayout = layout
      }
    }
    
   let categories = ["Watch", "Accessory","Cloth","Fourniture" ]
   var selectedIdx = 0
}
