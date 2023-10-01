//
//  CategoryEXT.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit
extension CategoriesCV:UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let categoryLabelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCVCell", for: indexPath) as? CategoriesCVCell else{
            return UICollectionViewCell()
        }
        categoryLabelCell.categoryLabel.text = categories[indexPath.row]
        if indexPath.row == selectedIdx {
         //   categoryLabelCell.categoryImg.isHidden = false
          //  categoryLabelCell.categoryImg.image = UIImage(named: "watchCat")
            categoryLabelCell.categoryLabel.textColor = UIColor.white
            categoryLabelCell.categoryView.backgroundColor = UIColor.darkBlue
        }
        else {
         //   categoryLabelCell.categoryImg.isHidden = true
            categoryLabelCell.categoryLabel.textColor = UIColor.black
            categoryLabelCell.categoryView.backgroundColor = UIColor.white
        }
        return categoryLabelCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIdx = indexPath.row
        categoryCollection.reloadData()
        
    }
}
