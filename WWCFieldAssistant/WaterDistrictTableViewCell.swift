//
//  WaterDistrictTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/25/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class WaterDistrictTableViewCell: UITableViewCell {
    // MARK: - Cell elements
    let descriptiveLabel = UILabel()
    let dataString = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(leftLabel: String, data: String){
        self.contentView.addSubview(descriptiveLabel)
        self.contentView.addSubview(dataString)
        
        
        layoutCellElements()
        
        descriptiveLabel.text = leftLabel
        descriptiveLabel.textAlignment = .left
        dataString.text = data
        dataString.textAlignment = .right
    }
    
    func layoutCellElements(){
        descriptiveLabel.translatesAutoresizingMaskIntoConstraints = false
        // Label
        let labelLeading = NSLayoutConstraint(item: descriptiveLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
        let labelCenterY = NSLayoutConstraint(item: descriptiveLabel, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0)
        let labelWidth = NSLayoutConstraint(item: descriptiveLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 120)
        self.contentView.addConstraints([labelLeading, labelCenterY, labelWidth])
        
        // Data string
        dataString.translatesAutoresizingMaskIntoConstraints = false
        let dataTrailing = NSLayoutConstraint(item: dataString, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
        let dataCenterY = NSLayoutConstraint(item: dataString, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0)
        let dataLeading = NSLayoutConstraint(item: dataString, attribute: .leading, relatedBy: .equal, toItem: descriptiveLabel, attribute: .trailing, multiplier: 1.0, constant: 8)
        self.contentView.addConstraints([dataTrailing, dataCenterY, dataLeading])
    }

}
