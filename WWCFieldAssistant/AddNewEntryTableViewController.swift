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
    }

    func setUpNavigationBar(){
        self.title = "Add new Entry"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    func cancelButtonTapped(){
        self.dismiss(animated: true, completion: nil)
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
        case 0:
            switch indexPath.row {
            case 0: // Date
                let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
                cell.textLabel?.text = "\(dateFormatter.string(from: Date()))"
                cell.detailTextLabel?.text = "Collected by: Jason D."
                return cell
            case 1:
                let cell = AddNewReadingTableViewCell()//(style: .value1, reuseIdentifier: nil)
                cell.configureCell()
                return cell
            case 2:
                let cell = WellSerialAndMetalTagTableViewCell()
                cell.configureCell()
                return cell
            case 3:
                let cell = FieldNotesTableViewCell()
                cell.configureCell()
                return cell
            default: return UITableViewCell()
            }
        default: return UITableViewCell()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        // Configure the cell...

        return returnCellAt(indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 { // Picker view
            return 80
        } else if indexPath.row == 3 { // Textview
            return 120
        } else {
            return 60
        }
       
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
