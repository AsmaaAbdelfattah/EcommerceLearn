//
//  HomeEXT.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit

extension HomeVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 0
        default:
            return 1
        }
   
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCV", for: indexPath) as? CategoriesCV else{
                return UICollectionViewCell()
            }
            return categoryCell
        case 1:
            guard let marketCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketsCV", for: indexPath) as? MarketsCV else {
                return UICollectionViewCell()
            }
            marketCell.renderMarkets()
        //    marketCell.marketsCollection.reloadData()
            return marketCell

        case 3:
            guard let sellingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SellingCV", for: indexPath) as? SellingCV else {
                return UICollectionViewCell()
            }

            return sellingCell

        case 4:
            guard let productsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCV", for: indexPath) as? ProductsCV else {
                return UICollectionViewCell()
            }

            return productsCell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section{
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HeaderCollectionReusableView.self)", for: indexPath) as! HeaderCollectionReusableView
            header.HeaderLabel.text = sectionTitles[indexPath.section]
            header.allLabel.isHidden = true
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(AdsCollectionReusableView.self)", for: indexPath) as! AdsCollectionReusableView
            header.startTimer()
         
            return header
        default:
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HeaderCollectionReusableView.self)", for: indexPath) as! HeaderCollectionReusableView
            header.HeaderLabel.text = sectionTitles[indexPath.section]
            header.allLabel.isHidden = false
            return header
        }
  
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section{
        case 2:
            return CGSize(width: collectionView.frame.width , height: 200)
        default:
            return CGSize(width: collectionView.frame.width , height: 65)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section{
        case 0:
            return CGSize(width: collectionView.frame.width, height: 50)
        case 1 :
            return CGSize(width: collectionView.frame.width, height: 270)
        case 3:
            return CGSize(width: collectionView.frame.width, height: 150)
        default:
            return CGSize(width: collectionView.frame.width, height: 150)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
    }
}
