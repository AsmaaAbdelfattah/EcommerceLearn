//
//  LoginViewModel.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 06/07/1402 AP.
//

import Foundation
import RxSwift
struct LoginViewModel{
    var userName = BehaviorSubject<String>(value: "starting value")
    var userPhoneNo = BehaviorSubject<String>(value: "starting value")
    var userEmail = BehaviorSubject<String>(value: "starting value")
    var isValid: Observable<Bool>{
        return Observable.combineLatest(userName.asObservable(), userPhoneNo.asObservable(), userEmail.asObservable()){
            name , phone , email in
            name.count >= 3 &&  phone.count == 11 &&
            email.contains("@")
        }
    }
}
