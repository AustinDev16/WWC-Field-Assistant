//
//  CoreDataStack.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/12/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Core Data iOS 9.0
@available(iOS 9.0, *)
class Stack {
    
    static let sharedStack = Stack()
    
    lazy var managedObjectContext: NSManagedObjectContext = Stack.setUpMainContext()
    
    static func setUpMainContext() -> NSManagedObjectContext {
        let bundle = Bundle.main
        guard let model = NSManagedObjectModel.mergedModel(from: [bundle])
            else { fatalError("model not found") }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        try! psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil,
                                    at: storeURL() as URL?, options: nil)
        let context = NSManagedObjectContext(
            concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = psc
        return context
    }
    
    static func storeURL () -> NSURL? {
        let documentsDirectory: NSURL?
        do {
            documentsDirectory = try FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: true) as NSURL?
        } catch {
            documentsDirectory = nil
        }
        
        return documentsDirectory?.appendingPathComponent("db.sqlite") as NSURL?
    }
    
}

// MARK: - Core Data iOS 10.0
@available(iOS 10.0, *)
enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
