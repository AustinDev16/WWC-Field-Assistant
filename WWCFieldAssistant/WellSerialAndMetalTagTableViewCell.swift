//
//  WellSerialAndMetalTagTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/22/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class WellSerialAndMetalTagTableViewCell: UITableViewCell {

    // MARK: - Properties
    var resetSerial: String? = nil
    var resetMetalTag: String? = nil
    
    // MARK: - Cell Elements
    let serialNumberLabel = UILabel()
    let metalTagNumberLabel = UILabel()
    let serialNumberTextField = UITextField()
    let metalTagTextField = UITextField()
    let resetButton = UIButton()
    
    
    
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
        self.contentView.addSubview(serialNumberLabel)
        self.contentView.addSubview(metalTagNumberLabel)
        self.contentView.addSubview(serialNumberTextField)
        self.contentView.addSubview(metalTagTextField)
        self.contentView.addSubview(resetButton)
        
        // Configure
        setUpSerialNumberLabel()
        setUpSerialNumberTextField()
        
        setUpMetalTagLabel()
        setUpMetalTagTextField()
        
        setUpResetButton()

    }
    
    func setUpSerialNumberLabel(){
        
        serialNumberLabel.text = "Serial #:"
        //serialNumberLabel.textAlignment = .left
        
        serialNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = NSLayoutConstraint(item: serialNumberLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: serialNumberLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: serialNumberLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: serialNumberLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 70)
        self.contentView.addConstraints([leading, top, bottom, width])
        
    }
    
    func setUpSerialNumberTextField(){
        serialNumberTextField.text = "M1896425"
        serialNumberTextField.textAlignment = .left
        serialNumberTextField.clearButtonMode = .always
        
        serialNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        let leading = NSLayoutConstraint(item: serialNumberTextField, attribute: .leading, relatedBy: .equal, toItem: serialNumberLabel, attribute: .trailing, multiplier: 1.0, constant: 4.0)
        let trailing = NSLayoutConstraint(item: serialNumberTextField, attribute: .trailing, relatedBy: .equal, toItem: metalTagNumberLabel, attribute: .leading, multiplier: 1.0, constant: -12.0)
        let top = NSLayoutConstraint(item: serialNumberTextField, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: serialNumberTextField, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([leading, trailing, top, bottom])
        
    }
    
    func setUpMetalTagLabel(){
        
        metalTagNumberLabel.text = "Metal tag#:"
        
        metalTagNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = NSLayoutConstraint(item: metalTagNumberLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .centerXWithinMargins, multiplier: 1.0, constant: -56.0)
        let top = NSLayoutConstraint(item: metalTagNumberLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: metalTagNumberLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: metalTagNumberLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 100)
        self.contentView.addConstraints([leading, top, bottom, width])
    }
    
    func setUpMetalTagTextField(){
        metalTagTextField.text = "D45t67280"
        metalTagTextField.textAlignment = .left
        metalTagTextField.clearButtonMode = .always
        
        metalTagTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = NSLayoutConstraint(item: metalTagTextField, attribute: .leading, relatedBy: .equal, toItem: metalTagNumberLabel, attribute: .trailing, multiplier: 1.0, constant: 4.0)
        let trailing = NSLayoutConstraint(item: metalTagTextField, attribute: .trailing, relatedBy: .equal, toItem: self.resetButton, attribute: .leading, multiplier: 1.0, constant: -4.0)
        let top = NSLayoutConstraint(item: metalTagTextField, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: metalTagTextField, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([leading, trailing, top, bottom])
    }
    
    func setUpResetButton(){
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(UIColor.blue, for: .normal)
        //editButton.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        let width = NSLayoutConstraint(item: resetButton, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 80)
        let height = NSLayoutConstraint(item: resetButton, attribute: .height, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 40)
        let centerY = NSLayoutConstraint(item: resetButton, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: resetButton, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([width, height, centerY, trailing])
    }
    
    @objc func resetButtonTapped(){
        serialNumberTextField.text = self.resetSerial ?? "Error"
        metalTagTextField.text = self.resetMetalTag ?? "Error"
    }
    


}
