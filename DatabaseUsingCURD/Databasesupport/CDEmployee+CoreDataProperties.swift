//
//  CDEmployee+CoreDataProperties.swift
//  DatabaseUsingCURD
//
//  Created by devang bhavsar on 27/07/20.
//  Copyright © 2020 devang bhavsar. All rights reserved.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var profilePic: Data?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var email: String?
    
    func converToEmployee() -> Employee {
        return Employee(profilePic: self.profilePic, name: self.name, id: self.id, email: self.email)
    }

}
