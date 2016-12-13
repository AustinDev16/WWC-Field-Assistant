//
//  DataEntry+CoreDataClass.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData

@objc(DataEntry)
public class DataEntry: NSManagedObject {
    convenience init?(dateCollected: NSDate,
                     fieldNotes: String,
                     make: String,
                     meterReading: Double,
                     model: String,
                     multiplier: Multiplier,
                     serialNumber: String,
                     unitType: MeterUnitType,
                     well: Well) {
        
        if #available(iOS 10.0, *) {
            let context = CoreDataStack.context
            self.init(context: context)
        } else {
            let context = Stack.sharedStack.managedObjectContext
            guard let entity = NSEntityDescription.entity(forEntityName: "DataEntry", in: context) else {return nil}
            self.init(entity: entity, insertInto: context)
        }
        
        self.dateCollected = dateCollected
        self.fieldNotes = fieldNotes
        self.make = make
        self.meterReading = meterReading
        self.model = model
        self.multiplier = multiplier.rawValue.stringRepresentation()
        self.serialNumber = serialNumber
        self.unitTypeString = unitType.rawValue
        self.well = well
        
    }
    
    var multiplierAsType: Multiplier? {
        guard let double = Double(self.multiplier) else { return nil}
        return Multiplier(rawValue: double)
    }
}
