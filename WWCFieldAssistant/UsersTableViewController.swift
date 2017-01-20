//
//  UsersTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/5/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

/// Informs Delegate of New User
protocol LoggedInUserUpdateDelegate: class {
    func updateLoggedInUser(user: User)
}

class UsersTableViewController: UITableViewController {

    // MARK: - Properties
    private let reuseIdentifier = "UserCell"
    
    var users: [User] {
        return AppDataController.shared.users
    }
    var loggedInUser: User?
    weak var updateLoggedInUserDelegate: LoggedInUserUpdateDelegate?
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        let user = users[indexPath.row]
        if loggedInUser?.uuid == user.uuid {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        
        
        cell?.textLabel?.text = user.userName
        return cell ?? UITableViewCell()
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        loggedInUser = users[indexPath.row]
        updateCheckMarksInAllCells()
        
        // Inform delegate that the logged in user has changed
        self.updateLoggedInUserDelegate?.updateLoggedInUser(user: users[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateCheckMarksInAllCells(){
        
        guard let loggedInUser = self.loggedInUser else { return }
        for i in 0...(users.count - 1)  {
            let indexPath = IndexPath(row: i, section: 0)
            let cell = tableView.cellForRow(at: indexPath)
            cell?.updateCheckMark(loggedInUser: loggedInUser)
        }
    }
 
}

fileprivate extension UITableViewCell {
    func updateCheckMark(loggedInUser: User){
        if loggedInUser.userName.lowercased() == self.textLabel?.text?.lowercased() {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .none
        }
    }
}
