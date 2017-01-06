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
    weak var updateSelectedDistrictDelegate: DistrictUpdateDelegate?
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()

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
