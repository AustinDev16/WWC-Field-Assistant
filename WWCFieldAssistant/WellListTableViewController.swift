//
//  WellListTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/14/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

protocol WellUpdateDelegate: class  {
    func updateSelectedWell(selectedWell: Well)
}

class WellListTableViewController: UITableViewController {
    
    private let reuseIdentifier = "wellCell"
    var district: District?
    var wells: [Well] = []
    var updateSelectedWellDelegate: WellUpdateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Bonneville District"
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewControllerWith(selectedDistrict: District){
        self.district = selectedDistrict
        self.title = selectedDistrict.name
        
        self.wells = selectedDistrict.wells.flatMap {$0 as? Well}
        self.tableView.reloadData()
    }

    // MARK: - Segues
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWell = self.wells[indexPath.row]
        let wellInfoDetailTVC = WellInfoTableViewController(style: .grouped)
        wellInfoDetailTVC.updateTableWith(selectedWell: selectedWell)
        self.updateSelectedWellDelegate?.updateSelectedWell(selectedWell: selectedWell)
        self.navigationController?.pushViewController(wellInfoDetailTVC, animated: true)
        
        let notification = Notification(name: Notification.Name(rawValue: "SelectedWellUpdated"), object: nil, userInfo: nil)
        NotificationCenter.default.post(notification)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.wells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
        let selectedWell = self.wells[indexPath.row]
        cell?.textLabel?.text = selectedWell.diversionName
        cell?.detailTextLabel?.text = selectedWell.wmisNumber
        cell?.accessoryType = .disclosureIndicator
        // Configure the cell...

        return cell ?? UITableViewCell()
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


}
