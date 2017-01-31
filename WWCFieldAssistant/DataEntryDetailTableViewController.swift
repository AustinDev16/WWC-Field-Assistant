//
//  DataEntryDetailTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/16/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class DataEntryDetailTableViewController: UITableViewController {
    // MARK: - Properties
    var dataEntry: DataEntry?
    
    let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0: return 2 // Meter info
        case 1: return 4 // Reading
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
        case 0: return "Reading"
        case 1: return "Meter info"
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
            //case 0: return dateCell
            case 0: return readingCell
            case 1: return technichianCell
            default: return UITableViewCell()
            }

        case 1:// Reading
            switch indexPath.row {
            case 0: return serialNumberCell
            case 1: return metalNameTagCell
            case 2: return makeCell
            case 3: return modelCell
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

    func updateWithDataEntry(dataEntry: DataEntry){
        self.dataEntry = dataEntry
        configureStaticCells()
        self.title = dateFormatter.string(from: dataEntry.dateCollected as Date)
    }
    
    func configureStaticCells(){
        
        guard let dataEntry = self.dataEntry else { return }
        // Construct cells
        //wellNameCell.textLabel?.text = "WMIS # 100045 - Camel Well"
        locationCell.textLabel?.text = "Location: PLS"
        metalNameTagCell.textLabel?.text = "Metal Tag #: "
        metalNameTagCell.detailTextLabel?.text = dataEntry.well.metalTag
        
        serialNumberCell.textLabel?.text = "Serial #:"
        serialNumberCell.detailTextLabel?.text = dataEntry.serialNumber
        
        makeCell.textLabel?.text = "Make:"
        makeCell.detailTextLabel?.text = dataEntry.make
        
        modelCell.textLabel?.text = "Model:"
        modelCell.detailTextLabel?.text = dataEntry.model
        
        measurementOptionCell.textLabel?.text = "Measurement Option:"
        measurementOptionCell.detailTextLabel?.text = dataEntry.well.measurementOption
        
//        dateCell.textLabel?.text = "Date:"
//        dateCell.detailTextLabel?.text = "Sept 23, 2016"
        
        readingCell.textLabel?.text = "Measurement:"
        readingCell.detailTextLabel?.text = "\(dataEntry.meterReading) \(dataEntry.multiplier) \(dataEntry.unitTypeString)"
        readingCell.detailTextLabel?.textColor = UIColor.black
        
        technichianCell.textLabel?.text = "Collected by:"
        technichianCell.detailTextLabel?.text = "Jason D."
    }
}
