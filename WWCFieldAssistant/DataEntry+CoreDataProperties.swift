//
//  DataEntry+CoreDataProperties.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData


extension DataEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataEntry> {
        return NSFetchRequest<DataEntry>(entityName: "DataEntry");
    }

    @NSManaged public var dateCollected: NSDate
    @NSManaged public var fieldNotes: String
    @NSManaged public var make: String
    @NSManaged public var meterReading: Double
    @NSManaged public var model: String
    @NSManaged public var multiplier: String
    @NSManaged public var serialNumber: String
    @NSManaged public var unitTypeString: String
    @NSManaged public var fieldPhotos: NSOrderedSet
    @NSManaged public var well: Well

}

// MARK: Generated accessors for fieldPhotos
extension DataEntry {

    @objc(insertObject:inFieldPhotosAtIndex:)
    @NSManaged public func insertIntoFieldPhotos(_ value: FieldPhoto, at idx: Int)

    @objc(removeObjectFromFieldPhotosAtIndex:)
    @NSManaged public func removeFromFieldPhotos(at idx: Int)

    @objc(insertFieldPhotos:atIndexes:)
    @NSManaged public func insertIntoFieldPhotos(_ values: [FieldPhoto], at indexes: NSIndexSet)

    @objc(removeFieldPhotosAtIndexes:)
    @NSManaged public func removeFromFieldPhotos(at indexes: NSIndexSet)

    @objc(replaceObjectInFieldPhotosAtIndex:withObject:)
    @NSManaged public func replaceFieldPhotos(at idx: Int, with value: FieldPhoto)

    @objc(replaceFieldPhotosAtIndexes:withFieldPhotos:)
    @NSManaged public func replaceFieldPhotos(at indexes: NSIndexSet, with values: [FieldPhoto])

    @objc(addFieldPhotosObject:)
    @NSManaged public func addToFieldPhotos(_ value: FieldPhoto)

    @objc(removeFieldPhotosObject:)
    @NSManaged public func removeFromFieldPhotos(_ value: FieldPhoto)

    @objc(addFieldPhotos:)
    @NSManaged public func addToFieldPhotos(_ values: NSOrderedSet)

    @objc(removeFieldPhotos:)
    @NSManaged public func removeFromFieldPhotos(_ values: NSOrderedSet)

}
