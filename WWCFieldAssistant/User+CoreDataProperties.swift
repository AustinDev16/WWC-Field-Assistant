//
//  User+CoreDataProperties.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var password: String
    @NSManaged public var userName: String
    @NSManaged public var uuid: String

}
