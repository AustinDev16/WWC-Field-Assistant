//
//  FieldNote+CoreDataProperties.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/31/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData


extension FieldNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FieldNote> {
        return NSFetchRequest<FieldNote>(entityName: "FieldNote");
    }

    @NSManaged public var date: NSDate
    @NSManaged public var note: String
    @NSManaged public var well: Well

}
