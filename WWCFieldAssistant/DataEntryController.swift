//
//  DataEntryController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import UIKit

class DataEntryController {
    let well: Well
    
    init(well: Well){
        // This may also be done as a fetch from Core Data to then initialize all corresponding data entries and photos.
        self.well = well
    }
    
    /// Adds a newly completed data entry to the corresponding well
    func addDataEntry(dateCollected: NSDate,
                      fieldNotes: String,
                      make: String,
                      meterReading: Double,
                      model: String,
                      multiplier: Multiplier,
                      serialNumber: String,
                      unitType: MeterUnitType){
        
        guard let newEntry = DataEntry(dateCollected: dateCollected, fieldNotes: fieldNotes, make: make, meterReading: meterReading, model: model, multiplier: multiplier, serialNumber: serialNumber, unitType: unitType, well: self.well) else { return }
        
        self.well.addToDataEntries(newEntry)
        PersistenceController.saveToPersistedStore()
    }
    
    /// Deletes a data entry from a well
    func deleteDataEntry(entryToDelete: DataEntry){
        guard let moc = entryToDelete.managedObjectContext else { return }
        self.well.removeFromDataEntries(entryToDelete)
        moc.delete(entryToDelete)
        PersistenceController.saveToPersistedStore()
    }
    
    /// Adds a field photo, name, and comments to a data entry
    func addFieldPhotoToWell(dateTaken: NSDate,
                                  comment: String,
                                  name: String,
                                  image: UIImage){
        guard let imageData = UIImageJPEGRepresentation(image, 1.0) else {return}
        let newFieldPhoto = FieldPhoto(dateTaken: dateTaken, comment: comment, name: name, well: self.well, imageData: imageData)

        self.well.addToFieldPhotos(newFieldPhoto!)
        PersistenceController.saveToPersistedStore()
    }
    
    /// Deletes a field photo from a data entry
    func deleteFieldPhotoFromEntry(fieldPhotoToDelete: FieldPhoto){
        guard let moc = fieldPhotoToDelete.managedObjectContext else { return }
        let well = fieldPhotoToDelete.well
        well.removeFromFieldPhotos(fieldPhotoToDelete)
        moc.delete(fieldPhotoToDelete)
        PersistenceController.saveToPersistedStore()
    }
    
    
}
