//
//  AppDataController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import CoreData

class AppDataController {
    static let shared = AppDataController()
    
    var districts: [District] = []
    var users: [User] = []
    
    var loggedInUser: User?
    
    /// Fetches all districts from persistent store
    func fetchDistricts(){
        let fetchRequest: NSFetchRequest<District> = District.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if #available(iOS 10.0, *) {
            let moc = CoreDataStack.context
            do {
                let results = try moc.fetch(fetchRequest)
                self.districts = results
            } catch {
                print("Error fetching districts, iOS10 \(error.localizedDescription)")
            }
            
        } else {
            // Fallback on earlier versions
            let moc = Stack.sharedStack.managedObjectContext
            do {
                let results = try moc.fetch(fetchRequest)
                self.districts = results
            } catch {
                print("Error fetching districts, iOS9 \(error.localizedDescription)")
            }
        }

    }
    
    /// Fetches all saved users from persistent store
    func fetchUsers(){
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "userName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if #available(iOS 10.0, *) {
            let moc = CoreDataStack.context
            do {
                let results = try moc.fetch(fetchRequest)
                self.users = results
            } catch {
                print("Error fetching users, iOS10 \(error.localizedDescription)")
            }
            
        } else {
            // Fallback on earlier versions
            let moc = Stack.sharedStack.managedObjectContext
            do {
                let results = try moc.fetch(fetchRequest)
                self.users = results
            } catch {
                print("Error fetching users, iOS9 \(error.localizedDescription)")
            }
        }
        
    }
    
    /// Creates an instance of DistrictController with a selected district
    func initiateDistrictController(district: District) -> DistrictController {
        return DistrictController(district: district)
    }
    
    /// count number of photos for testing
    
    func countFieldPhotos() -> Int {
        let fetchRequest: NSFetchRequest<FieldPhoto> = FieldPhoto.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if #available(iOS 10.0, *) {
            let moc = CoreDataStack.context
            do {
                let results = try moc.fetch(fetchRequest)
                return results.count
            } catch {
                print("Error fetching users, iOS10 \(error.localizedDescription)")
                return 0
            }
            
        } else {
            // Fallback on earlier versions
            let moc = Stack.sharedStack.managedObjectContext
            do {
                let results = try moc.fetch(fetchRequest)
                return results.count
            } catch {
                print("Error fetching users, iOS9 \(error.localizedDescription)")
                return 0
            }
        }
        
    }
    
    /// Count number of entries
    func countDataEntries() -> Int {
        let fetchRequest: NSFetchRequest<DataEntry> = DataEntry.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "dateCollected", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
     
        if #available(iOS 10.0, *) {
            let moc = CoreDataStack.context
            do {
                let results = try moc.fetch(fetchRequest)
                return results.count
            } catch {
                print("Error fetching users, iOS10 \(error.localizedDescription)")
                return 0
            }
            
        } else {
            // Fallback on earlier versions
            let moc = Stack.sharedStack.managedObjectContext
            do {
                let results = try moc.fetch(fetchRequest)
                return results.count
            } catch {
                print("Error fetching users, iOS9 \(error.localizedDescription)")
                return 0
            }
        }
    }
    
    
}

extension AppDataController: LoggedInUserUpdateDelegate {
    func updateLoggedInUser(user: User) {
        self.loggedInUser = user
    }
}
