//
//  Accounts.swift
//  iOS Group Project
//
//  Created by Gavin josh Logronio on 13/5/2023.
//

import UIKit

class Account {
    static var shared = Account()
    
    var email: String?
    var password: String?
    var fName: String?
    var lName: String?
    var address: String?
    var city: String?
    var address2: String?
    var postal: Int?
    var phone: Int?
   
    
    var mealSelect: [Meal] = []
    
    private init (){}
//    init (email: String, password: String, fName: String, lName: String, address: String, city: String, postal: Int, phone: Int){
//        self.email = email
//        self.password = password
//        self.fName = fName
//        self.lName = lName
//        self.address = address
//        self.city = city
//        self.postal = postal
//        self.phone = phone
//    }
}


//var Accounts: [Account] = []
//
//func addAccount(Email: String, Password: String, FName: String, LName: String, Address: String, City: String, Postal: Int, Phone: Int){
//    let newAccount = Account()
//    Accounts.append(newAccount)
//    
//}


