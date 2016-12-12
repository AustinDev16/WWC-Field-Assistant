//
//  PersistenceController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
class PersistenceController {
    
    static func saveToPersistedStore(){
        if #available(iOS 9.0, *) {
            let moc = Stack.sharedStack.managedObjectContext
            do {
                try moc.save()
            } catch {
                print("Error saving to persisted store, iOS 9")
            }
        }
        
        if #available(iOS 10.0, *) { // For iOS 10
            let moc = CoreDataStack.context
            do {
                try moc.save()
            } catch {
                print("Error saving to persisted store, iOS 10")
            }
        }
    }
    
    
    
}
