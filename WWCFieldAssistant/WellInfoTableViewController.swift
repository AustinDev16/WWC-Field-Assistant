//
//  WellInfoTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/14/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class WellInfoTableViewController: UITableViewController {

    // MARK: - Static Cells
    let wellNameCell: UITableViewCell = UITableViewCell()
    let locationCell: UITableViewCell = UITableViewCell()
    let metalNameTagCell: UITableViewCell = UITableViewCell()
    let serialNumberCell: UITableViewCell = UITableViewCell()
    let measurementOptionCell: UITableViewCell = UITableViewCell()
    
    let contactNameCell: UITableViewCell = UITableViewCell()
    let phoneNumberCell: UITableViewCell = UITableViewCell()
    let wmisCommentCell: UITableViewCell = UITableViewCell()
    
    
    override func loadView() {
        super.loadView()
        
        // Construct cells
        wellNameCell.textLabel?.text = "WMIS # 100045 - Camel Well"
        locationCell.textLabel?.text = "Location: PLS"
        metalNameTagCell.textLabel?.text = "Metal Tag# A00004523D"
        serialNumberCell.textLabel?.text = "Serial# M195632453"
        measurementOptionCell.textLabel?.text = "Measurement Option: Flow Meter(1)"
        
        contactNameCell.textLabel?.text = "4H Ranch, Michael Telford"
        phoneNumberCell.textLabel?.text = "Phone: 2083564769"
        wmisCommentCell.textLabel?.text = "Well needs straps"
        
        // Add header
        let headerView = UIView()
        headerView.backgroundColor = UIColor.blue
        self.tableView.tableHeaderView = headerView
        self.tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 30)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 8
        case 1:
            return 3
        default:
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:  // First section
            switch indexPath.row {
            case 0:
                return wellNameCell
            case 1:
                return locationCell
            case 2:
                return metalNameTagCell
            case 3:
                return serialNumberCell
            case 4:
                return measurementOptionCell
            case 5:
                return contactNameCell
            case 6:
                return phoneNumberCell
            case 7:
                return wmisCommentCell
            default:
                return UITableViewCell()
            }
        case 1: // Second section
            switch indexPath.row {
            case 0:
                return contactNameCell
            case 1:
                return phoneNumberCell
            case 2:
                return wmisCommentCell
            default:
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
 
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return "Well info"
//        case 1:
//            return "Contact info"
//        default:
//            return nil
//        }
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
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
