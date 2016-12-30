//
//  DistrictsTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/28/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

// MARK: - Protocols

/// Informs the delegate that a new district has been selected
protocol DistrictUpdateDelegate: class {
    func updateSelectedDistrict(district: District)
}

class DistrictsTableViewController: UITableViewController {
    
    //MARK: - Properties
    private let reuseIdentifier = "DistrictCell"
    
    var districts: [District] {
            return AppDataController.shared.districts
    }
    
    var selectedDistrict: District?
    var updateSelectedDistrictDelegate: DistrictUpdateDelegate?
    
    // MARK: View
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
        return districts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        let district = districts[indexPath.row]
        if selectedDistrict?.name.lowercased() == district.name.lowercased() {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }


        cell?.textLabel?.text = district.name
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedDistrict = districts[indexPath.row]
        updateCheckMarksInAllCells()
        
        // Inform delegate that district has changed
        self.updateSelectedDistrictDelegate?.updateSelectedDistrict(district: districts[indexPath.row])
    }
    
    func updateCheckMarksInAllCells(){
   
        guard let selectedDistrict = self.selectedDistrict else { return }
        for i in 0...(districts.count - 1)  {
            let indexPath = IndexPath(row: i, section: 0)
            let cell = tableView.cellForRow(at: indexPath)
            cell?.updateCheckMark(selectedDistrict: selectedDistrict)
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

fileprivate extension UITableViewCell {
    func updateCheckMark(selectedDistrict: District){
        if selectedDistrict.name.lowercased() == self.textLabel?.text?.lowercased() {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .none
        }
    }
}
