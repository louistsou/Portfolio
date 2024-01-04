//
//  Account+CoreDataProperties.swift
//  iOS Group Project
//
//  Created by Gavin josh Logronio on 11/6/2023.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var fName: String?
    @NSManaged public var lname: String?
    @NSManaged public var address: String?
    @NSManaged public var address2: String?
    @NSManaged public var city: String?
    @NSManaged public var postal: Int64
    @NSManaged public var phone: String?

}

extension Account : Identifiable {

}
