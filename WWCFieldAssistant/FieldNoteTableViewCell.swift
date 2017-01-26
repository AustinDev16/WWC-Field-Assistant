//
//  FieldNoteTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/26/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class FieldNoteTableViewCell: UITableViewCell {

    // MARK: - Properties
    // MARK: - View elements
    let dateLabel = UILabel()
    let note = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    // MARK: - Functions
    func configureCellWith(date: Date, note: String){
        layoutViews()
        
        let dateString = formatter.string(from: date)
        let noteText = "\(dateString) - \(note)"
        self.note.text = noteText
    }
    
    func layoutViews(){
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(note)
        
        // date label
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // note
        note.numberOfLines = 0
        note.textAlignment = .justified

        note.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: note, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: note, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: note, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: note, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([leading, top, bottom, trailing])
    }

}
