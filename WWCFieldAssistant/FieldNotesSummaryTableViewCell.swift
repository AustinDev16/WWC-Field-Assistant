//
//  FieldNotesSummaryTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/30/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class FieldNotesSummaryTableViewCell: UITableViewCell {
    
    func configureCell<T: UIViewController> (parentView: T){
        configureTableView(parentView: parentView)
    }
    
    func configureTableView<T: UIViewController>(parentView: T){
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        contentView.addSubview(tableView)
        
        // Layout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([top, bottom, leading, trailing])
//       parentView.addChildViewController(tableView)
//        tableView.didMove(toParentViewController: parentView)
    }
}

extension FieldNotesSummaryTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Test entry"
        return cell
    }
    
}

