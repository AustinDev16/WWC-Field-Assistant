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
        tableView.rowHeight =  UITableViewAutomaticDimension
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
        if true {
            let view = UIView(frame: self.contentView.frame)
            view.backgroundColor = UIColor.white
            tableView.backgroundView = view
            let label = UILabel()
            label.text = "No notes available"
            label.textColor = UIColor.lightGray
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            let centerY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
            let centerX = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
            view.addConstraints([centerY, centerX])
            return 0
        } else {
        tableView.backgroundView = nil
        return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FieldNoteTableViewCell()
        cell.configureCellWith(date: Date(), note: "text alsdkjf ajsk djakjs djsk fjak fue feisj fjjsij tjhejsk tistu sjti af ajf s fjiej")
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
}

