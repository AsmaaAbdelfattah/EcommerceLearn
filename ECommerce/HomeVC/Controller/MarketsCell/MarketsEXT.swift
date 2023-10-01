//
//  MarketsEXT.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit
import SDWebImage
extension MarketsCV: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return markets.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let martketsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketCVCell", for: indexPath) as? MarketCVCell else{
            return UICollectionViewCell()
        }
        martketsCell.shopNameLabel.text = markets[indexPath.row].marketName
        martketsCell.shopTypeLabel.text = markets[indexPath.row].marketType
        martketsCell.timeLabel.text = markets[indexPath.row].marketTime
        martketsCell.shopImg.sd_setImage(with: URL(string: markets[indexPath.row].marketImg), placeholderImage: UIImage(named: "search"))
      //  martketsCell.shopImg.image = UIImage(named: markets[indexPath.row].marketImg)
        return martketsCell
    }
}
