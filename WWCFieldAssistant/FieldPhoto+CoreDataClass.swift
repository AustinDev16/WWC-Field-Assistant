//
//  FieldPhoto+CoreDataClass.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(FieldPhoto)
public class FieldPhoto: NSManagedObject {

    convenience init?(dateTaken: NSDate,
                      comment: String,
                      name: String,
                      dataEntry: DataEntry,
                      image: UIImage) {
        
        if #available(iOS 10.0, *) {
            let context = CoreDataStack.context
            self.init(context: context)
        } else {
            let context = Stack.sharedStack.managedObjectContext
            guard let entity = NSEntityDescription.entity(forEntityName: "FieldPhoto", in: context) else {return nil}
            self.init(entity: entity, insertInto: context)
        }
        
        self.comment = comment
        self.imageData = NSData() // correct this
        self.name = name
        self.dataEntry = dataEntry
        self.dateTaken = dateTaken
    
    }
}
