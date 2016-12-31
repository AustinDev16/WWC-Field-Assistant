//
//  MakeAndModelTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/28/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class MakeAndModelTableViewCell: UITableViewCell {

    // MARK: - Properties
    let resetMake: String? = nil
    let resetModel: String? = nil
    
    // MARK: - Cell Elements
    let makeLabel = UILabel()
    let makeTextField = UITextField()
    let modelLabel = UILabel()
    let modelTextField = UITextField()
    let resetButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - View Configuration
    func configureCell(){
        // Add subviews
        self.contentView.addSubview(makeLabel)
        self.contentView.addSubview(makeTextField)
        self.contentView.addSubview(modelLabel)
        self.contentView.addSubview(modelTextField)
        self.contentView.addSubview(resetButton)
        
        // Configure
        setUpMakeLabel()
        setUpMakeTextField()
        
        setUpModelLabel()
        setUpModelTextField()
        
        setUpResetButton()
        
    }
    
    func setUpMakeLabel(){
        
        makeLabel.text = "Make:"
        //makeLabel.textAlignment = .left
        
        makeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = NSLayoutConstraint(item: makeLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: makeLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: makeLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: makeLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 70)
        self.contentView.addConstraints([leading, top, bottom, width])
        
    }
    
    func setUpMakeTextField(){
        makeTextField.text = "M1896425"
        makeTextField.textAlignment = .left
        makeTextField.clearButtonMode = .always
        
        makeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        let leading = NSLayoutConstraint(item: makeTextField, attribute: .leading, relatedBy: .equal, toItem: makeLabel, attribute: .trailing, multiplier: 1.0, constant: 4.0)
        let trailing = NSLayoutConstraint(item: makeTextField, attribute: .trailing, relatedBy: .equal, toItem: modelLabel, attribute: .leading, multiplier: 1.0, constant: -12.0)
        let top = NSLayoutConstraint(item: makeTextField, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: makeTextField, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([leading, trailing, top, bottom])
        
    }
    
    func setUpModelLabel(){
        
        modelLabel.text = "Model:"
        
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = NSLayoutConstraint(item: modelLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .centerXWithinMargins, multiplier: 1.0, constant: -56.0)
        let top = NSLayoutConstraint(item: modelLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: modelLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: modelLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.0, constant: 100)
        self.contentView.addConstraints([leading, top, bottom, width])
    }
    
    func setUpModelTextField(){
        modelTextField.text = "D45t67280"
        modelTextField.textAlignment = .left
        modelTextField.clearButtonMode = .always
        
        modelTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = NSLayoutConstraint(item: modelTextField, attribute: .leading, relatedBy: .equal, toItem: modelLabel, attribute: .trailing, multiplier: 1.0, constant: 4.0)
        let trailing = NSLayoutConstraint(item: modelTextField, attribute: .trailing, relatedBy: .equal, toItem: self.resetButton, attribute: .leading, multiplier: 1.0, constant: -4.0)
        let top = NSLayoutConstraint(item: modelTextField, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: modelTextField, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
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
        makeTextField.text = self.resetMake ?? "Error"
        modelTextField.text = self.resetModel ?? "Error"
    }
    

}
