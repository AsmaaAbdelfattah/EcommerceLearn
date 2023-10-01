//
//  FirebaseReference.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 31/06/1402 AP.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import CoreLocation

class FireStoreManager{
    let database = Firestore.firestore()
    var markets: [Market] = []
    var locations: [Location] = []
    var users: [User] = []
    func getMarkets(complitionHandler: @escaping ( [Market]?, Error?) -> Void
    ) {
        database.collection("Markets").addSnapshotListener { QuerySnapshot, error in
            guard let documents = QuerySnapshot?.documents else{
                print(error?.localizedDescription)
                complitionHandler(nil , error)
                return
            }
            self.markets = documents.compactMap{
                return try? $0.data(as: Market.self)
            }
            complitionHandler(self.markets ,error)
        }
        
    }
        
        func addMarket(market : Market , documentName: String){
            let docRef = database.collection("Markets").document(documentName)
            docRef.setData(["marketName": market.marketName,
                            "marketType" : market.marketType,
                            "marketTime" : market.marketTime,
                            "marsketState" : market.marsketState,
                            "marketId" : market.marketId,
                            "marketImg" : market.marketImg])
        }
        
        
        func addLocation(location : CLLocation,documentName: String){
            let docRef = database.collection("Locations").document(documentName)
            docRef.setData(["longtitude": String(location.coordinate.longitude),
                            "latitude" : String(location.coordinate.latitude)
                           ])
        }
        
    func getLocations(complitionHandler: @escaping ( [Location]?, Error?) -> Void) {
            database.collection("Locations").addSnapshotListener { QuerySnapshot, error in
                guard let documents = QuerySnapshot?.documents else{
                    print(error?.localizedDescription)
                    complitionHandler(nil , error)
                    return
                }
                self.locations = documents.compactMap{
                    return try? $0.data(as: Location.self)
                }
                complitionHandler(self.locations,error)
            }
            
        }
    func getUsers(complitionHandler: @escaping ( [User]?, Error?) -> Void
    ) {
        database.collection("Users").addSnapshotListener { QuerySnapshot, error in
            guard let documents = QuerySnapshot?.documents else{
                print(error?.localizedDescription)
                complitionHandler(nil , error)
                return
            }
            self.users = documents.compactMap{
                return try? $0.data(as: User.self)
            }
            complitionHandler(self.users ,error)
        }
        
    }
    func addUser(user : User , documentName: String){
        let docRef = database.collection("Users").document(documentName)
        docRef.setData(["userName": user.userName,
                        "userEmail" : user.userEmail,
                        "userPhoneNo" : user.userPhoneNo,
                        "userAddress" : user.userAddress])
    }
}
