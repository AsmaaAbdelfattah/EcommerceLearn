//
//  MarketsCV.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import UIKit
import RxSwift
class MarketsCV: UICollectionViewCell {
 
    
    @IBOutlet weak var marketsCollection: UICollectionView!{
        didSet{
            marketsCollection.delegate = self
            marketsCollection.dataSource = self
        }
    }
    let firebaseManager = FireStoreManager()
   var markets: [Market] = []

    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func renderMarkets() {
//        firebaseManager.addMarket(market: Market(marketId: 0, marketName: "Cartier", marketTime: "9AM-6PM", marketType: "Watch", marsketState: true, marketImg: "cartier"),documentName: "Cartier")
//        firebaseManager.addMarket(market: Market(marketId: 1, marketName: "Zara", marketTime: "9AM-2PM", marketType: "Cloth", marsketState: true, marketImg: "cartier"),documentName: "Zara")
//        firebaseManager.addMarket(market: Market(marketId: 2, marketName: "Breshka", marketTime: "9AM-10PM", marketType: "Watch", marsketState: true, marketImg: "cartier"),documentName: "Breshka")
        firebaseManager.getMarkets(complitionHandler: { data, error in
            self.markets = data ?? []
            self.marketsCollection.reloadData()
        })
       

    }    
}
