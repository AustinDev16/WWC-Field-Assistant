//
//  DataEntryDetailTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/16/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class DataEntryDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStaticCells()
        configureTitle()
        self.tableView.allowsSelection = false
        self.tableView.isScrollEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.resetDataEntryView(notification:)), name: Notification.Name(rawValue:"SelectedDistrictUpdated"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.resetDataEntryView(notification:)), name: Notification.Name(rawValue: "SelectedWellUpdated"), object: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func resetDataEntryView(notification: Notification){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0: return 4 // Meter info
        case 1: return 2 // Reading
        case 2: return 1 // Field Notes
        case 3: return 1 // Photos
        default: return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return staticCellFor(indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Meter info"
        case 1: return "Reading"
        case 2: return "Field notes"
        case 3: return "Photos"
        default: return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: // Meter info
            return 34
        case 1: // Reading
            return 34
        case 2: // Field Notes
            return 120
        case 3: // Photos
            return 100
        default: return 40
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 35
        default:
            return 20
        }
    }
    
    func staticCellFor(indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0://Meter Info
            switch indexPath.row {
            case 0: return serialNumberCell
            case 1: return metalNameTagCell
            case 2: return makeCell
            case 3: return modelCell
            default: return UITableViewCell()
            }
        case 1:// Reading
            switch indexPath.row {
            //case 0: return dateCell
            case 0: return readingCell
            case 1: return technichianCell
            default: return UITableViewCell()
            }
        case 2:// Field Notes
            switch indexPath.row {
            default:
                let cell = FieldNotesTableViewCell()
                cell.configureCell()
                cell.fieldNotesTextView.isEditable = false
                cell.fieldNotesTextView.backgroundColor = UIColor.brown.withAlphaComponent(0.3)
                return cell
            }
        case 3:// Field Photos
            switch indexPath.row {
            default: return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
    
    // MARK: - Static Cells
    let wellNameCell: UITableViewCell = UITableViewCell()
    let locationCell: UITableViewCell = UITableViewCell()
    let metalNameTagCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let serialNumberCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let makeCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let modelCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let measurementOptionCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
//    let dateCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let readingCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    let technichianCell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)

    
    
    func configureStaticCells(){
        // Construct cells
        //wellNameCell.textLabel?.text = "WMIS # 100045 - Camel Well"
        locationCell.textLabel?.text = "Location: PLS"
        metalNameTagCell.textLabel?.text = "Metal Tag #: "
        metalNameTagCell.detailTextLabel?.text = "A00004523D"
        
        serialNumberCell.textLabel?.text = "Serial #:"
        serialNumberCell.detailTextLabel?.text = "M195632453"
        
        makeCell.textLabel?.text = "Make:"
        makeCell.detailTextLabel?.text = "M3idjf45"
        
        modelCell.textLabel?.text = "Model:"
        modelCell.detailTextLabel?.text = "HJH5634-5"
        
        measurementOptionCell.textLabel?.text = "Measurement Option:"
        measurementOptionCell.detailTextLabel?.text = "Flow Meter(1)"
        
//        dateCell.textLabel?.text = "Date:"
//        dateCell.detailTextLabel?.text = "Sept 23, 2016"
        
        readingCell.textLabel?.text = "Measurement"
        readingCell.detailTextLabel?.text = "345689 0.001 AF"
        readingCell.detailTextLabel?.textColor = UIColor.black
        
        technichianCell.textLabel?.text = "Collected by:"
        technichianCell.detailTextLabel?.text = "Jason D."
    }
    
    func configureTitle(){
        self.title = "Sept. 23, 2016"
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
