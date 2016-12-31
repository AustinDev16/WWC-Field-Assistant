//
//  DataEntryListTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/14/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class DataEntryListTableViewController: UITableViewController {
    // MARK: Properties
    private let reuseIdentifier = "dataEntryCell"
    var well: Well?
    var dataEntries: [DataEntry] {
        if let well = self.well {
            return well.dataEntries.flatMap{$0 as? DataEntry}.sorted(by: { (entry1, entry2) -> Bool in
                return entry1.dateCollected.timeIntervalSince1970 > entry2.dateCollected.timeIntervalSince1970
            })
        } else {
            return []
        }
    }
    
    let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateSelectedWell(notification:)), name: Notification.Name(rawValue: "SelectedWellUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.resetDataEntryView(notification:)), name: Notification.Name(rawValue:"SelectedDistrictUpdated"), object: nil)
    }
    
    /// Updates the selected well so that table view will show data entries from it
    func updateSelectedWell(notification: Notification){
        let selectedWell = notification.object as? Well
        print("Notification received")
        print(selectedWell?.diversionName ?? "nil object")
        // get the selected well from the parent view
        if let selectedWell = selectedWell {
            updateWith(selectedWell: selectedWell)
        }
    }
    
    /// Called to reset the view when no well is selected (i.e. new district is selected)
    func resetDataEntryView(notification: Notification){
        self.well = nil
        tableView.reloadData()
    }
    
    func updateWith(selectedWell: Well) {
        self.well = selectedWell
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if self.well == nil {
            tableView.separatorStyle = .none
            let noWellSelectedLabel = UILabel(frame: tableView.frame)
            noWellSelectedLabel.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
            noWellSelectedLabel.text = "No well selected"
            noWellSelectedLabel.textAlignment = .center
            tableView.backgroundView = noWellSelectedLabel
            self.title = "Data Entries"
            
            
            return 0
        } else {
            self.title = well?.diversionName
            self.tableView.backgroundView = nil
            tableView.separatorStyle = .singleLine
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataEntries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
        let dataEntry = dataEntries[indexPath.row]
        
        cell?.textLabel?.text = dataEntry.meterReading.stringRepresentation()
        cell?.detailTextLabel?.text = dateFormatter.string(from: dataEntry.dateCollected as Date)
        cell?.accessoryType = .disclosureIndicator
        // Configure the cell...
        
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DataEntryDetailTableViewController(style: .grouped)
        self.navigationController?.pushViewController(detailVC, animated: true)
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
