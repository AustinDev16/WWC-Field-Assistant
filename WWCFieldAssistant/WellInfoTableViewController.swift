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
    let metalNameTagCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let serialNumberCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let measurementOptionCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    
    let contactNameCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let phoneNumberCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let wmisCommentCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    
    
    override func loadView() {
        super.loadView()
        self.title = "WMIS # 100045 - Camel Well"
        // Construct cells
        //wellNameCell.textLabel?.text = "WMIS # 100045 - Camel Well"
        locationCell.textLabel?.text = "Location: PLS"
        metalNameTagCell.textLabel?.text = "Metal Tag #: "
        metalNameTagCell.detailTextLabel?.text = "A00004523D"
        
        serialNumberCell.textLabel?.text = "Serial #:"
        serialNumberCell.detailTextLabel?.text = "M195632453"
        
        measurementOptionCell.textLabel?.text = "Measurement Option:"
        measurementOptionCell.detailTextLabel?.text = "Flow Meter(1)"
        
        contactNameCell.textLabel?.text = "Name:"
        contactNameCell.detailTextLabel?.text = "4H Ranch, Michael Telford"
        
        phoneNumberCell.textLabel?.text = "Phone:"
        phoneNumberCell.detailTextLabel?.text = "(208)3564769"
        wmisCommentCell.textLabel?.text = "Comment:"
        wmisCommentCell.detailTextLabel?.text = "Well needs straps"
        wmisCommentCell.detailTextLabel?.numberOfLines = 0
        
//        // Add header
//        let headerView = UIView()
//        headerView.backgroundColor = UIColor.blue
//        self.tableView.tableHeaderView = headerView
//        self.tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 30)
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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 4
        case 1:
            return 2
        default:
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:  // First section
            switch indexPath.row {
            case 0:
                return metalNameTagCell
            case 1:
                return serialNumberCell
            case 2:
                return measurementOptionCell
            case 3:
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
            default:
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Well Info"
        case 1:
            return "Contact"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 34
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 35
        default:
            return 20
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
