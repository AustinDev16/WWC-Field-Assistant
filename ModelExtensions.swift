//
//  ModelExtensions.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/31/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData
import UIKit
// MARK: - District

extension District {
    convenience init?(name: String){
        if #available(iOS 10.0, *) {
            let context = CoreDataStack.context
            self.init(context: context)
        } else {
            let context = Stack.sharedStack.managedObjectContext
            guard let entity = NSEntityDescription.entity(forEntityName: "District", in: context) else {return nil}
            self.init(entity: entity, insertInto: context)
        }
        
        self.name = name
        
    }
}

// MARK: - Data Entry

extension DataEntry {
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

// MARK: - FieldPhoto
extension FieldPhoto {
    convenience init?(dateTaken: NSDate,
                      comment: String,
                      name: String,
                      well: Well,
                      imageData: Data) {
        
        if #available(iOS 10.0, *) {
            let context = CoreDataStack.context
            self.init(context: context)
        } else {
            let context = Stack.sharedStack.managedObjectContext
            guard let entity = NSEntityDescription.entity(forEntityName: "FieldPhoto", in: context) else {return nil}
            self.init(entity: entity, insertInto: context)
        }
        
        self.comment = comment
        self.imageData = imageData as NSData // correct this
        self.name = name
        self.well = well
        self.dateTaken = dateTaken
        
    }
    
    var photo: UIImage? {
        return UIImage(data: self.imageData as Data)
    }
}

// MARK: - Well
extension Well {
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

// MARK: - User
extension User {
    convenience init?(firstName: String,
                      lastName: String,
                      password: String){
        
        if #available(iOS 10.0, *) {
            let context = CoreDataStack.context
            self.init(context: context)
        } else {
            let context = Stack.sharedStack.managedObjectContext
            guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else {return nil}
            self.init(entity: entity, insertInto: context)
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.userName = "\(firstName) \(lastName)"
        self.password = password
        self.uuid = UUID().uuidString
        
        
    }
}

extension User {
    func isValidUserName(userName: String) -> Bool {
        return self.userName == userName
    }
    
    func isValidPassword(password: String) -> Bool {
        return self.password == password
    }
}
