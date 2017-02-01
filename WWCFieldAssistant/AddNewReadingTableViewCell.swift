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
    
    weak var savableDelegate: NewDataEntrySavable?
    
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
        readingTextField.becomeFirstResponder()
        
        readingTextField.addTarget(self, action: #selector(updateReadingTextOnDelegate), for: .editingChanged)
        setDefaultPickerValues()
        
        NotificationCenter.default.addObserver(self, selector: #selector(resignResponder), name: Notification.Name(rawValue: "ResignResponderNewEntry"), object: nil)
    }
    
    func resignResponder(){
        readingTextField.resignFirstResponder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setDefaultPickerValues(){
        guard let defaultSktn = self.savableDelegate?.defaultSkeleton else {return}
        let multiplierString = defaultSktn.multiplier.rawValue.stringRepresentation()
        var numberOfRows = multiplierUnitPicker.numberOfRows(inComponent: 0)
        for i in 0...(numberOfRows - 1) {
            let title = self.pickerView(multiplierUnitPicker, titleForRow: i, forComponent: 0)
            if title != nil && title! == multiplierString {
                    multiplierUnitPicker.selectRow(i, inComponent: 0, animated: false)
            }
        }
        
        let unitString = defaultSktn.unit.rawValue
        numberOfRows = multiplierUnitPicker.numberOfRows(inComponent: 1)
        for i in 0...(numberOfRows - 1) {
            let unitTitle = self.pickerView(multiplierUnitPicker, titleForRow: i, forComponent: 1)
            if unitTitle != nil && unitTitle! == unitString {
                multiplierUnitPicker.selectRow(i, inComponent: 1, animated: false)
            }
        }
        
    }
    /// Updates the skeleton with the reading 
    func updateReadingTextOnDelegate(){
        guard let text = readingTextField.text else { self.savableDelegate?.workingSkeleton?.reading = ""; return}
        self.savableDelegate?.workingSkeleton?.reading = text
    }
    
    func setUpReadingTextField(){
        readingTextField.placeholder = "Meter reading"
        readingTextField.borderStyle = .none
        readingTextField.keyboardType = .numbersAndPunctuation
        readingTextField.textAlignment = .center
        readingTextField.minimumFontSize = 16
        readingTextField.layer.borderWidth = 2
        readingTextField.layer.borderColor = UIColor.red.withAlphaComponent(0.7).cgColor
        readingTextField.layer.cornerRadius = 5
        
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
        clearButton.setTitleColor(UIColor.blue, for: .normal)
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
        case 0: return 6
        case 1: return 2
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            // first one
            switch row {
            case 0: return Multiplier.million.rawValue.stringRepresentation()
            case 1: return Multiplier.thousand.rawValue.stringRepresentation()
            case 2: return Multiplier.one.rawValue.stringRepresentation()
            case 3: return Multiplier.tenth.rawValue.stringRepresentation()
            case 4: return Multiplier.hundreth.rawValue.stringRepresentation()
            case 5: return Multiplier.thousandeth.rawValue.stringRepresentation()
            default: return "Error with multiplier enum"
            }
        case 1:
            // second one
            switch row {
            case 0: return MeterUnitType.gallons.rawValue
            case 1: return MeterUnitType.acreFeet.rawValue
            default: return "Error with unit type"
            }
        default: return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 110
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Update selection with delegate
        let multiplierIndex = multiplierUnitPicker.selectedRow(inComponent: 0)
        var multiplierString = self.pickerView(multiplierUnitPicker, titleForRow: multiplierIndex, forComponent: 0)
        
        // TODO: - FIX THIS FORCE UNWRAPPING/ ENUMS
        if multiplierString == "1 million" {
            multiplierString = "1000000"
        }
        self.savableDelegate?.workingSkeleton?.multiplier = Multiplier(rawValue: Double(multiplierString!)!)!
        let unitIndex = multiplierUnitPicker.selectedRow(inComponent: 1)
        let unitString = self.pickerView(multiplierUnitPicker, titleForRow: unitIndex, forComponent: 1)
        self.savableDelegate?.workingSkeleton?.unit = MeterUnitType(rawValue: unitString!)!
        
        
        if component == 0 {
            // pick a multiplier
            let unitIndex = self.multiplierUnitPicker.selectedRow(inComponent: 1)
            switch unitIndex {
            case 0: // Gallons
                if row > 1 {
                    self.multiplierUnitPicker.selectRow(2, inComponent: 0, animated: false)
                }
            case 1: // AcreFeet
                if row < 2 {
                    self.multiplierUnitPicker.selectRow(2, inComponent: 0, animated: false)
                }
            default: return
            }
        } else {
            // pick a unit
            let multiplierIndex = self.multiplierUnitPicker.selectedRow(inComponent: 0)
            switch row {
            case 0:
                if multiplierIndex > 1 {
                    self.multiplierUnitPicker.selectRow(2, inComponent: 0, animated: false)
                }
            case 1:
                if multiplierIndex < 2 {
                    self.multiplierUnitPicker.selectRow(2, inComponent: 0, animated: false)
                }
            default: return
            }
        }
    }
}
