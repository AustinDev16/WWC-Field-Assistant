//
//  FieldNotesTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/22/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class FieldNotesTableViewCell: UITableViewCell {

    // MARK: - Cell Elements
    let fieldNotesTextView = UITextView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(){
     self.contentView.addSubview(fieldNotesTextView)
        
        setUpFieldNotesTextView()
    }
    
    func setUpFieldNotesTextView(){
        fieldNotesTextView.autocapitalizationType = .sentences
        fieldNotesTextView.autocorrectionType = .default
        fieldNotesTextView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        fieldNotesTextView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: fieldNotesTextView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: fieldNotesTextView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: fieldNotesTextView, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: fieldNotesTextView, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([top, bottom, leading, trailing])
    }
}

