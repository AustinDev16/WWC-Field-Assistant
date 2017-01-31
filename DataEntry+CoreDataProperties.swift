//
//  DataEntry+CoreDataProperties.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/31/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData


extension DataEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataEntry> {
        return NSFetchRequest<DataEntry>(entityName: "DataEntry");
    }

    @NSManaged public var dateCollected: NSDate
    @NSManaged public var fieldNotes: String?
    @NSManaged public var make: String
    @NSManaged public var meterReading: Double
    @NSManaged public var model: String
    @NSManaged public var multiplier: String
    @NSManaged public var serialNumber: String
    @NSManaged public var unitTypeString: String
    @NSManaged public var well: Well

}
