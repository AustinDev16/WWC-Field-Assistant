//
//  Well+CoreDataProperties.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/31/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
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
    @NSManaged public var fieldPhotos: NSOrderedSet
    @NSManaged public var fieldNotes: NSOrderedSet

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

// MARK: Generated accessors for fieldPhotos
extension Well {

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

// MARK: Generated accessors for fieldNotes
extension Well {

    @objc(insertObject:inFieldNotesAtIndex:)
    @NSManaged public func insertIntoFieldNotes(_ value: FieldNote, at idx: Int)

    @objc(removeObjectFromFieldNotesAtIndex:)
    @NSManaged public func removeFromFieldNotes(at idx: Int)

    @objc(insertFieldNotes:atIndexes:)
    @NSManaged public func insertIntoFieldNotes(_ values: [FieldNote], at indexes: NSIndexSet)

    @objc(removeFieldNotesAtIndexes:)
    @NSManaged public func removeFromFieldNotes(at indexes: NSIndexSet)

    @objc(replaceObjectInFieldNotesAtIndex:withObject:)
    @NSManaged public func replaceFieldNotes(at idx: Int, with value: FieldNote)

    @objc(replaceFieldNotesAtIndexes:withFieldNotes:)
    @NSManaged public func replaceFieldNotes(at indexes: NSIndexSet, with values: [FieldNote])

    @objc(addFieldNotesObject:)
    @NSManaged public func addToFieldNotes(_ value: FieldNote)

    @objc(removeFieldNotesObject:)
    @NSManaged public func removeFromFieldNotes(_ value: FieldNote)

    @objc(addFieldNotes:)
    @NSManaged public func addToFieldNotes(_ values: NSOrderedSet)

    @objc(removeFieldNotes:)
    @NSManaged public func removeFromFieldNotes(_ values: NSOrderedSet)

}
