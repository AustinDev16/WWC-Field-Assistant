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
    
    
}
