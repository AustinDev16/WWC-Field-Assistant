//
//  District+CoreDataClass.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData

@objc(District)
public class District: NSManagedObject {
    
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
