//
//  Well+CoreDataProperties.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData


extension Well {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Well> {
        return NSFetchRequest<Well>(entityName: "Well");
    }

    @NSManaged public var diversionName: String
    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var make: String
    @NSManaged public var measurementOption: String
    @NSManaged public var metalTag: String
    @NSManaged public var model: String
    @NSManaged public var multiplier: String
    @NSManaged public var phoneNumber: String
    @NSManaged public var serialNumber: String
    @NSManaged public var unitTypeString: String
    @NSManaged public var wmisComments: String
    @NSManaged public var wmisContact: String
    @NSManaged public var wmisNumber: String
    @NSManaged public var dataEntries: NSOrderedSet
    @NSManaged public var district: District

}

// MARK: Generated accessors for dataEntries
extension Well {

    @objc(insertObject:inDataEntriesAtIndex:)
    @NSManaged public func insertIntoDataEntries(_ value: DataEntry, at idx: Int)

    @objc(removeObjectFromDataEntriesAtIndex:)
    @NSManaged public func removeFromDataEntries(at idx: Int)

    @objc(insertDataEntries:atIndexes:)
    @NSManaged public func insertIntoDataEntries(_ values: [DataEntry], at indexes: NSIndexSet)

    @objc(removeDataEntriesAtIndexes:)
    @NSManaged public func removeFromDataEntries(at indexes: NSIndexSet)

    @objc(replaceObjectInDataEntriesAtIndex:withObject:)
    @NSManaged public func replaceDataEntries(at idx: Int, with value: DataEntry)

    @objc(replaceDataEntriesAtIndexes:withDataEntries:)
    @NSManaged public func replaceDataEntries(at indexes: NSIndexSet, with values: [DataEntry])

    @objc(addDataEntriesObject:)
    @NSManaged public func addToDataEntries(_ value: DataEntry)

    @objc(removeDataEntriesObject:)
    @NSManaged public func removeFromDataEntries(_ value: DataEntry)

    @objc(addDataEntries:)
    @NSManaged public func addToDataEntries(_ values: NSOrderedSet)

    @objc(removeDataEntries:)
    @NSManaged public func removeFromDataEntries(_ values: NSOrderedSet)

}
