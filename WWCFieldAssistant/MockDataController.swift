//
//  MockData.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation

class MockDataController {
    
    static func populateBonnevilleDistrict(){
        let bonneville = District(name: "Bonneville")
        if let bonneville = bonneville {
            let bonnevilleController = DistrictController(district: bonneville)
            
            // Well 1
            let well1 = Well(diversionName: "Camel Well", firstName: "Michael", lastName: "Telford", make: "General Electric", measurementOption: "Flow Meter(1)", metalTag: "A00004532D", model: "D-3452A", multiplier: .hundreth, phoneNumber: "(208)1234567", serialNumber: "M195632453", unitType: .acreFeet, wmisComments: "Well needs straps", wmisContact: "4H Ranch", wmisNumber: "100045", district: bonneville)
            
            let well1Controller = DataEntryController(well: well1!)
            well1Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-10000000), fieldNotes: "", make: "GE", meterReading: 235678, model: "D-3452A", multiplier: .hundreth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well1Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-8000000), fieldNotes: "Well straps installed.", make: "GE", meterReading: 236785, model: "D-3452A", multiplier: .hundreth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well1Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-6000000), fieldNotes: "", make: "GE", meterReading: 237456, model: "D-3452A", multiplier: .hundreth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well1Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-4000000), fieldNotes: "", make: "GE", meterReading: 238875, model: "D-3452A", multiplier: .hundreth, serialNumber: "M195632453", unitType: .acreFeet)
            
            bonnevilleController.district.addToWells(well1!)
            
            // Well 2
            let well2 = Well(diversionName: "Highpoint Well", firstName: "John", lastName: "Doe", make: "General Electric", measurementOption: "Flow Meter(1)", metalTag: "A00004532D", model: "D-3452A", multiplier: .thousandeth, phoneNumber: "(208)1234567", serialNumber: "M195632453", unitType: .acreFeet, wmisComments: "", wmisContact: "Eagle Eye Farms", wmisNumber: "100045", district: bonneville)
            
            let well2Controller = DataEntryController(well: well2!)
            well2Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-10000000), fieldNotes: "", make: "GE", meterReading: 235678, model: "D-3452A", multiplier: .thousandeth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well2Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-7000000), fieldNotes: "", make: "GE", meterReading: 235700, model: "D-3452A", multiplier: .thousandeth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well2Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-5000000), fieldNotes: "", make: "GE", meterReading: 236458, model: "D-3452A", multiplier: .thousandeth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well2Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-3000000), fieldNotes: "", make: "GE", meterReading: 238321, model: "D-3452A", multiplier: .thousandeth, serialNumber: "M195632453", unitType: .acreFeet)

            bonnevilleController.district.addToWells(well2!)
            
            // Well 3
            
            // Well 4
            
            PersistenceController.saveToPersistedStore()
        } // End Bonneville
    }
    
    static func populateBurleyDistrict(){
        let burley = District(name: "Burley")
        if let burley = burley {
            let burleyController = DistrictController(district: burley)
            
            // Well 1
            let well1 = Well(diversionName: "Highpoint Well 2", firstName: "John", lastName: "Doe", make: "General Electric", measurementOption: "Flow Meter(1)", metalTag: "A00004532D", model: "D-3452A", multiplier: .thousandeth, phoneNumber: "(208)1234567", serialNumber: "M195632453", unitType: .acreFeet, wmisComments: "", wmisContact: "Eagle Eye Farms", wmisNumber: "100045", district: burley)
            
            let well1Controller = DataEntryController(well: well1!)
            well1Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-10000000), fieldNotes: "", make: "GE", meterReading: 235678, model: "D-3452A", multiplier: .hundreth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well1Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-8000000), fieldNotes: "Well straps installed.", make: "GE", meterReading: 236785, model: "D-3452A", multiplier: .hundreth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well1Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-6000000), fieldNotes: "", make: "GE", meterReading: 237456, model: "D-3452A", multiplier: .hundreth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well1Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-4000000), fieldNotes: "", make: "GE", meterReading: 238875, model: "D-3452A", multiplier: .hundreth, serialNumber: "M195632453", unitType: .acreFeet)
            
            burleyController.district.addToWells(well1!)
            
            // Well 2
            let well2 = Well(diversionName: "Highpoint Well3", firstName: "John", lastName: "Doe", make: "General Electric", measurementOption: "Flow Meter(1)", metalTag: "A00004532D", model: "D-3452A", multiplier: .thousandeth, phoneNumber: "(208)1234567", serialNumber: "M195632453", unitType: .acreFeet, wmisComments: "", wmisContact: "Eagle Eye Farms", wmisNumber: "100045", district: burley)
            
            let well2Controller = DataEntryController(well: well2!)
            well2Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-10000000), fieldNotes: "", make: "GE", meterReading: 235678, model: "D-3452A", multiplier: .thousandeth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well2Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-7000000), fieldNotes: "", make: "GE", meterReading: 235700, model: "D-3452A", multiplier: .thousandeth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well2Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-5000000), fieldNotes: "", make: "GE", meterReading: 236458, model: "D-3452A", multiplier: .thousandeth, serialNumber: "M195632453", unitType: .acreFeet)
            
            well2Controller.addDataEntry(dateCollected: NSDate().addingTimeInterval(-3000000), fieldNotes: "", make: "GE", meterReading: 238321, model: "D-3452A", multiplier: .thousandeth, serialNumber: "M195632453", unitType: .acreFeet)
            
            burleyController.district.addToWells(well2!)
            
            PersistenceController.saveToPersistedStore()
        } // End Burley
        
    }
    
    
}
