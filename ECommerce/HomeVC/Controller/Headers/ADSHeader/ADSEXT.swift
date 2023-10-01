//
//  ADSEXT.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 01/07/1402 AP.
//

import UIKit
extension AdsCollectionReusableView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let adsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ADSCollectionViewCell", for: indexPath) as? ADSCollectionViewCell else {
            return UICollectionViewCell()
        }
        adsCell.adsImg.image = UIImage(named: list[indexPath.row])

        return adsCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNext), userInfo: nil, repeats: true)
    }

    @objc func moveToNext(){
        if currentIndex < pageControl.numberOfPages - 1
        {
            currentIndex += 1
        }
        else{
            currentIndex = 0
        }
        pageControl.currentPage = currentIndex
      ADSCollection.scrollToItem(at: IndexPath(item: currentIndex, section: 0) , at: .centeredHorizontally, animated: true)
       
        
    }
    
}
