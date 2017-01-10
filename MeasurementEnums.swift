//
//  MeasurementEnums.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation

enum MeterUnitType: String {
    case acreFeet = "AF"
    case gallons = "Gallons"
}

enum Multiplier: Double {
    case million = 1000000
    case thousand = 1000
    case one = 1.0
    case tenth = 0.1
    case hundreth = 0.01
    case thousandeth = 0.001
}

extension Double {
    func stringRepresentation() -> String {
        if self == 1000000 {
            return "1 million"
        } else {
        return String(self)
        }
    }
}
