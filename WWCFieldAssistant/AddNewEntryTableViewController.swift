//
//  AddNewEntryTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/21/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class AddNewEntryTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        tableView.allowsSelection = false
    }

    func setUpNavigationBar(){
        self.title = "Add new Entry"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    func cancelButtonTapped(){
        self.isEditing = false
        
        let cancelAlertController = UIAlertController(title: "Are you sure?", message: "Canceling will lead to any unsaved data to be lost permanently.", preferredStyle: .alert)
        let discardChanges = UIAlertAction(title: "Discard changes", style: .destructive) { (_) in
            self.setEditing(false, animated: false)
            self.dismiss(animated: true, completion: nil)
        }
        let stayOnPage = UIAlertAction(title: "Stay on this page", style: .default, handler: nil)
        
        cancelAlertController.addAction(discardChanges)
        cancelAlertController.addAction(stayOnPage)
        self.present(cancelAlertController, animated: true, completion: nil)
        
      
    }
    
    func saveButtonTapped(){
        print("Save button tapped")
    }
    // MARK: - Static Cells
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    func returnCellAt(indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: // Section 1
            switch indexPath.row {
            case 0: // Date
                let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
                cell.textLabel?.text = "\(dateFormatter.string(from: Date()))"
                cell.detailTextLabel?.text = "Collected by: Jason D."
                return cell
            case 2:
                let cell = AddNewReadingTableViewCell()//(style: .value1, reuseIdentifier: nil)
                cell.configureCell()
                return cell
            case 1:
                let cell = WellSerialAndMetalTagTableViewCell()
                cell.configureCell()
                return cell
            default: return UITableViewCell()
            }
        case 1: // Section 2
            let cell = FieldNotesTableViewCell()
            cell.configureCell()
            return cell
        case 2: // Section 3
            let cell = FieldPhotoTableViewCell()
            cell.configureCell()
            return cell
        default: return UITableViewCell()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0: return 3 // Reading/well info
        case 1: return 1 // Field Notes
        case 2: return 1 // Field photos
        default: return 0
        }

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        // Configure the cell...

        return returnCellAt(indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 1 { // Picker view
//            return 80
//        } else if indexPath.row == 3 { // Textview
//            return 120
//        } else if indexPath.row == 4 {
//            return 160
//        } else {
//            return 60
//        }
        
        if indexPath.section == 0 {
            if indexPath.row == 2{//1 {
                return 80
            } else {
                return 40
            }
        } else if indexPath.section == 1 {
            return 120
        } else if indexPath.section == 2 {
            return 160
        } else {
            return 40
        }
       
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Entry detail"
        case 1: return "Field notes"
        case 2: return "Field photos"
        default: return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 40} else { return 24}
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
