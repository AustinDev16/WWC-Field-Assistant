//
//  District+CoreDataProperties.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData


extension District {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<District> {
        return NSFetchRequest<District>(entityName: "District");
    }

    @NSManaged public var name: String
    @NSManaged public var wells: NSOrderedSet

}

// MARK: Generated accessors for wells
extension District {

    @objc(insertObject:inWellsAtIndex:)
    @NSManaged public func insertIntoWells(_ value: Well, at idx: Int)

    @objc(removeObjectFromWellsAtIndex:)
    @NSManaged public func removeFromWells(at idx: Int)

    @objc(insertWells:atIndexes:)
    @NSManaged public func insertIntoWells(_ values: [Well], at indexes: NSIndexSet)

    @objc(removeWellsAtIndexes:)
    @NSManaged public func removeFromWells(at indexes: NSIndexSet)

    @objc(replaceObjectInWellsAtIndex:withObject:)
    @NSManaged public func replaceWells(at idx: Int, with value: Well)

    @objc(replaceWellsAtIndexes:withWells:)
    @NSManaged public func replaceWells(at indexes: NSIndexSet, with values: [Well])

    @objc(addWellsObject:)
    @NSManaged public func addToWells(_ value: Well)

    @objc(removeWellsObject:)
    @NSManaged public func removeFromWells(_ value: Well)

    @objc(addWells:)
    @NSManaged public func addToWells(_ values: NSOrderedSet)

    @objc(removeWells:)
    @NSManaged public func removeFromWells(_ values: NSOrderedSet)

}
