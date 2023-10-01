//
//  ViewController.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit

class HomeVC: UIViewController{
    
    @IBOutlet weak var searchField: UITextField!{
        didSet{
            let leftImage = UIImageView()
            
            let image1 = UIImage(named: "search")
            leftImage.image = image1
            
            let contentView = UIView()
            contentView.addSubview(leftImage)
            
            contentView.frame = CGRectMake(0, 0, 30, 15)
            leftImage.frame = CGRectMake(10, 0, 16, 16)
            
            searchField.leftView = contentView
            searchField.leftViewMode = UITextField.ViewMode.always
            
            searchField.tintColor = UIColor.white
            searchField.layer.borderWidth = 1
            searchField.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.00).cgColor
            searchField.layer.cornerRadius = 10
            
        }
    }
    
    @IBOutlet weak var filterBtn: UIButton!{
        didSet{
            filterBtn.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var HomeCV: UICollectionView!{
        didSet{
            HomeCV.delegate = self
            HomeCV.dataSource = self
            HomeCV.register(UINib(nibName: "\(AdsCollectionReusableView.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AdsCollectionReusableView")
        }
    }
    let sectionTitles = ["Categories", "Markets" , "","Best Selling","Best Products"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
       // MarketsCV.renderView = self
    }
    
    
}
