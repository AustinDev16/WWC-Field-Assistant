//
//  FieldPhoto+CoreDataProperties.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/31/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData


extension FieldPhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FieldPhoto> {
        return NSFetchRequest<FieldPhoto>(entityName: "FieldPhoto");
    }

    @NSManaged public var comment: String
    @NSManaged public var dateTaken: NSDate
    @NSManaged public var imageData: NSData
    @NSManaged public var name: String
    @NSManaged public var well: Well

}
