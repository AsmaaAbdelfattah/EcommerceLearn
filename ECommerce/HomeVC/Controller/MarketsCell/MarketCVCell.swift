//
//  MarketCVCell.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit

class MarketCVCell: UICollectionViewCell {
    
    @IBOutlet weak var marketView: UIView!{
        didSet{
            marketView.layer.cornerRadius = 15
            marketView.layer.borderWidth = 2
            marketView.layer.borderColor = UIColor.lightGray.cgColor

        }
    }
    @IBOutlet weak var openStateView: UIView!{
        didSet{
            openStateView.layer.cornerRadius = 10
            openStateView.backgroundColor = UIColor.lightGrayBack
            openStateView.layer.borderWidth = 2
            openStateView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var detailsView: UIView!{
        didSet{
            detailsView.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var shopTypeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var stateColorView: UIView!{
        didSet{
            stateColorView.clipsToBounds = true
            stateColorView.layer.cornerRadius = stateColorView.frame.width / 2
        }
    }
    
    @IBOutlet weak var shopImg: UIImageView!
}
