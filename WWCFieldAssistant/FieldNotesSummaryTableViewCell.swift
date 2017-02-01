//
//  FieldNotesSummaryTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/30/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class FieldNotesSummaryTableViewCell: UITableViewCell {
    // MARK: - Properties
    var well: Well?
    var fieldNotes: [FieldNote] {
        return self.well?.fieldNotes.flatMap{$0 as? FieldNote} ?? []
    }
    
    var tableView: UITableView {
        if _tableView == nil {
            _tableView = UITableView()
        }
        return _tableView!
    }
    
    var _tableView: UITableView? = nil
    
    func configureCell<T: UIViewController> (parentView: T){
        let castView = parentView as? WellSummaryTableViewController
        self.well = castView?.well
        configureTableView(parentView: parentView)
        NotificationCenter.default.addObserver(self, selector: #selector(updateFieldNote), name: Notification.Name(rawValue: "FieldNoteUpdated"), object: nil)
    }
    
    func updateFieldNote(){
        self.tableView.reloadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func configureTableView<T: UIViewController>(parentView: T){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight =  UITableViewAutomaticDimension
        contentView.addSubview(tableView)
        
        // Layout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .topMargin, multiplier: 1.0, constant: 0)
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
        if  self.well == nil || self.fieldNotes.count == 0 {
            let view = UIView(frame: self.contentView.frame)
            view.backgroundColor = UIColor.white
            tableView.backgroundView = view
            tableView.separatorStyle = .none
            let label = UILabel()
            label.text = "No notes available"
            label.textColor = UIColor.lightGray
            label.translatesAutoresizingMaskIntoConstraints = false
            view.insertSubview(label, at: 0)
            let centerY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
            let centerX = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
            view.addConstraints([centerY, centerX])
            return 0
        } else {
            tableView.separatorStyle = .none
        tableView.backgroundView = nil
        return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fieldNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FieldNoteTableViewCell()
        let fieldNote = self.fieldNotes[indexPath.row]
        cell.configureCellWith(date: fieldNote.date as Date,note: fieldNote.note)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

