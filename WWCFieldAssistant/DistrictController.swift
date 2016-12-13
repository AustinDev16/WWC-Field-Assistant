//
//  DistrictController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation

class DistrictController {
    let district: District
    
    init(district: District){
        // This may be a result of core data fetch
        self.district = district
    }
    
    var wells: [Well] {
        return self.district.wells.flatMap{ $0 as? Well }
    }
    
    
    
}
