//
//  AddNewReadingTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/21/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class AddNewReadingTableViewCell: UITableViewCell {

    // MARK: - Elements
    let multiplierUnitPicker = UIPickerView()
    let readingTextField = UITextField()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(){
        // Add subviews
        self.contentView.addSubview(readingTextField)
        self.contentView.addSubview(multiplierUnitPicker)
        setUpReadingTextField()
        setUpMultiplierUnitPicker()
    }
    func setUpReadingTextField(){
        readingTextField.placeholder = "Tap to enter flow reading"
        readingTextField.borderStyle = .roundedRect
        // ReadingTextField
        readingTextField.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: readingTextField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: readingTextField, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: readingTextField, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: readingTextField, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.5, constant: 0)
        self.contentView.addConstraints([leading, top, bottom, width])
    }

    func setUpMultiplierUnitPicker(){
        multiplierUnitPicker.translatesAutoresizingMaskIntoConstraints = false
        multiplierUnitPicker.dataSource = self
        multiplierUnitPicker.delegate = self
        
        
        let leading = NSLayoutConstraint(item: multiplierUnitPicker, attribute: .leading, relatedBy: .equal, toItem: readingTextField, attribute: .trailing, multiplier: 1.0, constant: 8)
        let top = NSLayoutConstraint(item: multiplierUnitPicker, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: multiplierUnitPicker, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: multiplierUnitPicker, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([leading, top, bottom, trailing])
    }
}

extension AddNewReadingTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "The view"
    }
}
