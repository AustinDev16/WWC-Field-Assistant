//
//  WellSummaryTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/10/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class WellSummaryTableViewController: UITableViewController {

    // MARK: - Properties
    var well: Well?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isScrollEnabled = false

        NotificationCenter.default.addObserver(self, selector: #selector(self.updateSelectedWell(notification:)), name: Notification.Name(rawValue: "SelectedWellUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.resetDataEntryView(notification:)), name: Notification.Name(rawValue:"SelectedDistrictUpdated"), object: nil)


    }
    
    // MARK: - Notification functions
    
    func updateSelectedWell(notification: Notification){
        guard let well = notification.object as? Well else { return }
        self.title = "WMIS# \(well.wmisNumber) Summary"
        updateWith(selectedWell: well)
        
    }
    
    func resetDataEntryView(notification: Notification){
        self.well = nil
        self.tableView.reloadData()
    }

    // MARK: - Static cells
    
    func returnCellFor(indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = FieldNotesTableViewCell()
            cell.configureCell()
            cell.disableEditingOnTextView()
            return cell
        case 1:
            let cell = FieldPhotoTableViewCell()
            cell.configureCell()
            return cell
        case 2:
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = "Data Entries"
            return cell
        default: return UITableViewCell()
        }
    }
    
    func updateWith(selectedWell: Well){
        self.well = selectedWell
        self.tableView.reloadData()
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
            self.title = "Well Summary"
            
            
            return 0
        } else {
            self.tableView.backgroundView = nil
            return 3
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        let cell = returnCellFor(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Notes"
        case 1: return "Field Photos"
        default: return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            guard let selectedWell = self.well else { return }
            let backButton = UIBarButtonItem()
            backButton.title = "Summary"
            navigationItem.backBarButtonItem = backButton
            let dataEntryList = DataEntryListTableViewController()
            dataEntryList.updateWith(selectedWell: selectedWell)
            self.navigationController?.pushViewController(dataEntryList, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 160
        case 1: return 160
        case 2: return 60
        default: return 20
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 40} else { return 24}
    }

}
