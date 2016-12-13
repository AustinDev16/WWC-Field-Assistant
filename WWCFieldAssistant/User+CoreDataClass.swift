//
//  User+CoreDataClass.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    convenience init?(firstName: String,
                      lastName: String,
                      password: String,
                      userName: String){
        
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
