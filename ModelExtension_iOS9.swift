//
//  ModelExtension_iOS9.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 2/6/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import Foundation
extension Well {
    func addToDataEntries(_ value: DataEntry){
        if self.dataEntries.contains(value) {
            return
        }
        self.mutableOrderedSetValue(forKey: "dataEntries").add(value)
    }
    
    func addToFieldPhotos(_ value: FieldPhoto){
        if self.fieldPhotos.contains(value){
            return
        }
        self.mutableOrderedSetValue(forKey: "fieldPhotos").add(value)
    }
    
    func addToFieldNotes(_ value: FieldNote){
        if self.fieldNotes.contains(value){
            return
        }
        self.mutableOrderedSetValue(forKey: "fieldNotes").add(value)
    }
    
}

extension District {
    func addToWells(_ value: Well) {
        if self.wells.contains(value) {
            return
        }
        self.mutableOrderedSetValue(forKey: "wells").add(value)
    }
}
