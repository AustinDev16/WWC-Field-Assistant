//
//  CameraOptionsTableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/16/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class CameraOptionsTableViewController: UITableViewController {

    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add a photo from:"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.tableView.isScrollEnabled = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cameraCell")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cameraCell")
        }
        // Configure the cell...
        if indexPath.row == 0 {
            cell?.textLabel?.text = "Camera"
            cell?.tag = 0
        } else {
            cell?.textLabel?.text = "Media Library"
            cell?.tag = 1
        }
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.cellForRow(at: indexPath) else { return }
        switch selectedCell.tag {
        case 0:
            let vc = AddNewFieldPhotoViewController()
            vc.modalPresentationStyle = .pageSheet
            present(vc, animated: true, completion: nil)
            vc.launchImagePickerWith(type: .camera)
        case 1:
            
            let vc = AddNewFieldPhotoViewController()
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .pageSheet
            present(nc, animated: true, completion: nil)
            vc.launchImagePickerWith(type: .photoLibrary)
        default:
            return
        }
    }
    
}

extension CameraOptionsTableViewController {
    // Photo selection
    func launchImagePickerWith(type: UIImagePickerControllerSourceType){
        imagePicker.sourceType = type
        imagePicker.allowsEditing = false
        imagePicker.modalPresentationStyle = .popover
        present(imagePicker, animated: true, completion: nil)
        let popoverController = imagePicker.popoverPresentationController
        
        popoverController?.sourceView = self.view
        
        
    }
}
