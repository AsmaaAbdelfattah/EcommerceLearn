//
//  AdsCollectionReusableView.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 01/07/1402 AP.
//

import UIKit

class AdsCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var ADSCollection: UICollectionView!{
            didSet{
                ADSCollection.dataSource = self
                ADSCollection.delegate = self
                ADSCollection.register(UINib(nibName: "\(ADSCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "ADSCollectionViewCell")
            }
    }
    @IBOutlet weak var pageControl: UIPageControl!{
        didSet{
            pageControl.numberOfPages = 3
        }
    }
    var timer : Timer?
    var currentIndex : Int = 0
    var list = ["breshka","H&M" , "zara"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
