//
//  Well+CoreDataClass.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData

@objc(Well)
public class Well: NSManagedObject {

    convenience init?(diversionName: String,
                      firstName: String,
                      lastName: String,
                      make: String,
                      measurementOption: String,
                      metalTag: String,
                      model: String,
                      multiplier: Multiplier,
                      phoneNumber: String,
                      serialNumber: String,
                      unitType: MeterUnitType,
                      wmisComments: String,
                      wmisContact: String,
                      wmisNumber: String,
                      district: District){
        
        if #available(iOS 10.0, *) {
            let context = CoreDataStack.context
            self.init(context: context)
        } else {
            let context = Stack.sharedStack.managedObjectContext
            guard let entity = NSEntityDescription.entity(forEntityName: "Well", in: context) else {return nil}
            self.init(entity: entity, insertInto: context)
        }
        
        self.diversionName = diversionName
        self.firstName = firstName
        self.lastName = lastName
        self.make = make
        self.measurementOption = measurementOption
        self.metalTag = metalTag
        self.model = model
        self.multiplier = multiplier.rawValue.stringRepresentation()
        self.phoneNumber = phoneNumber
        self.serialNumber = serialNumber
        self.unitTypeString = unitType.rawValue
        self.wmisComments = wmisComments
        self.wmisContact = wmisContact
        self.wmisNumber = wmisNumber
        self.district = district
    }
    
    var multiplierAsType: Multiplier? {
        guard let double = Double(self.multiplier) else { return nil}
        return Multiplier(rawValue: double)
    }
}
