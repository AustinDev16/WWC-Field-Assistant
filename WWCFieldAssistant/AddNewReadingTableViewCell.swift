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
    let clearButton = UIButton()//(type: .roundedRect)
    
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
        self.contentView.addSubview(clearButton)
        self.contentView.addSubview(multiplierUnitPicker)

        setUpReadingTextField()
        setUpMultiplierUnitPicker()
        setUpClearButton()
    }
    
    func setUpReadingTextField(){
        readingTextField.placeholder = "Tap to enter flow reading"
        readingTextField.borderStyle = .none
        readingTextField.keyboardType = .numbersAndPunctuation
        readingTextField.textAlignment = .right
        readingTextField.minimumFontSize = 16
        
        // ReadingTextField
        readingTextField.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: readingTextField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: readingTextField, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .topMargin, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: readingTextField, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: readingTextField, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.30, constant: 0)
        self.contentView.addConstraints([leading, top, bottom, width])
    }
    
    func setUpClearButton(){
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(UIColor.red, for: .normal)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        //clearButton.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        let trailing = NSLayoutConstraint(item: clearButton, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: clearButton, attribute: .height, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 40)
        let width = NSLayoutConstraint(item: clearButton, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 80)
        let centerY = NSLayoutConstraint(item: clearButton, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([trailing, height, width, centerY])
    }

    func setUpMultiplierUnitPicker(){
        multiplierUnitPicker.translatesAutoresizingMaskIntoConstraints = false
        multiplierUnitPicker.dataSource = self
        multiplierUnitPicker.delegate = self
        
        
        let leading = NSLayoutConstraint(item: multiplierUnitPicker, attribute: .leading, relatedBy: .equal, toItem: readingTextField, attribute: .trailing, multiplier: 1.0, constant: 4)
        let top = NSLayoutConstraint(item: multiplierUnitPicker, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: multiplierUnitPicker, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: multiplierUnitPicker, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 230)
        self.contentView.addConstraints([leading, top, bottom, width])
    }
    
    // MARK: Internal methods
    @objc private func clearButtonTapped(){
        readingTextField.text = nil
    }

}

extension AddNewReadingTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return 4
        case 1: return 2
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            // first one
            switch row {
            case 0: return Multiplier.one.rawValue.stringRepresentation()
            case 1: return Multiplier.tenth.rawValue.stringRepresentation()
            case 2: return Multiplier.hundreth.rawValue.stringRepresentation()
            case 3: return Multiplier.thousandeth.rawValue.stringRepresentation()
            default: return "Error with multiplier enum"
            }
        case 1:
            // second one
            switch row {
            case 0: return MeterUnitType.acreFeet.rawValue
            case 1: return MeterUnitType.gallons.rawValue
            default: return "Error with unit type"
            }
        default: return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 110
    }
}
